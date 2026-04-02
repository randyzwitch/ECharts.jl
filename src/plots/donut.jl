"""
    donut(names, values)

Creates an `EChart` where each value is represented as circular portion of the whole, with a hole removed from the center.

## Methods
```julia
donut(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}})
donut(df, names::Symbol, values::Symbol)
```

## Arguments
* `selected::Union{AbstractVector, Void} = nothing` : explode slice by position
* `radius::Union{AbstractVector, String} = ["50%", "80%"]` :
* `center::Union{AbstractVector, String} = ["50%", "50%"]` :
* `roseType::Union{String, Void} = nothing` : one of {"angle", "radius", nothing}
* `legend::Bool` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
"""
donut(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}};
            selected::Union{AbstractVector, Nothing} = nothing,
            radius::Union{AbstractVector, String} = ["50%", "80%"],
            center::Union{AbstractVector, String} = ["50%", "50%"],
            roseType::Union{String, Nothing} = nothing,
            legend::Bool = false,
            kwargs...
            ) =
            circular_plot(names, values; selected = selected, radius = radius, center = center, roseType = roseType, legend = legend, kwargs...)

"""
    donut(df, names, values)

Creates an `EChart` donut chart from columns `names` and `values` in table `df`.
See the primary `donut` method for full argument documentation.
"""
function donut(df, names::Symbol, values::Symbol;
            selected::Union{AbstractVector, Nothing} = nothing,
            radius::Union{AbstractVector, String} = ["50%", "80%"],
            center::Union{AbstractVector, String} = ["50%", "50%"],
            roseType::Union{String, Nothing} = nothing,
            legend::Bool = false,
            kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    donut(_table_col(df, names), _table_col(df, values);
          selected = selected, radius = radius, center = center,
          roseType = roseType, legend = legend, kwargs...)
end
