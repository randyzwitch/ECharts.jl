"""
    aria!(ec)

Adds or modifies [ARIA](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA) (Accessible Rich Internet Applications) settings for an `EChart`.

## Methods
```julia
aria!(ec::EChart; show, description, general, series, data)
```

## Arguments
* `show::Bool = true` : enable ARIA
* `description::Union{String, Nothing} = nothing` : custom description for screen readers
* `general::Union{Dict, Nothing} = nothing` : general ARIA configuration dict
* `series::Union{Dict, Nothing} = nothing` : per-series ARIA configuration dict
* `data::Union{Dict, Nothing} = nothing` : per-data ARIA configuration dict

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
aria!(b)
```
"""
function aria!(ec::EChart; show::Bool = true, description::Union{String, Nothing} = nothing, general::Union{Dict, Nothing} = nothing, series::Union{Dict, Nothing} = nothing, data::Union{Dict, Nothing} = nothing)

    ec.aria = Aria(show = show, description = description, general = general, series = series, data = data)
    return ec

end
