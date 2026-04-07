"""
    datazoom!(ec)

Adds a DataZoom control to an `EChart` for panning and zooming along an axis.

## Methods
```julia
datazoom!(ec::EChart; type, start, end_, xAxisIndex, yAxisIndex, orient, filterMode, zoomLock, throttle, left, top, right, bottom)
```

## Arguments
* `type::String = "slider"` : `"slider"` for a visible drag handle below/beside the chart; `"inside"` for mouse-scroll and touch zoom/pan directly on the chart body
* `start::Number = 0` : initial start of the visible range as a percentage (0–100)
* `end_::Number = 100` : initial end of the visible range as a percentage (0–100)
* `xAxisIndex::Union{Int,Nothing} = nothing` : x-axis index to attach the zoom to
* `yAxisIndex::Union{Int,Nothing} = nothing` : y-axis index to attach the zoom to
* `orient::Union{String,Nothing} = nothing` : `"horizontal"` or `"vertical"`; inferred from axis if omitted (slider only)
* `filterMode::String = "filter"` : how out-of-range data is handled: `"filter"`, `"weakFilter"`, `"empty"`, or `"none"`
* `zoomLock::Union{Bool,Nothing} = nothing` : lock zoom ratio so scrolling only pans (inside only)
* `throttle::Union{Int,Nothing} = nothing` : throttle the zoom/pan events in milliseconds (inside only)
* `left::Union{Int,String,Nothing} = nothing` : distance from left edge; not set if nothing
* `top::Union{Int,String,Nothing} = nothing` : distance from top edge; not set if nothing
* `right::Union{Int,String,Nothing} = nothing` : distance from right edge; auto-positioned if nothing
* `bottom::Union{Int,String,Nothing} = nothing` : distance from bottom edge; auto-positioned at bottom of chart if nothing

## Notes

Call `datazoom!` multiple times to add controls for both the x and y axes.
"""
function datazoom!(ec::EChart;
                   type::String = "slider",
                   start::Number = 0,
                   end_::Number = 100,
                   xAxisIndex::Union{Int,Nothing} = nothing,
                   yAxisIndex::Union{Int,Nothing} = nothing,
                   orient::Union{String,Nothing} = nothing,
                   filterMode::String = "filter",
                   zoomLock::Union{Bool,Nothing} = nothing,
                   throttle::Union{Int,Nothing} = nothing,
                   left::Union{Int,String,Nothing} = nothing,
                   top::Union{Int,String,Nothing} = nothing,
                   right::Union{Int,String,Nothing} = nothing,
                   bottom::Union{Int,String,Nothing} = nothing)

    dz = DataZoom(_type = type,
                  show = type == "slider" ? true : nothing,
                  start = start,
                  _end = end_,
                  xAxisIndex = xAxisIndex,
                  yAxisIndex = yAxisIndex,
                  orient = orient,
                  filterMode = filterMode,
                  zoomLock = zoomLock,
                  throttle = throttle,
                  left = left,
                  top = top,
                  right = right,
                  bottom = bottom)

    isnothing(ec.dataZoom) ? ec.dataZoom = [dz] : push!(ec.dataZoom, dz)

    return ec

end
