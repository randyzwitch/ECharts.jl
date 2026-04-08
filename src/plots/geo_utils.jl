"""
    _resolve_map_geojson(map, geojson) -> Union{String, Nothing}

Resolve the GeoJSON string for a geographic map name. Resolution order:

1. If `geojson` is provided, use it directly.
2. If `map == "world"`, load from the bundled world artifact.
3. Otherwise, look for `\$(map).json` in the country_maps artifact (215 countries/regions
   sourced from echarts-countries-js v1.0.5, commit 49033e3).
4. Return `nothing` if no match is found (caller must supply `geojson`).

Country map names match the filenames in the artifact, e.g. `"Germany"`, `"USA"`,
`"Antigua_and_Barbuda"`. Names are case-sensitive.
"""
function _resolve_map_geojson(map::String, geojson::Union{AbstractString, Nothing})
    if !isnothing(geojson)
        return String(geojson)
    elseif map == "world"
        return read(joinpath(artifact"world", "world.json"), String)
    else
        country_file = joinpath(artifact"country_maps", "country_maps", "$(map).json")
        if isfile(country_file)
            return read(country_file, String)
        end
        return nothing
    end
end
