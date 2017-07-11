#Single series method
function scatter(x::AbstractVector, y::AbstractVector;
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
function scatter(x::AbstractVector, y::AbstractArray;
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
