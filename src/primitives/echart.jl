echart_spec =
[
    (:theme, Any, nothing),
    (:backgroundColor, AbstractString, nothing),
    (:color, AbstractVector, nothing),
    (:renderAsImage, Bool, false),
    (:calculable, Bool, false),
    (:animation, Bool, true),
    (:timeline, Any, nothing),
    (:title, Title, nothing),
    (:toolbox, Toolbox, nothing),
    (:tooltip, Tooltip, nothing),
    (:legend, Legend, nothing),
    (:dataRange, Any, nothing),
    (:dataZoom, DataZoom, nothing),
    (:roamController, Any, nothing),
    (:grid, Grid, nothing),
    (:xAxis, Vector{Axis}, nothing),
    (:yAxis, Vector{Axis}, nothing),
    (:series, Vector{Series}, nothing)
]

primitivefactory(:EChart, echart_spec)