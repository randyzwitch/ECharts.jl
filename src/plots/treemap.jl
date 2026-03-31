"""
    treemap(data)

Creates an `EChart` treemap chart displaying hierarchical data as nested rectangles,
where rectangle size encodes a quantitative value.

## Methods
```julia
treemap(data::AbstractVector)
```

## Arguments
* `data` : hierarchical data as a vector of dicts, each with `name`, `value`, and
  optionally `children` for nested groups
* `kwargs` : varargs to set any field of resulting `EChart` struct

"""
function treemap(data::AbstractVector; kwargs...)
    ec = newplot(kwargs, ec_charttype = "treemap")
    ec.series = [TreemapSeries(data = data)]
    return ec
end
