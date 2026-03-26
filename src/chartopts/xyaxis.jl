"""
    yaxis!(ec)

Modifies y-axis properties of an `EChart`.

## Methods
```julia
yaxis!(ec::EChart; formatter, kwargs...)
```

## Arguments
* `axis::Int = 1` : index of the y-axis to modify (for multi-axis charts)
* `formatter::Union{String, JSON.JSONText, Nothing} = nothing` : axis label format string or JS function
* `kwargs` : any field of the `YAxis` struct (e.g. `name`, `min`, `max`, `type`)

## Examples
```julia
b = bar(["A","B","C"], [1000, 2000, 3000])
yaxis!(b, name = "Revenue", formatter = "\${value}")
```
"""
function yaxis!(ec::EChart; axis::Int = 1, formatter::Union{String, JSON.JSONText, Nothing} = nothing, kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.yAxis[axis], k, v)
	end

	#Apply axis label format if present
	!isnothing(formatter) ? ec.yAxis[axis].axisLabel.formatter = formatter : nothing

	return ec

end

"""
    xaxis!(ec)

Modifies x-axis properties of an `EChart`.

## Methods
```julia
xaxis!(ec::EChart; formatter, kwargs...)
```

## Arguments
* `axis::Int = 1` : index of the x-axis to modify (for multi-axis charts)
* `formatter::Union{String, JSON.JSONText, Nothing} = nothing` : axis label format string or JS function
* `kwargs` : any field of the `XAxis` struct (e.g. `name`, `type`, `boundaryGap`)

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
xaxis!(b, name = "Category")
```
"""
function xaxis!(ec::EChart; axis::Int = 1, formatter::Union{String, JSON.JSONText, Nothing} = nothing, kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.xAxis[axis], k, v)
	end

	#Apply axis label format if present
	!isnothing(formatter) ? ec.xAxis[axis].axisLabel.formatter = formatter : nothing

	return ec

end
