"""
    tooltip!(ec)

Adds or modifies the tooltip for an `EChart`.

## Methods
```julia
tooltip!(ec::EChart; show, trigger, formatter, backgroundColor, borderColor, padding, kwargs...)
```

## Arguments
* `show::Bool = true` : display the tooltip
* `trigger::Union{String,Nothing} = nothing` : tooltip trigger mode — `"item"` (per data point),
  `"axis"` (cross-axis), or `"none"`. When `nothing`, an appropriate default is chosen based on
  the chart type: `"axis"` for Cartesian chart types (bar, line, area, etc.) and `"item"` for all others.
* `formatter::Union{String,Nothing} = nothing` : tooltip content format string or template
  (e.g. `"{b}: {c}"`, `"{b0}: {c0}<br/>{b1}: {c1}"`)
* `backgroundColor::Union{String,Nothing} = nothing` : tooltip background color (e.g. `"rgba(50,50,50,0.9)"`)
* `borderColor::Union{String,Nothing} = nothing` : tooltip border color
* `padding::Union{Int,Nothing} = nothing` : tooltip padding in pixels
* `kwargs` : any additional field of the `Tooltip` struct (e.g. `confine = true`)

## Notes

The auto-selected trigger for Cartesian charts (`"axis"`) shows a single tooltip for all series
at the same x position. Pass `trigger = "item"` to override this behaviour.

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
tooltip!(b)                                   # trigger = "axis" (auto)
tooltip!(b, trigger = "item")                 # per-bar tooltip
tooltip!(b, formatter = "{b}: {c} units")     # custom format
tooltip!(b, backgroundColor = "rgba(0,0,0,0.8)", padding = 10)
```
"""
function tooltip!(ec::EChart; show::Bool = true,
                               trigger::Union{String,Nothing} = nothing,
                               formatter::Union{String,Nothing} = nothing,
                               backgroundColor::Union{String,Nothing} = nothing,
                               borderColor::Union{String,Nothing} = nothing,
                               padding::Union{Int,Nothing} = nothing,
                               kwargs...)

    #If tooltip doesn't exist, add it, else use what is there
    isnothing(ec.tooltip) ? ec.tooltip = Tooltip() : nothing

    ec.tooltip.show = show

    # Auto-select trigger based on chart type when not specified
    if isnothing(trigger)
        axis_types = ("xy plot", "bar", "line", "area", "waterfall", "histogram",
                      "streamgraph", "box", "candlestick", "corrplot", "heatmap", "bubble")
        trigger = ec.ec_charttype in axis_types ? "axis" : "item"
    end
    ec.tooltip.trigger = trigger

    isnothing(formatter)       || (ec.tooltip.formatter       = formatter)
    isnothing(backgroundColor) || (ec.tooltip.backgroundColor = backgroundColor)
    isnothing(borderColor)     || (ec.tooltip.borderColor     = borderColor)
    isnothing(padding)         || (ec.tooltip.padding         = padding)

    for (k, v) in kwargs
       setfield!(ec.tooltip, k, v)
    end

    return ec

end
