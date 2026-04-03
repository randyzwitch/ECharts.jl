"""
    choropleth(regions, values; ...)

Creates an `EChart` choropleth (filled map) chart, coloring geographic regions by a numeric value.

## Methods
```julia
choropleth(regions::AbstractVector, values::AbstractVector{<:Union{Missing, Real}})
choropleth(df, regions::Symbol, values::Symbol)
```

## Arguments
* `map::String = "world"` : map name. `"world"` uses the built-in world map bundled with this
  package. For any other map, supply a GeoJSON string via `geojson` and set `map` to the name
  you want to register it under.
* `geojson::Union{AbstractString, Nothing} = nothing` : raw GeoJSON string to register as a
  custom map under the name given by `map`. Compatible with any workflow that produces a GeoJSON
  string, including:
  - Reading a file directly: `read("regions.geojson", String)`
  - Serializing a `GeoJSON.jl` `FeatureCollection`: `JSON.json(feature_collection)`
  - Serializing a `GeoDataFrames.jl` or `Shapefile.jl` result via `GeoJSON.jl`
* `roam::Bool = false` : enable map zoom and pan
* `show::Bool = true` : show the visual map color scale
* `calculable::Bool = true` : allow dragging the color scale endpoints to filter the display
* `legend::Bool = false` : display legend
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

Region names in `regions` must match the names used in the map's GeoJSON `name` property.
For the bundled world map (`map = "world"`), names follow the ECharts convention
(e.g. `"United States"`, `"China"`, `"Brazil"`).

To use a custom map from a file on disk:
```julia
geojson_str = read("us_states.geojson", String)
choropleth(state_names, state_values; map = "US States", geojson = geojson_str)
```
"""
function choropleth(regions::AbstractVector,
                    values::AbstractVector{<:Union{Missing, Real}};
                    map::String = "world",
                    geojson::Union{AbstractString, Nothing} = nothing,
                    roam::Bool = false,
                    show::Bool = true,
                    calculable::Bool = true,
                    legend::Bool = false,
                    kwargs...)

    ec = newplot(kwargs, ec_charttype = "choropleth")

    data = arrayofdicts(name = regions, value = values)
    ec.series = [MapSeries(name = map, map = map, roam = roam, data = data)]

    non_missing = collect(skipmissing(values))
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

    resolved_geojson = if !isnothing(geojson)
        String(geojson)
    elseif map == "world"
        read(joinpath(@__DIR__, "..", "maps", "world.json"), String)
    else
        nothing
    end

    if !isnothing(resolved_geojson)
        ec.ec_mapname = map
        ec.ec_mapdata = resolved_geojson
    end

    legend ? legend!(ec) : nothing

    return ec

end

"""
    choropleth(df, regions, values; ...)

Creates an `EChart` choropleth map from columns `regions` and `values` in table `df`.
See the primary `choropleth` method for full argument documentation.
"""
function choropleth(df, regions::Symbol, values::Symbol;
                    map::String = "world",
                    geojson::Union{AbstractString, Nothing} = nothing,
                    roam::Bool = false,
                    show::Bool = true,
                    calculable::Bool = true,
                    legend::Bool = false,
                    kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    return choropleth(_table_col(df, regions), _table_col(df, values);
                      map = map, geojson = geojson, roam = roam,
                      show = show, calculable = calculable,
                      legend = legend, kwargs...)

end
