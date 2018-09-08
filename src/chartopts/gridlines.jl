#Merge methods together using metaprogramming?
function xgridlines!(ec::EChart; show::Bool = true,
								 interval::Union{Int, String, JSFunction, Nothing} = "auto",
								 kwargs...)

	#Set if not present
    ec.xAxis[1].splitLine == nothing ? ec.xAxis[1].splitLine = SplitLine() : nothing

	#Set top-level properties
    ec.xAxis[1].splitLine.show = show
	ec.xAxis[1].splitLine.interval = interval

	#kwargs all the lineStyle arguments
	length(kwargs) > 0 ? for (k, v) in kwargs setfield!(ec.xAxis[1].splitLine.lineStyle, k, v) end : nothing

    return ec

end

function ygridlines!(ec::EChart; show::Bool = true,
								 interval::Union{Int, String, JSFunction, Nothing} = "auto",
								 kwargs...)

	#Set if not present
    ec.yAxis[1].splitLine == nothing ? ec.yAxis[1].splitLine = SplitLine() : nothing

	#Set top-level properties
    ec.yAxis[1].splitLine.show = show
	ec.yAxis[1].splitLine.interval = interval

	#kwargs all the lineStyle arguments
	length(kwargs) > 0 ? for (k, v) in kwargs setfield!(ec.yAxis[1].splitLine.lineStyle, k, v) end : nothing

    return ec

end
