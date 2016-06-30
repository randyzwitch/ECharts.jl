parallelaxis_spec =

[
(:dim, Int, nothing),
(:parallelIndex, Int, 0),
#(:areaSelectStyle, AreaSelectStyle, nothing),
(:_type, AbstractString, "value"),
(:name, AbstractString, nothing),
(:nameLocation, AbstractString, "start"),
(:nameTextStyle, TextStyle, "#fff"),
(:nameGap, Int, 15),
(:inverse, Bool, false),
(:boundaryGap, Union{Bool, Vector{AbstractString}}, nothing),
(:min, Union{AbstractString, Int}, "auto"),
(:max, Union{AbstractString, Int}, "auto"),
(:scale, Bool, false),
(:splitNumber, Int, 5),
(:minInterval, Int, 0),
(:interval, Int, nothing),
(:silent, Bool, true),
#(:axisLine, AxisLine, nothing),
#(:axisTick, AxisTick, nothing),
#(:axisLabel, AxisLabel, true),
(:data, Dict, nothing),
]

primitivefactory(:ParallelAxis, parallelaxis_spec)