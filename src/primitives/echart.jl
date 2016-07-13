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
(:color, AbstractVector, nothing),
(:backgroundColor, String, nothing),
(:textStyle, TextStyle, nothing),
(:animation, Bool, nothing),
(:animationDuration, Int, nothing),
(:animationEasing, String, nothing),
(:animationDelay, Int, nothing),
(:animationDurationUpdate, Int, nothing),
(:animationEasingUpdate, String, nothing),
(:animationDelayUpdate, Int, nothing)
]

primitivefactory(:EChart, echart_spec)
