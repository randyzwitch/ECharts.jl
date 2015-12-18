polar_spec =
[
    (:zlevel, Int, 0),
    (:z, Int, 0),
    (:center, AbstractVector, ["50%", "50%"]),
    (:radius, AbstractString, "75%"),
    (:startAngle, Int, 90),
    (:splitNumber, Int, 5),
    (:name, Dict{Any, Any}, nothing),
    (:boundaryGap, AbstractVector, [0,0]),
    (:scale, Bool, false),
    (:axisLine, Dict{Any, Any}, Dict{Any, Any}("show" => true)),
    (:axisLabel, Dict{Any, Any}, Dict{Any, Any}("show" => false)),
    (:splitLine, Dict{Any, Any}, Dict{Any, Any}("show" => true)),
    (:splitArea, Dict{Any, Any}, Dict{Any, Any}("show" => true)),
    (:_type, AbstractString, "polygon"),
    (:indicator, AbstractVector, nothing)
]

primitivefactory(:Polar, polar_spec)