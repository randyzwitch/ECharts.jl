"""
    pie(names, values)

Creates an `EChart` where each value is represented as circular portion of the whole,

## Methods
```julia
pie(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}})
```

## Arguments
* `selected::Union{AbstractVector, Void} = nothing` : explode slice by position
* `radius::Union{AbstractVector, String} = "80%"` :
* `center::Union{AbstractVector, String} = ["50%", "50%"]` :
* `roseType::Union{String, Void} = nothing` : one of {"angle", "radius", nothing}
* `legend::Bool` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
"""
pie(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}};
            selected::Union{AbstractVector, Nothing} = nothing,
            radius::Union{AbstractVector, String} = "80%",
            center::Union{AbstractVector, String}  = ["50%", "50%"],
            roseType::Union{String, Nothing} = nothing,
            legend::Bool = false,
            kwargs...
            ) =
            circular_plot(names, values; selected = selected, radius = radius, center = center, roseType = roseType, legend = legend, kwargs...)
