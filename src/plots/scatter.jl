"""
    scatter(x, y)

Creates an `EChart` where (x,y) tuples are plotted as dots.

## Methods
```julia
scatter(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
scatter(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
scatter(df, x::Symbol, y::Symbol)
scatter(df, x::Symbol, y::Symbol, group::Symbol)
```

## Arguments
* `mark::Union{String, AbstractVector} = "scatter"` : how to display plotted points
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `large::Bool = true` : minimize overplotting
* `largeThreshold::Int = 2000` : number of points before overplotting optimization occurs
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
"""
function scatter(x::AbstractVector{<:Union{Missing, Real}},
				 y::AbstractVector{<:Union{Missing, Real}};
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = false,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)

	ec = newplot(kwargs, ec_charttype = "xy plot")

	ec.xAxis = [Axis(_type = "value", nameGap = 50, scale = scale)]
	ec.yAxis = [Axis(_type = "value", nameGap = 50, scale = scale)]
	ec.series = [XYSeries(name = "Series 1", _type = mark, data = arrayofarray(x, y),
	                      large = large, largeThreshold = largeThreshold)]

	legend ? legend!(ec) : nothing

	return ec

end

"""
    scatter(x, y)

Creates an `EChart` scatter plot from a 2-D array `y`, where each column is a separate series
sharing the same `x` values. Legend is displayed by default when multiple series are present.
See the primary `scatter` method for full argument documentation.
"""
function scatter(x::AbstractVector{<:Union{Missing, Real}},
				 y::AbstractArray{<:Union{Missing, Real},2};
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = true,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)

	ec = scatter(x, y[:,1]; mark = mark, legend = legend, scale = scale,
	             large = large, largeThreshold = largeThreshold, kwargs...)

	for i in 2:size(y)[2]
		push!(ec.series, XYSeries(_type = "scatter", data = arrayofarray(x, y[:,i]),
		                          large = large, largeThreshold = largeThreshold))
	end

	seriesnames!(ec)

	legend ? legend!(ec) : nothing

	return ec

end

"""
    scatter(df, x, y)

Creates an `EChart` scatter plot from columns `x` and `y` in table `df`.
Axis labels are set automatically from column names.
See the primary `scatter` method for full argument documentation.
"""
function scatter(df, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = false,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)

	Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

	ec = scatter(_table_col(df, x), _table_col(df, y); mark = mark, legend = legend,
	             scale = scale, large = large, largeThreshold = largeThreshold, kwargs...)

	xaxis!(ec, name = string(x))
	yaxis!(ec, name = string(y))

	legend ? legend!(ec) : nothing

	return ec

end

"""
    scatter(df, x, y, group)

Creates an `EChart` scatter plot from table `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `scatter` method for full argument documentation.
"""
function scatter(df, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = true,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)

	Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

	groups = _table_groupby(df, group)
	numgroups = length(groups)
	xcol = _table_col(df, x)
	ycol = _table_col(df, y)

	_, idx1 = groups[1]
	ec = scatter(xcol[idx1], ycol[idx1]; mark = mark, legend = legend, scale = scale,
	             large = large, largeThreshold = largeThreshold, kwargs...)

	for i in 2:numgroups
		_, idxi = groups[i]
		push!(ec.series, XYSeries(_type = "scatter", data = arrayofarray(xcol[idxi], ycol[idxi]),
		                          large = large, largeThreshold = largeThreshold))
	end

	seriesnames!(ec, [string(groups[i][1]) for i in 1:numgroups])

	xaxis!(ec, name = string(x))
	yaxis!(ec, name = string(y))

	legend ? legend!(ec) : nothing

	return ec

end
