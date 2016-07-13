areass_spec = [
(:width, Int, 20),
(:borderWidth, Int, 1),
(:borderColor, String, "rgba(160,197,232)"),
(:color, String, "rgba(160,197,232)"),
(:opacity, Number, 0.3)
]

primitivefactory(:AreaSelectStyle, areass_spec)

parallelaxis_spec =

[
(:dim, Int, nothing),
(:parallelIndex, Int, 0),
(:areaSelectStyle, AreaSelectStyle, nothing),
(:_type, String, "value"),
(:name, String, nothing),
(:nameLocation, String, "start"),
(:nameTextStyle, TextStyle, "#fff"),
(:nameGap, Int, 15),
(:inverse, Bool, false),
(:boundaryGap, Union{Bool, AbstractVector}, nothing),
(:min, Union{String, Int}, "auto"),
(:max, Union{String, Int}, "auto"),
(:scale, Bool, false),
(:splitNumber, Int, 5),
(:minInterval, Int, 0),
(:interval, Int, nothing),
(:silent, Bool, true),
(:axisLine, AxisLine, nothing),
(:axisTick, AxisTick, nothing),
(:axisLabel, AxisLabel, nothing),
(:data, Dict, nothing),
]

primitivefactory(:ParallelAxis, parallelaxis_spec)
