echart_spec =
[
    (:tooltip, Tooltip, nothing),
    (:legend, Legend, nothing),
    (:toolbox, Toolbox, nothing),
    (:xAxis, Vector{Axis}, nothing),
    (:yAxis, Vector{Axis}, nothing),
    (:series, Vector{Series}, nothing),

]

primitivefactory(:EChart, echart_spec)