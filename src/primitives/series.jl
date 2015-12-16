series_spec =
[
    (:zlevel, Int, 0),
    (:z, Int, 2),
    (:_type, AbstractString, nothing),
    (:name, AbstractString, nothing),
    (:tooltip, Dict{Any, Any}, nothing),
    (:clickable, Bool, true),
    (:itemStyle, Dict{Any, Any}, nothing),
    (:data, AbstractVector, nothing),
    (:markPoint, Dict{Any, Any}, nothing),
    (:markLine, Dict{Any, Any}, nothing)

]

primitivefactory(:Series, series_spec)