echart_spec =
[
    (:title, Title, deepcopy(Title())),
    (:legend, Any, nothing),
    (:toolbox, Any, nothing),
    (:xAxis, Vector{Axis}, nothing),
    (:yAxis, Vector{Axis}, nothing),
    (:dataZoom, Any, nothing),
    (:series, Any, nothing),
]

primitivefactory(:EChart, echart_spec)
