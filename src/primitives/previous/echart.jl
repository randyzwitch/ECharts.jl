echart_spec =
[
    (:theme, Any, "default"),
    (:backgroundColor, AbstractString, "rgba(0,0,0,0)"),
    (:color, AbstractVector, nothing),
    (:renderAsImage, Bool, false),
    (:calculable, Bool, false),
    (:calculableColor, AbstractString,"rgba(255,165,0,0.6)"),
    (:calculableHolderColor,AbstractString, "#ccc"),
    (:animation, Bool, true),
    (:animationThreshold, Int, 2000),
    (:animationDuration, Int, 2000),
    (:animationDurationUpdate, Int, 500),
    (:animationEasing, AbstractString, "ExponentialOut"),
    (:addDataAnimation, Bool, true),
    (:timeline, Timeline, nothing), #Causes error in default state
    (:title, Title, deepcopy(Title())),
    (:toolbox, Toolbox, deepcopy(Toolbox())),
    (:tooltip, Tooltip, deepcopy(Tooltip())),
    (:legend, Legend, deepcopy(Legend())),
    (:dataRange, DataRange, nothing), #Can't have empty DataRange() here without definining min/max
    (:dataZoom, DataZoom, deepcopy(DataZoom())),
    (:roamController, RoamController, deepcopy(RoamController())),
    (:grid, Grid, deepcopy(Grid())),
    (:xAxis, Vector{Axis}, nothing),
    (:yAxis, Vector{Axis}, nothing),
    (:series, Vector{Series}, nothing),
    (:loadingText, AbstractString, "Data Loading..."),
    (:loadingEffect, AbstractString, "spin"),
    (:noDataText, AbstractString, "No Data"),
    (:noDataEffect, AbstractString, "bubble"),
    (:DRAG_ENABLE_TIME, Int, 120),
    (:EFFECT_ZLEVEL, Int, 10),
    (:valueConnector, AbstractString, ": "),
    (:nameConnector,AbstractString, " & "),
    (:symbolList, AbstractVector, nothing)
]

primitivefactory(:EChart, echart_spec)
