axis_spec =
[
    (:_type, AbstractString, nothing),
    (:show, Bool, true),
    (:zlevel, Int, 0),
    (:z, Int, 0),
    (:position, AbstractString, nothing),
    (:name, AbstractString, nothing),
    (:nameLocation, AbstractString, "end"),
    (:nameTextStyle, Dict{Any, Any}, nothing),
    (:boundaryGap, Bool, nothing),
    (:min, Number, nothing),
    (:max, Number, nothing),
    (:scale, Bool, false),
    (:splitNumber, Int, nothing),
    (:logPositive, Bool, nothing),
    (:logLabelBase, Int, nothing),
    (:axisLine, AxisLine, nothing),
    (:axisTick, AxisTick, nothing),
    (:axisLabel, AxisLabel, nothing),
    (:splitLine, SplitLine, nothing),
    (:splitArea, SplitArea, nothing),
    (:data, AbstractVector, nothing)

]

primitivefactory(:Axis, axis_spec)