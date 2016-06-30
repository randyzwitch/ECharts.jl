radar_spec =

[
(:zlevel, Int, 0),
(:z, Int, 2),
(:center, Vector{AbstractString}, ["50%", "50%"]),
(:radius, Union{Int, AbstractString}, "75%"),
(:startAngle, Int, 90),
(:name, Dict{Any, Any}, true),
(:nameGap, Int, 15),
(:silent, Bool, true),
#(:axisLine, AxisLine, nothing), #fill in
#(:axisTick, AxisTick, nothing), #fill in
#(:axisLabel, AxisLabel, nothing), #fill in
#(:splitLine, SplitLine, nothing), #fill in
#(:splitArea, SplitArea, nothing), #fill in
(:indicator, Vector{Any}, nothing),
]

primitivefactory(:Radar, radar_spec)