"""
    aria!(ec)

Adds or modifies [ARIA](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA) (Accessible Rich Internet Applications) settings for an `EChart`.

## Methods
```julia
aria!(ec::EChart; enabled, description, general, series, data, decal)
```

## Arguments
* `enabled::Bool = true` : enable ARIA
* `description::Union{String, Nothing} = nothing` : custom description for screen readers
* `general::Union{Dict, Nothing} = nothing` : general ARIA label configuration dict
* `series::Union{Dict, Nothing} = nothing` : per-series ARIA label configuration dict
* `data::Union{Dict, Nothing} = nothing` : per-data ARIA label configuration dict
* `decal::Union{Dict, Nothing} = nothing` : decal pattern configuration dict (v5+)

"""
function aria!(ec::EChart; enabled::Bool = true, description::Union{String, Nothing} = nothing,
               general::Union{Dict, Nothing} = nothing, series::Union{Dict, Nothing} = nothing,
               data::Union{Dict, Nothing} = nothing, decal::Union{Dict, Nothing} = nothing)

    label_config = Dict{String,Any}()
    description !== nothing && (label_config["description"] = description)
    general !== nothing && (label_config["general"] = general)
    series !== nothing && (label_config["series"] = series)
    data !== nothing && (label_config["data"] = data)

    ec.aria = Aria(enabled = enabled,
                   label = isempty(label_config) ? nothing : label_config,
                   decal = decal)
    return ec

end
