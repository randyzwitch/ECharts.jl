"""
    xarea!(ec, startval, endval)

Adds a shaded region along the x-axis to highlight a range of x values on an `EChart`.

## Methods
```julia
xarea!(ec::EChart, startval, endval; series, kwargs...)
```

## Arguments
* `startval` : x-axis value where the shaded region starts
* `endval` : x-axis value where the shaded region ends
* `series::Int = 1` : index of the series to attach the region to
* `kwargs` : additional `ItemStyle` fields for the shaded area (e.g. `color`, `opacity`)

## Examples
```julia
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
xarea!(b, "B", "D", color = "rgba(200,200,200,0.4)")
```
"""
#Merge methods together using metaprogramming?
function xarea!(ec::EChart, startval, endval; series::Int = 1, kwargs...)

	#set if not exists
    isnothing(ec.series[series].markArea) ? ec.series[series].markArea = MarkArea() : nothing

	#set endpoints
	push!(ec.series[series].markArea.data, [Dict("xAxis" => startval, "itemStyle" => ItemStyle()), Dict("xAxis" => endval)])

	for (k, v) in kwargs
		setfield!(ec.series[series].markArea.data[end][1]["itemStyle"], k, v)
	end

    return ec

end

"""
    yarea!(ec, startval, endval)

Adds a shaded region along the y-axis to highlight a range of y values on an `EChart`.

## Methods
```julia
yarea!(ec::EChart, startval, endval; series, kwargs...)
```

## Arguments
* `startval` : y-axis value where the shaded region starts
* `endval` : y-axis value where the shaded region ends
* `series::Int = 1` : index of the series to attach the region to
* `kwargs` : additional `ItemStyle` fields for the shaded area (e.g. `color`, `opacity`)

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
yarea!(b, 1.5, 2.5, color = "rgba(200,200,200,0.4)")
```
"""
function yarea!(ec::EChart, startval, endval; series::Int = 1, kwargs...)

	#set if not exists
    isnothing(ec.series[series].markArea) ? ec.series[series].markArea = MarkArea() : nothing

	#set endpoints
	push!(ec.series[series].markArea.data, [Dict("yAxis" => startval, "itemStyle" => ItemStyle()), Dict("yAxis" => endval)])

	for (k, v) in kwargs
		setfield!(ec.series[series].markArea.data[end][1]["itemStyle"], k, v)
	end

    return ec

end
