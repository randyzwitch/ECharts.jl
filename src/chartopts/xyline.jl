"""
    yline!(ec, value)

Adds a horizontal marker line at a specified y-axis value or statistical reference
(e.g. average, min, max) to an `EChart`.

## Methods
```julia
yline!(ec::EChart, value::String; series, kwargs...)
yline!(ec::EChart, value::Real; series, kwargs...)
```

## Arguments
* `value::String` : ECharts built-in type: `"average"`, `"min"`, or `"max"`
* `value::Real` : numeric y-axis value at which to draw the line
* `series::Int = 1` : index of the series to attach the line to
* `kwargs` : additional `LineStyle` fields (e.g. `color`, `width`, `type`)

"""
function yline!(ec::EChart, value::String; series::Int = 1, kwargs...)
	# echarts built-in for average, min, max

	#Defensive; empty markLine already added by default to every chart
    isnothing(ec.series[series].markLine) ? ec.series[series].markLine = deepcopy(MarkLine()) : nothing

	#push data onto []
    push!(ec.series[series].markLine.data, Dict{Any, Any}("type" => value, "lineStyle" => LineStyle()
		)
	)

	for (k, v) in kwargs
		setfield!(ec.series[series].markLine.data[end]["lineStyle"].normal, k, v)
	end

    return ec

end

"""
    yline!(ec, value)

Adds a horizontal marker line at a specific numeric y-axis `value` to `ec`.
See the primary `yline!` method for full argument documentation.
"""
function yline!(ec::EChart, value::Real; series::Int = 1, kwargs...)

	#Defensive; empty markLine already added by default to every chart
    isnothing(ec.series[series].markLine) ? ec.series[series].markLine = deepcopy(MarkLine()) : nothing

	#push data onto []
    push!(ec.series[series].markLine.data, Dict("yAxis" => value, "lineStyle" => LineStyle()
		)
	)

	for (k, v) in kwargs
		setfield!(ec.series[series].markLine.data[end]["lineStyle"], k, v)
	end

    return ec

end

"""
    xline!(ec, value)

Adds a vertical marker line at a specified x-axis value to an `EChart`.

## Methods
```julia
xline!(ec::EChart, value::Any; series, kwargs...)
```

## Arguments
* `value` : x-axis value at which to draw the line
* `series::Int = 1` : index of the series to attach the line to
* `kwargs` : additional `LineStyle` fields (e.g. `color`, `width`, `type`)

"""
function xline!(ec::EChart, value::Any; series::Int = 1, kwargs...)
	#arbitrary line: need to confirm that the xAxis line can only be xAxis => value, not min/max/average

	#Defensive; empty markLine already added by default to every chart
    isnothing(ec.series[series].markLine) ? ec.series[series].markLine = deepcopy(MarkLine()) : nothing

	#push data onto []
    push!(ec.series[series].markLine.data, Dict("xAxis" => value, "lineStyle" => LineStyle()))

	for (k, v) in kwargs
		setfield!(ec.series[series].markLine.data[end]["lineStyle"], k, v)
	end

    return ec

end
