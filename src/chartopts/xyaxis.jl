"""
    yaxis!(ec)

Modifies y-axis properties of an `EChart`.

## Methods
```julia
yaxis!(ec::EChart; formatter, decimals, kwargs...)
```

## Arguments
* `axis::Int = 1` : index of the y-axis to modify (for multi-axis charts)
* `formatter::Union{String, JSON.JSONText, Nothing} = nothing` : axis label format string or JS function; takes precedence over `decimals`
* `decimals::Union{Int, Nothing} = nothing` : fix axis tick labels to this many decimal places; ignored with a warning on category axes or when `formatter` is also supplied
* `kwargs` : any field of the `Axis` struct (e.g. `name`, `min`, `max`)

"""
function yaxis!(ec::EChart; axis::Int = 1,
                formatter::Union{String, JSON.JSONText, Nothing} = nothing,
                decimals::Union{Int, Nothing} = nothing,
                kwargs...)

    for (k, v) in kwargs
        setfield!(ec.yAxis[axis], k, v)
    end

    if !isnothing(decimals)
        if !isnothing(formatter)
            @warn "formatter takes precedence over decimals when both are specified; decimals ignored"
        elseif ec.yAxis[axis]._type == "category"
            @warn "decimals has no effect on category axes; ignored"
        else
            ec.yAxis[axis].axisLabel.formatter = JSON.JSONText("function(v){ return v.toFixed($decimals); }")
        end
    end

    !isnothing(formatter) ? ec.yAxis[axis].axisLabel.formatter = formatter : nothing

    return ec

end

"""
    xaxis!(ec)

Modifies x-axis properties of an `EChart`.

## Methods
```julia
xaxis!(ec::EChart; formatter, decimals, kwargs...)
```

## Arguments
* `axis::Int = 1` : index of the x-axis to modify (for multi-axis charts)
* `formatter::Union{String, JSON.JSONText, Nothing} = nothing` : axis label format string or JS function; takes precedence over `decimals`
* `decimals::Union{Int, Nothing} = nothing` : fix axis tick labels to this many decimal places; ignored with a warning on category axes or when `formatter` is also supplied
* `kwargs` : any field of the `Axis` struct (e.g. `name`, `type`, `boundaryGap`)

"""
function xaxis!(ec::EChart; axis::Int = 1,
                formatter::Union{String, JSON.JSONText, Nothing} = nothing,
                decimals::Union{Int, Nothing} = nothing,
                kwargs...)

    for (k, v) in kwargs
        setfield!(ec.xAxis[axis], k, v)
    end

    if !isnothing(decimals)
        if !isnothing(formatter)
            @warn "formatter takes precedence over decimals when both are specified; decimals ignored"
        elseif isnothing(ec.xAxis[axis]._type) || ec.xAxis[axis]._type == "category"
            @warn "decimals has no effect on category axes; ignored"
        else
            ec.xAxis[axis].axisLabel.formatter = JSON.JSONText("function(v){ return v.toFixed($decimals); }")
        end
    end

    !isnothing(formatter) ? ec.xAxis[axis].axisLabel.formatter = formatter : nothing

    return ec

end
