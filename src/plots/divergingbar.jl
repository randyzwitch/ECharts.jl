"""
    divergingbar(categories, left, right)

Creates an `EChart` diverging bar chart where bars extend left and right from a shared
category axis. Common uses include survey/Likert data, budget variance, and before/after
comparisons.

## Methods
```julia
divergingbar(categories::AbstractVector{String},
             left::AbstractVector{<:Real},
             right::AbstractVector{<:Real})
divergingbar(df, categories::Symbol, left::Symbol, right::Symbol)
```

## Arguments
* `left_name::String = "Left"` : series label for the left (negative) bars
* `right_name::String = "Right"` : series label for the right (positive) bars
* `legend::Bool = true` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

`left` values are negated internally so bars extend to the left. Pass positive values for
both `left` and `right`.
"""
function divergingbar(categories::AbstractVector{String},
                      left::AbstractVector{<:Real},
                      right::AbstractVector{<:Real};
                      left_name::String = "Left",
                      right_name::String = "Right",
                      legend::Bool = true,
                      kwargs...)

    ec = newplot(kwargs, ec_charttype = "divergingbar")
    ec.xAxis = [Axis(_type = "value")]
    ec.yAxis = [Axis(_type = "category", data = collect(categories))]
    ec.series = [
        XYSeries(name = left_name,  _type = "bar", data = [-l for l in left]),
        XYSeries(name = right_name, _type = "bar", data = collect(right)),
    ]

    legend ? legend!(ec) : nothing

    return ec

end

"""
    divergingbar(df, categories, left, right)

Creates an `EChart` diverging bar chart from columns `categories`, `left`, and `right`
in table `df`. See the primary `divergingbar` method for full argument documentation.
"""
function divergingbar(df, categories::Symbol, left::Symbol, right::Symbol;
                      left_name::String = "Left",
                      right_name::String = "Right",
                      legend::Bool = true,
                      kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    divergingbar(_table_col(df, categories), _table_col(df, left), _table_col(df, right);
                 left_name = left_name, right_name = right_name, legend = legend, kwargs...)
end
