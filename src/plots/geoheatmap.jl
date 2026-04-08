"""
    geoheatmap(lon, lat, value; ...)

Creates an `EChart` heatmap overlaid on a geographic map. Each `(lon, lat, value)` triple
contributes intensity to the heatmap at that coordinate. A `VisualMap` colour scale is
added automatically.

## Methods
```julia
geoheatmap(lon::AbstractVector{<:Real}, lat::AbstractVector{<:Real},
           value::AbstractVector{<:Union{Missing, Real}})
geoheatmap(df, lon::Symbol, lat::Symbol, value::Symbol)
```

## Arguments
* `map::String = "world"` : map name. `"world"` uses the built-in world map. 215 individual
  country/region maps (e.g. `"Germany"`, `"USA"`, `"Antigua_and_Barbuda"`) are also available
  automatically via the bundled country_maps artifact. For any other map, supply a GeoJSON
  string via `geojson` and set `map` to the name you want to register it under.
* `geojson::Union{AbstractString, Nothing} = nothing` : raw GeoJSON string to register as a
  custom map under the name given by `map`.
* `roam::Bool = false` : enable map zoom and pan
* `blur_size::Int = 30` : pixel radius of the blur around each point (controls heatmap
  spread); maps to the ECharts `blurSize` field
* `show::Bool = true` : show the visual map colour scale
* `calculable::Bool = true` : allow dragging the colour scale endpoints to filter display
* `legend::Bool = false` : display legend
* `kwargs` : varargs to set any field of the resulting `EChart` struct
"""
function geoheatmap(lon::AbstractVector{<:Real},
                    lat::AbstractVector{<:Real},
                    value::AbstractVector{<:Union{Missing, Real}};
                    map::String = "world",
                    geojson::Union{AbstractString, Nothing} = nothing,
                    roam::Bool = false,
                    blur_size::Int = 30,
                    show::Bool = true,
                    calculable::Bool = true,
                    legend::Bool = false,
                    kwargs...)

    ec = newplot(kwargs, ec_charttype = "geoheatmap")
    ec.geo = Geo(map = map, roam = roam, top = "60")
    ec.series = [HeatmapSeries(coordinateSystem = "geo",
                               geoIndex = 0,
                               blurSize = blur_size,
                               data = arrayofarray(lon, lat, value))]

    non_missing = collect(skipmissing(value))
    if !isempty(non_missing)
        minval, maxval = extrema(non_missing)
        ec.visualMap = VisualMap(show = show,
                                 min = minval,
                                 max = maxval,
                                 calculable = calculable,
                                 orient = "vertical",
                                 right = "2%",
                                 top = "middle")
    end

    resolved_geojson = _resolve_map_geojson(map, geojson)

    if !isnothing(resolved_geojson)
        ec.ec_mapname = map
        ec.ec_mapdata = resolved_geojson
    end

    legend ? legend!(ec) : nothing

    return ec

end

"""
    geoheatmap(df, lon, lat, value; ...)

Creates an `EChart` geographic heatmap from columns `lon`, `lat`, and `value` in table `df`.
See the primary `geoheatmap` method for full argument documentation.
"""
function geoheatmap(df, lon::Symbol, lat::Symbol, value::Symbol;
                    map::String = "world",
                    geojson::Union{AbstractString, Nothing} = nothing,
                    roam::Bool = false,
                    blur_size::Int = 30,
                    show::Bool = true,
                    calculable::Bool = true,
                    legend::Bool = false,
                    kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    return geoheatmap(_table_col(df, lon), _table_col(df, lat), _table_col(df, value);
                      map = map, geojson = geojson, roam = roam,
                      blur_size = blur_size, show = show,
                      calculable = calculable, legend = legend, kwargs...)

end
