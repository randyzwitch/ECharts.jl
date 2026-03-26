# Chart types that use "axis" trigger (cross-hair tooltip across all series at one x position).
# All other chart types default to "item" trigger (per-point tooltip).
# Add an entry here whenever a new Cartesian chart type is introduced.
const AXIS_TRIGGER_CHARTTYPES = (
    "xy plot", "bar", "line", "area", "waterfall", "histogram",
    "streamgraph", "box", "candlestick", "corrplot", "heatmap", "bubble",
)

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
        trigger = ec.ec_charttype in AXIS_TRIGGER_CHARTTYPES ? "axis" : "item"
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
