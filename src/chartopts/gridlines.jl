"""
    xgridlines!(ec)

Configures the x-axis grid lines for an `EChart`.

## Methods
```julia
xgridlines!(ec::EChart; show, interval, kwargs...)
```

## Arguments
* `axis::Int = 1` : index of the x-axis to modify (for multi-axis charts)
* `show::Bool = true` : display grid lines
* `interval::Union{Int, String, JSON.JSONText, Nothing} = "auto"` : interval between grid lines
* `kwargs` : additional `LineStyle` fields (e.g. `color`, `width`, `type`)

"""
function xgridlines!(ec::EChart; axis::Int = 1,
								 show::Bool = true,
								 interval::Union{Int, String, JSON.JSONText, Nothing} = "auto",
								 kwargs...)

	#Set if not present
    isnothing(ec.xAxis[axis].splitLine) ? ec.xAxis[axis].splitLine = SplitLine() : nothing

	#Set top-level properties
    ec.xAxis[axis].splitLine.show = show
	ec.xAxis[axis].splitLine.interval = interval

	#kwargs all the lineStyle arguments
	length(kwargs) > 0 ? for (k, v) in kwargs setfield!(ec.xAxis[axis].splitLine.lineStyle, k, v) end : nothing

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
* `axis::Int = 1` : index of the y-axis to modify (for multi-axis charts)
* `show::Bool = true` : display grid lines
* `interval::Union{Int, String, JSON.JSONText, Nothing} = "auto"` : interval between grid lines
* `kwargs` : additional `LineStyle` fields (e.g. `color`, `width`, `type`)

"""
function ygridlines!(ec::EChart; axis::Int = 1,
								 show::Bool = true,
								 interval::Union{Int, String, JSON.JSONText, Nothing} = "auto",
								 kwargs...)

	#Set if not present
    isnothing(ec.yAxis[axis].splitLine) ? ec.yAxis[axis].splitLine = SplitLine() : nothing

	#Set top-level properties
    ec.yAxis[axis].splitLine.show = show
	ec.yAxis[axis].splitLine.interval = interval

	#kwargs all the lineStyle arguments
	length(kwargs) > 0 ? for (k, v) in kwargs setfield!(ec.yAxis[axis].splitLine.lineStyle, k, v) end : nothing

    return ec

end
