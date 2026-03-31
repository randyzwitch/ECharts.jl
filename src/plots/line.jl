"""
    line(x, y)

Creates an `EChart` where region between points connected by a line.

## Methods
```julia
line(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
line(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
line(df, x::Symbol, y::Symbol)
line(df, x::Symbol, y::Symbol, group::Symbol)
```

## Arguments
* `mark::Union{String, AbstractVector} = "line"` : how to display plotted points
* `step::Union{String, Void} = nothing` : one of {"start", "end", "middle", nothing}
* `sampling::Union{String, Nothing} = nothing` : downsampling strategy for large datasets; one of {"lttb", "average", "min", "max", "sum", nothing}
* `legend::Bool = false` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.
"""
function line(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}};
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Nothing} = nothing,
			sampling::Union{String, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	ec = xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	!isnothing(sampling) ? [s.sampling = sampling for s in ec.series] : nothing
	return ec

end

"""
    line(x, y)

Creates an `EChart` line chart from a 2-D array `y`, where each column is a separate series.
Legend is displayed by default when multiple series are present.
See the primary `line` method for full argument documentation.
"""
function line(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2};
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Nothing} = nothing,
			sampling::Union{String, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	ec = xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	!isnothing(sampling) ? [s.sampling = sampling for s in ec.series] : nothing
	return ec

end

"""
    line(df, x, y)

Creates an `EChart` line chart from a single column `y` in table `df` against column `x`.
See the primary `line` method for full argument documentation.
"""
function line(df, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Nothing} = nothing,
			sampling::Union{String, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
	ec = xy_plot(df, x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	!isnothing(sampling) ? [s.sampling = sampling for s in ec.series] : nothing
	return ec

end

"""
    line(df, x, y, group)

Creates an `EChart` line chart from table `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `line` method for full argument documentation.
"""
function line(df, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Nothing} = nothing,
			sampling::Union{String, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
	ec = xy_plot(df, x, y, group; mark = mark, step = step, legend = legend, scale = scale, kwargs...)
	!isnothing(sampling) ? [s.sampling = sampling for s in ec.series] : nothing
	return ec

end
