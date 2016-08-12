radar_spec =

[
(:zlevel, Int, 0),
(:z, Int, 2),
(:center, Vector{String}, ["50%", "50%"]),
(:radius, Union{Int, String}, "75%"),
(:startAngle, Int, 90),
(:name, Dict{Any, Any}, nothing),
(:nameGap, Int, 15),
(:silent, Bool, true),
(:axisLine, AxisLine, nothing),
(:axisTick, AxisTick, nothing),
(:axisLabel, AxisLabel, nothing),
(:splitLine, SplitLine, nothing),
(:splitArea, SplitArea, nothing),
(:indicator, AbstractVector, nothing),
]

primitivefactory(:Radar, radar_spec)
