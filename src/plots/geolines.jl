"""
    geolines(start_lon, start_lat, end_lon, end_lat; ...)

Creates an `EChart` lines chart overlaid on a geographic map, drawing one line segment
between each `(start_lon, start_lat)` → `(end_lon, end_lat)` coordinate pair. Useful for
visualising routes, flows, migrations, or connections between geographic locations.

## Methods
```julia
geolines(start_lon::AbstractVector{<:Real}, start_lat::AbstractVector{<:Real},
         end_lon::AbstractVector{<:Real},   end_lat::AbstractVector{<:Real})
geolines(df, start_lon::Symbol, start_lat::Symbol, end_lon::Symbol, end_lat::Symbol)
```

## Arguments
* `map::String = "world"` : map name. `"world"` uses the built-in world map. 215 individual
  country/region maps (e.g. `"Germany"`, `"USA"`, `"Antigua_and_Barbuda"`) are also available
  automatically via the bundled country_maps artifact. For any other map, supply a GeoJSON
  string via `geojson` and set `map` to the name you want to register it under.
* `geojson::Union{AbstractString, Nothing} = nothing` : raw GeoJSON string to register as a
  custom map under the name given by `map`.
* `roam::Bool = false` : enable map zoom and pan
* `effect::Bool = false` : animate a moving symbol along each line (uses ECharts
  `effect` with `trailLength` for a trail effect)
* `legend::Bool = false` : display legend
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes
Each row supplies one line segment. The start and end vectors must all have the same length.
"""
function geolines(start_lon::AbstractVector{<:Real},
                  start_lat::AbstractVector{<:Real},
                  end_lon::AbstractVector{<:Real},
                  end_lat::AbstractVector{<:Real};
                  map::String = "world",
                  geojson::Union{AbstractString, Nothing} = nothing,
                  roam::Bool = false,
                  effect::Bool = false,
                  legend::Bool = false,
                  kwargs...)

    length(start_lon) == length(start_lat) == length(end_lon) == length(end_lat) ||
        throw(ArgumentError("start_lon, start_lat, end_lon, and end_lat must all have the same length"))

    ec = newplot(kwargs, ec_charttype = "geolines")
    ec.geo = Geo(map = map, roam = roam, top = "60")

    # ECharts lines series on geo expects [{coords: [[lon1,lat1],[lon2,lat2]]}, ...]
    data = [Dict("coords" => [[start_lon[i], start_lat[i]], [end_lon[i], end_lat[i]]])
            for i in eachindex(start_lon)]

    effect_cfg = effect ? Dict("show" => true, "trailLength" => 0.4, "symbolSize" => 6) : nothing

    ec.series = [LinesSeries(coordinateSystem = "geo",
                             geoIndex = 0,
                             data = data,
                             effect = effect_cfg)]

    resolved_geojson = _resolve_map_geojson(map, geojson)

    if !isnothing(resolved_geojson)
        ec.ec_mapname = map
        ec.ec_mapdata = resolved_geojson
    end

    legend ? legend!(ec) : nothing

    return ec

end

"""
    geolines(df, start_lon, start_lat, end_lon, end_lat; ...)

Creates an `EChart` geographic lines chart from columns in table `df`.
See the primary `geolines` method for full argument documentation.
"""
function geolines(df,
                  start_lon::Symbol, start_lat::Symbol,
                  end_lon::Symbol,   end_lat::Symbol;
                  map::String = "world",
                  geojson::Union{AbstractString, Nothing} = nothing,
                  roam::Bool = false,
                  effect::Bool = false,
                  legend::Bool = false,
                  kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    return geolines(_table_col(df, start_lon), _table_col(df, start_lat),
                    _table_col(df, end_lon),   _table_col(df, end_lat);
                    map = map, geojson = geojson, roam = roam,
                    effect = effect, legend = legend, kwargs...)

end
