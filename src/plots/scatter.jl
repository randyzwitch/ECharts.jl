#Single series method
function scatter(x::AbstractVector, y::AbstractVector;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	ec = xy_plot(x, xyarrayofarray(x,y); mark = mark, legend = legend, scale = scale, kwargs...)
	ec.xAxis[1]._type = "value"
	ec.xAxis[1].data = nothing

	return ec

end

#Single X, multiple Y. This is unlikier scenario
function scatter(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	#Initialize with single series
	ec = scatter(x, y[:,1]; mark = mark, legend = legend, scale = scale, kwargs...)

	#Append remaining series
	for i in 2:size(y)[2]
		push!(ec.series, Series(_type = "scatter", data = xyarrayofarray(x, y[:,i])))
	end

	return ec

end
