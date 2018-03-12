#Merge methods together using metaprogramming?
function xarea!(ec::EChart, startval, endval; series::Int = 1, kwargs...)

	#set if not exists
    ec.series[series].markArea == nothing ? ec.series[series].markArea = MarkArea() : nothing

	#set endpoints
	push!(ec.series[series].markArea.data, [Dict("xAxis" => startval, "itemStyle" => ItemStyle()), Dict("xAxis" => endval)])

	for (k, v) in kwargs
		setfield!(ec.series[series].markArea.data[end][1]["itemStyle"], k, v)
	end

    return ec

end

function yarea!(ec::EChart, startval, endval; series::Int = 1, kwargs...)

	#set if not exists
    ec.series[series].markArea == nothing ? ec.series[series].markArea = MarkArea() : nothing

	#set endpoints
	push!(ec.series[series].markArea.data, [Dict("yAxis" => startval, "itemStyle" => ItemStyle()), Dict("yAxis" => endval)])

	for (k, v) in kwargs
		setfield!(ec.series[series].markArea.data[end][1]["itemStyle"], k, v)
	end

    return ec

end
