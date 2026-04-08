"""
    geoscatter(lon, lat; ...)
    geoscatter(lon, lat, value; ...)

Creates an `EChart` scatter plot overlaid on a geographic map, placing one symbol at each
`(lon, lat)` coordinate. When `value` is supplied, a `VisualMap` color scale is added and
each point is coloured by its value.

## Methods
```julia
geoscatter(lon::AbstractVector{<:Real}, lat::AbstractVector{<:Real})
geoscatter(lon::AbstractVector{<:Real}, lat::AbstractVector{<:Real},
           value::AbstractVector{<:Union{Missing, Real}})
geoscatter(df, lon::Symbol, lat::Symbol)
geoscatter(df, lon::Symbol, lat::Symbol, value::Symbol)
```

## Arguments
* `map::String = "world"` : map name. `"world"` uses the built-in world map. 215 individual
  country/region maps (e.g. `"Germany"`, `"USA"`, `"Antigua_and_Barbuda"`) are also available
  automatically via the bundled country_maps artifact. For any other map, supply a GeoJSON
  string via `geojson` and set `map` to the name you want to register it under.
* `geojson::Union{AbstractString, Nothing} = nothing` : raw GeoJSON string to register as a
  custom map under the name given by `map`.
* `roam::Bool = false` : enable map zoom and pan
* `symbol_size::Int = 10` : radius of each point symbol in pixels
* `show::Bool = true` : show the visual map colour scale (only relevant when `value` is given)
* `calculable::Bool = true` : allow dragging the colour scale endpoints (only with `value`)
* `legend::Bool = false` : display legend
* `kwargs` : varargs to set any field of the resulting `EChart` struct
"""
function geoscatter(lon::AbstractVector{<:Real}, lat::AbstractVector{<:Real};
                    map::String = "world",
                    geojson::Union{AbstractString, Nothing} = nothing,
                    roam::Bool = false,
                    symbol_size::Int = 10,
                    legend::Bool = false,
                    kwargs...)

    ec = newplot(kwargs, ec_charttype = "geoscatter")
    ec.geo = Geo(map = map, roam = roam, top = "60")
    ec.series = [XYSeries(_type = "scatter",
                          coordinateSystem = "geo",
                          geoIndex = 0,
                          data = arrayofarray(lon, lat),
                          symbolSize = symbol_size)]

    resolved_geojson = _resolve_map_geojson(map, geojson)

    if !isnothing(resolved_geojson)
        ec.ec_mapname = map
        ec.ec_mapdata = resolved_geojson
    end

    legend ? legend!(ec) : nothing

    return ec

end

"""
    geoscatter(lon, lat, value; ...)

Creates an `EChart` scatter plot on a geographic map where each point is coloured by
`value` via a `VisualMap` scale. See the primary `geoscatter` method for full argument
documentation.
"""
function geoscatter(lon::AbstractVector{<:Real},
                    lat::AbstractVector{<:Real},
                    value::AbstractVector{<:Union{Missing, Real}};
                    map::String = "world",
                    geojson::Union{AbstractString, Nothing} = nothing,
                    roam::Bool = false,
                    symbol_size::Int = 10,
                    show::Bool = true,
                    calculable::Bool = true,
                    legend::Bool = false,
                    kwargs...)

    ec = newplot(kwargs, ec_charttype = "geoscatter")
    ec.geo = Geo(map = map, roam = roam, top = "60")
    ec.series = [XYSeries(_type = "scatter",
                          coordinateSystem = "geo",
                          geoIndex = 0,
                          data = arrayofarray(lon, lat, value),
                          symbolSize = symbol_size)]

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
    geoscatter(df, lon, lat; ...)

Creates an `EChart` geographic scatter plot from columns `lon` and `lat` in table `df`.
See the primary `geoscatter` method for full argument documentation.
"""
function geoscatter(df, lon::Symbol, lat::Symbol;
                    map::String = "world",
                    geojson::Union{AbstractString, Nothing} = nothing,
                    roam::Bool = false,
                    symbol_size::Int = 10,
                    legend::Bool = false,
                    kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    return geoscatter(_table_col(df, lon), _table_col(df, lat);
                      map = map, geojson = geojson, roam = roam,
                      symbol_size = symbol_size, legend = legend, kwargs...)

end

"""
    geoscatter(df, lon, lat, value; ...)

Creates an `EChart` geographic scatter plot from columns `lon`, `lat`, and `value` in
table `df`, colouring each point by `value`. See the primary `geoscatter` method for full
argument documentation.
"""
function geoscatter(df, lon::Symbol, lat::Symbol, value::Symbol;
                    map::String = "world",
                    geojson::Union{AbstractString, Nothing} = nothing,
                    roam::Bool = false,
                    symbol_size::Int = 10,
                    show::Bool = true,
                    calculable::Bool = true,
                    legend::Bool = false,
                    kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    return geoscatter(_table_col(df, lon), _table_col(df, lat), _table_col(df, value);
                      map = map, geojson = geojson, roam = roam,
                      symbol_size = symbol_size, show = show,
                      calculable = calculable, legend = legend, kwargs...)

end
