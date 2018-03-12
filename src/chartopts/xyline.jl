# echarts built-in for average, min, max
function yline!(ec::EChart, value::String; series::Int = 1, kwargs...)

	#Defensive; empty markLine already added by default to every chart
    ec.series[series].markLine == nothing ? ec.series[series].markLine = deepcopy(MarkLine()) : nothing

	#push data onto []
    push!(ec.series[series].markLine.data, Dict{Any, Any}("type" => value, "lineStyle" => LineStyle()
		)
	)

	for (k, v) in kwargs
		setfield!(ec.series[series].markLine.data[end]["lineStyle"].normal, k, v)
	end

    return ec

end

#arbitrary number line
function yline!(ec::EChart, value::Real; series::Int = 1, kwargs...)

	#Defensive; empty markLine already added by default to every chart
    ec.series[series].markLine == nothing ? ec.series[series].markLine = deepcopy(MarkLine()) : nothing

	#push data onto []
    push!(ec.series[series].markLine.data, Dict("yAxis" => value, "lineStyle" => LineStyle()
		)
	)

	for (k, v) in kwargs
		setfield!(ec.series[series].markLine.data[end]["lineStyle"], k, v)
	end

    return ec

end

#arbitrary line: need to confirm that the xAxis line can only be xAxis => value, not min/max/average
function xline!(ec::EChart, value::Any; series::Int = 1, kwargs...)

	#Defensive; empty markLine already added by default to every chart
    ec.series[series].markLine == nothing ? ec.series[series].markLine = deepcopy(MarkLine()) : nothing

	#push data onto []
    push!(ec.series[series].markLine.data, Dict("xAxis" => value, "lineStyle" => LineStyle()))

	for (k, v) in kwargs
		setfield!(ec.series[series].markLine.data[end]["lineStyle"], k, v)
	end

    return ec

end
