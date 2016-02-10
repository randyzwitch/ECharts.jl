axis_spec =
[
    (:_type, AbstractString, nothing),
    (:data, AbstractVector, nothing),
    (:boundaryGap, Bool, nothing),
    (:min, Number, nothing),
    (:max, Number, nothing),
    (:show, Bool, true),
    # (:zlevel, Int, 0),
    # (:z, Int, 0),
    # (:position, AbstractString, nothing),
    # (:name, AbstractString, nothing),
    # (:nameLocation, AbstractString, "end"),
    # (:nameTextStyle, Dict{Any, Any}, nothing),
    # (:scale, Bool, false),
    # (:splitNumber, Int, nothing),
    # (:logPositive, Bool, nothing),
    # (:logLabelBase, Int, nothing),
    # (:axisLine, AxisLine, deepcopy(AxisLine())),
    # (:axisTick, AxisTick, nothing),
    # (:axisLabel, AxisLabel, nothing),
    # (:splitLine, SplitLine, deepcopy(SplitLine())),
    # (:splitArea, SplitArea, nothing),

]

primitivefactory(:Axis, axis_spec)
