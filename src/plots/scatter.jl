"""
    scatter(x, y)

Creates an `EChart` where (x,y) tuples are plotted as dots.

## Methods
```julia
scatter(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
scatter(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
scatter(df::AbstractDataFrame, x::Symbol, y::Symbol)
scatter(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
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

	ec = xy_plot(x, arrayofarray(x,y); mark = mark, legend = legend, scale = scale, kwargs...)
	ec.xAxis[1]._type = "value"
	ec.xAxis[1].data = nothing #This is necessary to re-use xy_plot, deletes data since scatter uses arrayofarray

	#Enable optimization for lots of data
	[x.large = large for x in ec.series]
	[x.largeThreshold = largeThreshold for x in ec.series]

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

	#Initialize with single series
	ec = scatter(x, y[:,1]; mark = mark, legend = legend, scale = scale, kwargs...)

	#Append remaining series
	for i in 2:size(y)[2]
		push!(ec.series, XYSeries(_type = "scatter", data = arrayofarray(x, y[:,i])))
	end

	seriesnames!(ec)

	legend == true ? legend!(ec) : nothing

	#Enable optimization for lots of data
	[x.large = large for x in ec.series]
	[x.largeThreshold = largeThreshold for x in ec.series]

	return ec

end

"""
    scatter(df, x, y)

Creates an `EChart` scatter plot from columns `x` and `y` in DataFrame `df`.
Axis labels are set automatically from column names.
See the primary `scatter` method for full argument documentation.
"""
function scatter(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = false,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)


	#Initialize with single series
	ec = scatter(df[!, x], df[!, y]; mark = mark, legend = legend, scale = scale, kwargs...)

	#Add legend if desired
	legend == true ? legend!(ec) : nothing

	#Name axes since we know them
	xaxis!(ec, name = string(x))
	yaxis!(ec, name = string(y))

	#Enable optimization for lots of data
	[x.large = large for x in ec.series]
	[x.largeThreshold = largeThreshold for x in ec.series]

	return ec

end

"""
    scatter(df, x, y, group)

Creates an `EChart` scatter plot from DataFrame `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `scatter` method for full argument documentation.
"""
function scatter(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = true,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)

	#Create grouped df
	subdf = groupby(df, group)

	#Get number of groups
	numgroups = length(subdf)

	#Initialize with single series
	ec = scatter(subdf[1], x, y; mark = mark, legend = legend, scale = scale, kwargs...)

	#Append remaining series
	for i in 2:numgroups
		push!(ec.series, XYSeries(_type = "scatter", data = arrayofarray(subdf[i][!, x], subdf[i][!, y])))
	end

	#Add series names based on levels of grouped df
	seriesnames!(ec, [unique(subdf[x][!, group])[1] for x in 1:numgroups])

	#Add legend if desired
	legend == true ? legend!(ec) : nothing

	#Enable optimization for lots of data
	[x.large = large for x in ec.series]
	[x.largeThreshold = largeThreshold for x in ec.series]

	return ec

end
