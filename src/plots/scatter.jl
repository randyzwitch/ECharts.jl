"""
    area(x, y)

Creates an `EChart` where region below plotted line filled with color.

## Methods
```julia
area(x::AbstractVector, y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}})
area(x::AbstractVector, y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2})
area(df::AbstractDataFrame, x::Symbol, y::Symbol)
area(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
area(k::KernelDensity.UnivariateKDE)
```

## Arguments
* `mark::Union{String, AbstractVector} = "line"` : how to display plotted points
* `fill::Union{Bool, AbstractVector} = true` : fill area below marks with color?
* `stack::Union{Bool, AbstractVector, Void} = nothing` : stack (add together) when multple series present?
* `step::Union{String, Void} = nothing` : one of {"start", "end", "middle", nothing}
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.

## Examples
```julia
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y)
```
"""
function scatter(x::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
				 y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
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

#Single X, multiple Y. This is unlikier scenario
function scatter(x::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}},
				 y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2};
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
		push!(ec.series, Series(_type = "scatter", data = arrayofarray(x, y[:,i])))
	end

	seriesnames!(ec)

	legend == true? legend!(ec) : nothing

	#Enable optimization for lots of data
	[x.large = large for x in ec.series]
	[x.largeThreshold = largeThreshold for x in ec.series]

	return ec

end

#dataframe, single series
function scatter(df::AbstractDataFrame, x::Symbol, y::Symbol;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = false,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)


	#Initialize with single series
	ec = scatter(df[x], df[y]; mark = mark, legend = legend, scale = scale, kwargs...)

	#Add legend if desired
	legend == true? legend!(ec) : nothing

	#Name axes since we know them
	xaxis!(ec, name = string(x))
	yaxis!(ec, name = string(y))

	#Enable optimization for lots of data
	[x.large = large for x in ec.series]
	[x.largeThreshold = largeThreshold for x in ec.series]

	return ec

end

#dataframe with group: uses single series df method
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
		push!(ec.series, Series(_type = "scatter", data = arrayofarray(subdf[i][x], subdf[i][y])))
	end

	#Add series names based on levels of grouped df
	seriesnames!(ec, [unique(subdf[x][group])[1] for x in 1:numgroups])

	#Add legend if desired
	legend == true? legend!(ec) : nothing

	#Enable optimization for lots of data
	[x.large = large for x in ec.series]
	[x.largeThreshold = largeThreshold for x in ec.series]

	return ec

end
