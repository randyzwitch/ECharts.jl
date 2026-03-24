"""
    line(x, y)

Creates an `EChart` where region between points connected by a line.

## Methods
```julia
line(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
line(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
line(df::AbstractDataFrame, x::Symbol, y::Symbol)
line(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
```

## Arguments
* `mark::Union{String, AbstractVector} = "line"` : how to display plotted points
* `step::Union{String, Void} = nothing` : one of {"start", "end", "middle", nothing}
* `legend::Bool = false` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.
"""
function line(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}};
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	return xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

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
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	return xy_plot(x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end

"""
    line(df, x, y)

Creates an `EChart` line chart from a single column `y` in DataFrame `df` against column `x`.
See the primary `line` method for full argument documentation.
"""
function line(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Nothing} = nothing,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	return xy_plot(df, x, y; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end

"""
    line(df, x, y, group)

Creates an `EChart` line chart from DataFrame `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `line` method for full argument documentation.
"""
function line(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "line",
			step::Union{String, Nothing} = nothing,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	return xy_plot(df, x, y, group; mark = mark, step = step, legend = legend, scale = scale, kwargs...)

end
