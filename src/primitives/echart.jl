echart_spec =
[
    (:backgroundColor, AbstractString, "rgba(0,0,0,0)"),
    (:title, Title, deepcopy(Title())),
    (:legend, Any, nothing),
    (:toolbox, Toolbox, deepcopy(Toolbox())),
    (:xAxis, Vector{Axis}, nothing),
    (:yAxis, Vector{Axis}, nothing),
    (:dataZoom, DataZoom, nothing),
    (:series, Vector{Series}, nothing),
]

primitivefactory(:EChart, echart_spec)
