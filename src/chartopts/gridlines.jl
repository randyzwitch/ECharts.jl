"""
    xgridlines!(ec)

Configures the x-axis grid lines for an `EChart`.

## Methods
```julia
xgridlines!(ec::EChart; show, interval, kwargs...)
```

## Arguments
* `show::Bool = true` : display grid lines
* `interval::Union{Int, String, JSFunction, Nothing} = "auto"` : interval between grid lines
* `kwargs` : additional `LineStyle` fields (e.g. `color`, `width`, `type`)

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
xgridlines!(b, show = false)
```
"""
function xgridlines!(ec::EChart; show::Bool = true,
								 interval::Union{Int, String, JSFunction, Nothing} = "auto",
								 kwargs...)

	#Set if not present
    isnothing(ec.xAxis[1].splitLine) ? ec.xAxis[1].splitLine = SplitLine() : nothing

	#Set top-level properties
    ec.xAxis[1].splitLine.show = show
	ec.xAxis[1].splitLine.interval = interval

	#kwargs all the lineStyle arguments
	length(kwargs) > 0 ? for (k, v) in kwargs setfield!(ec.xAxis[1].splitLine.lineStyle, k, v) end : nothing

    return ec

end

"""
    ygridlines!(ec)

Configures the y-axis grid lines for an `EChart`.

## Methods
```julia
ygridlines!(ec::EChart; show, interval, kwargs...)
```

## Arguments
* `show::Bool = true` : display grid lines
* `interval::Union{Int, String, JSFunction, Nothing} = "auto"` : interval between grid lines
* `kwargs` : additional `LineStyle` fields (e.g. `color`, `width`, `type`)

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
ygridlines!(b, show = false)
```
"""
function ygridlines!(ec::EChart; show::Bool = true,
								 interval::Union{Int, String, JSFunction, Nothing} = "auto",
								 kwargs...)

	#Set if not present
    isnothing(ec.yAxis[1].splitLine) ? ec.yAxis[1].splitLine = SplitLine() : nothing

	#Set top-level properties
    ec.yAxis[1].splitLine.show = show
	ec.yAxis[1].splitLine.interval = interval

	#kwargs all the lineStyle arguments
	length(kwargs) > 0 ? for (k, v) in kwargs setfield!(ec.yAxis[1].splitLine.lineStyle, k, v) end : nothing

    return ec

end
