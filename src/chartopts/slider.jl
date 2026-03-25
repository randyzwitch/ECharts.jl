"""
    slider!(ec)

Adds a DataZoom slider to an `EChart`, allowing the user to pan and zoom along an axis.

## Methods
```julia
slider!(ec::EChart; start, end_, xAxisIndex, yAxisIndex, orient, filterMode)
```

## Arguments
* `start::Number = 0` : initial start of the visible range as a percentage (0–100)
* `end_::Number = 100` : initial end of the visible range as a percentage (0–100)
* `xAxisIndex::Union{Int,Nothing} = nothing` : x-axis index to attach the slider to
* `yAxisIndex::Union{Int,Nothing} = nothing` : y-axis index to attach the slider to
* `orient::Union{String,Nothing} = nothing` : `"horizontal"` or `"vertical"`; inferred from axis if omitted
* `filterMode::String = "filter"` : how out-of-range data is handled: `"filter"`, `"weakFilter"`, `"empty"`, or `"none"`

## Notes

Call `slider!` multiple times to add sliders for both the x and y axes.

## Examples
```julia
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
slider!(b)

# Start zoomed into the first 50% of data
slider!(b, start = 0, end_ = 50)

# Attach to y-axis
slider!(b, yAxisIndex = 0, orient = "vertical")
```
"""
function slider!(ec::EChart;
                 start::Number = 0,
                 end_::Number = 100,
                 xAxisIndex::Union{Int,Nothing} = nothing,
                 yAxisIndex::Union{Int,Nothing} = nothing,
                 orient::Union{String,Nothing} = nothing,
                 filterMode::String = "filter")

    dz = DataZoom(_type = "slider",
                  show = true,
                  start = start,
                  _end = end_,
                  xAxisIndex = xAxisIndex,
                  yAxisIndex = yAxisIndex,
                  orient = orient,
                  filterMode = filterMode)

    isnothing(ec.dataZoom) ? ec.dataZoom = [dz] : push!(ec.dataZoom, dz)

    return ec

end

"""
    inside!(ec)

Adds an inside DataZoom to an `EChart`, enabling mouse-scroll and touch zoom/pan directly on the chart.

## Methods
```julia
inside!(ec::EChart; start, end_, xAxisIndex, yAxisIndex, filterMode, zoomLock, throttle)
```

## Arguments
* `start::Number = 0` : initial start of the visible range as a percentage (0–100)
* `end_::Number = 100` : initial end of the visible range as a percentage (0–100)
* `xAxisIndex::Union{Int,Nothing} = nothing` : x-axis index to attach the zoom to
* `yAxisIndex::Union{Int,Nothing} = nothing` : y-axis index to attach the zoom to
* `filterMode::String = "filter"` : how out-of-range data is handled: `"filter"`, `"weakFilter"`, `"empty"`, or `"none"`
* `zoomLock::Union{Bool,Nothing} = nothing` : lock zoom ratio so scrolling only pans
* `throttle::Union{Int,Nothing} = nothing` : throttle the zoom/pan events in milliseconds

## Examples
```julia
b = bar(["A","B","C","D","E"], [1,2,3,4,5])
inside!(b)

# Lock to panning only (no zoom), with throttle
inside!(b, zoomLock = true, throttle = 100)
```
"""
function inside!(ec::EChart;
                 start::Number = 0,
                 end_::Number = 100,
                 xAxisIndex::Union{Int,Nothing} = nothing,
                 yAxisIndex::Union{Int,Nothing} = nothing,
                 filterMode::String = "filter",
                 zoomLock::Union{Bool,Nothing} = nothing,
                 throttle::Union{Int,Nothing} = nothing)

    dz = DataZoom(_type = "inside",
                  start = start,
                  _end = end_,
                  xAxisIndex = xAxisIndex,
                  yAxisIndex = yAxisIndex,
                  filterMode = filterMode,
                  zoomLock = zoomLock,
                  throttle = throttle)

    isnothing(ec.dataZoom) ? ec.dataZoom = [dz] : push!(ec.dataZoom, dz)

    return ec

end
