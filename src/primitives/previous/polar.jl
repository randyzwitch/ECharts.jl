polar_spec =
[
    (:zlevel, Int, 0),
    (:z, Int, 0),
    (:center, AbstractVector, ["50%", "50%"]),
    (:radius, AbstractString, "75%"),
    (:startAngle, Int, 90),
    (:splitNumber, Int, 5),
    (:name, Label, nothing),
    (:boundaryGap, AbstractVector, [0,0]),
    (:scale, Bool, false),
    (:axisLine, LineStyle, nothing),
    (:axisLabel, Dict{Any, Any}, Dict{Any, Any}("show" => false)),
    (:splitLine, LineStyle, nothing),
    (:splitArea, AreaStyle, nothing),
    (:_type, AbstractString, "polygon"),
    (:indicator, AbstractVector, nothing)
]

primitivefactory(:Polar, polar_spec)