"""
    datazoom!(ec)

Adds a DataZoom control to an `EChart` for panning and zooming along an axis.

## Methods
```julia
datazoom!(ec::EChart; type, start, end_, xAxisIndex, yAxisIndex, orient, filterMode, zoomLock, throttle)
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

## Notes

Call `datazoom!` multiple times to add controls for both the x and y axes.

## Examples
```julia
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
datazoom!(b)

# Start zoomed into the first 50% of data
datazoom!(b, start = 0, end_ = 50)

# Attach to y-axis with vertical slider
datazoom!(b, yAxisIndex = 0, orient = "vertical")

# Inside zoom (mouse-scroll), locked to pan only
datazoom!(b, type = "inside", zoomLock = true, throttle = 100)
```
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
                   throttle::Union{Int,Nothing} = nothing)

    dz = DataZoom(_type = type,
                  show = type == "slider" ? true : nothing,
                  start = start,
                  _end = end_,
                  xAxisIndex = xAxisIndex,
                  yAxisIndex = yAxisIndex,
                  orient = orient,
                  filterMode = filterMode,
                  zoomLock = zoomLock,
                  throttle = throttle)

    isnothing(ec.dataZoom) ? ec.dataZoom = [dz] : push!(ec.dataZoom, dz)

    return ec

end
