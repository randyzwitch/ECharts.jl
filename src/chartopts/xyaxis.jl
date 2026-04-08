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

"""
    yaxis2!(ec, data)
    yaxis2!(ec)

Adds a second y-axis on the right side of an `EChart`.

## Methods
```julia
yaxis2!(ec::EChart, data::AbstractVector; series_name, mark, kwargs...)
yaxis2!(ec::EChart; series, kwargs...)
```

## Arguments
* `data::AbstractVector` : values for a new series plotted on the second y-axis
* `mark::String = "line"` : series type for the new series (e.g. `"line"`, `"bar"`, `"scatter"`)
* `series::Union{Int, AbstractVector{Int}, Nothing} = nothing` : Julia 1-based index (or indices) of *existing* series to reassign to the second y-axis
* `kwargs` : any field of the `Axis` struct (e.g. `name`, `min`, `max`) applied to the new right axis

"""
function yaxis2!(ec::EChart, data::AbstractVector;
                 mark::String = "line",
                 kwargs...)

    right_idx = findfirst(ax -> ax.position == "right", ec.yAxis)
    if isnothing(right_idx)
        push!(ec.yAxis, Axis(_type = "value", position = "right"))
        right_idx = length(ec.yAxis)
        for (k, v) in kwargs
            setfield!(ec.yAxis[right_idx], k, v)
        end
    end

    push!(ec.series, XYSeries(_type = mark, data = data, yAxisIndex = right_idx - 1))

    return ec

end

function yaxis2!(ec::EChart;
                 series::Union{Int, AbstractVector{Int}, Nothing} = nothing,
                 kwargs...)

    right_idx = findfirst(ax -> ax.position == "right", ec.yAxis)
    if isnothing(right_idx)
        push!(ec.yAxis, Axis(_type = "value", position = "right"))
        right_idx = length(ec.yAxis)
    end

    for (k, v) in kwargs
        setfield!(ec.yAxis[right_idx], k, v)
    end

    if !isnothing(series)
        for i in (isa(series, Int) ? (series,) : series)
            ec.series[i].yAxisIndex = right_idx - 1
        end
    end

    return ec

end
