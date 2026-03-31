"""
    sunburst(data)

Creates an `EChart` sunburst (multi-level pie) chart displaying hierarchical data as
concentric rings, where each ring corresponds to a level in the hierarchy.

## Methods
```julia
sunburst(data::AbstractVector)
```

## Arguments
* `data` : hierarchical data as a vector of dicts, each with `name`, `value`, and
  optionally `children` for nested levels
* `kwargs` : varargs to set any field of resulting `EChart` struct

"""
function sunburst(data::AbstractVector; kwargs...)
    ec = newplot(kwargs, ec_charttype = "sunburst")
    ec.series = [SunburstSeries(data = data)]
    return ec
end
