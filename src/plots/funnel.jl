"""
    funnel(names, values)

Creates an `EChart` funnel.

## Methods
```julia
funnel(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}})
```

## Arguments
* `sort::String = "descending"` : sort order for funnel slices; one of {"descending", "ascending", "none"}
* `legend::Bool` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Given the concept of a funnel (largest at top, narrowing), if you pass in the values out of order, the echarts.js library automatically sorts the numbers highest to lowest.
"""
function funnel(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}};
 legend::Bool = false,
 sort::String = "descending",
 kwargs...)

    ec = newplot(kwargs, ec_charttype = "funnel")

    ec.series = [FunnelSeries(name = "Series 1",
                            data =  arrayofdicts(value = values, name = names),
                            sort = sort
                            )]

    #Add legend if requested
    legend ? legend!(ec) : nothing

    return ec

end

"""
    funnel(df, names, values)

Creates an `EChart` funnel chart from columns `names` and `values` in table `df`.
See the primary `funnel` method for full argument documentation.
"""
function funnel(df, names::Symbol, values::Symbol;
                legend::Bool = false,
                sort::String = "descending",
                kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    funnel(_table_col(df, names), _table_col(df, values); legend = legend, sort = sort, kwargs...)
end
