function scatter(x::AbstractVector, y::AbstractVector;
			mark::Union{String, AbstractVector} = "scatter",
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	#need to sort x array for some reason, echarts doesn't seem to do floats right
	d = sortrows(hcat(x,y))
	ec = xy_plot(d[:,1], d[:,2:end]; mark = mark, legend = legend, scale = scale, kwargs...)

	return ec

end
