echart_spec =
[
    (:backgroundColor, AbstractString, nothing),
    (:title, Title, deepcopy(Title())),
    (:legend, Any, nothing),
    (:toolbox, Toolbox, deepcopy(Toolbox())),
    (:xAxis, Vector{Axis}, nothing),
    (:yAxis, Vector{Axis}, nothing),
    (:dataZoom, Any, nothing),
    (:series, Any, nothing),
]

primitivefactory(:EChart, echart_spec)
