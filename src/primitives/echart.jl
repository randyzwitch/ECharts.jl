# echart_spec =
# [
#     (:backgroundColor, AbstractString, "rgba(0,0,0,0)"),
#     (:title, Title, deepcopy(Title())),
#     (:legend, Any, nothing),
#     (:toolbox, Toolbox, deepcopy(Toolbox())),
#     (:xAxis, Vector{Axis}, nothing),
#     (:yAxis, Vector{Axis}, nothing),
#     (:dataZoom, DataZoom, nothing),
#     (:series, Vector{Series}, nothing),
# ]

# primitivefactory(:EChart, echart_spec)

echart_spec =

[
(:title, Title, deepcopy(Title())),
(:legend, Legend, nothing),
(:grid, Grid, nothing),
(:xAxis, Vector{Axis}, nothing),
(:yAxis, Vector{Axis}, nothing),
(:polar, Polar, nothing),
(:radiusAxis, RadiusAxis, nothing),
(:angleAxis, AngleAxis, nothing),
(:radar, Radar, nothing),
(:dataZoom, DataZoom, nothing),
(:visualMap, VisualMap, nothing),
(:tooltip, Tooltip, nothing),
(:toolbox, Toolbox, deepcopy(Toolbox())),
(:geo, Geo, nothing),
(:parallel, Parallel, nothing),
(:parallelAxis, ParallelAxis, nothing),
(:timeline, Timeline, nothing),
(:series, Vector{Series}, nothing),
(:color, AbstractVector, ["#c23531","#2f4554", "#61a0a8", "#d48265", "#91c7ae","#749f83",  "#ca8622", "#bda29a","#6e7074", "#546570", "#c4ccd3"]),
(:backgroundColor, AbstractString, "rgba(0,0,0,0)"),
(:textStyle, TextStyle, nothing),
(:animation, Bool, true),
(:animationDuration, Int, 1000),
(:animationEasing, AbstractString, "cubicOut"),
(:animationDelay, Int, 0),
(:animationDurationUpdate, Int, 300),
(:animationEasingUpdate, AbstractString, "cubicOut"),
(:animationDelayUpdate, Int, 0)
]

primitivefactory(:EChart, echart_spec)