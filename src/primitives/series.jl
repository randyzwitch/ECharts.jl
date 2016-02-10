series_spec =
[
    (:name, AbstractString, nothing),
    (:_type, AbstractString, nothing),
    (:data, AbstractVector, nothing),
    (:areaStyle, Dict, nothing),
    (:smooth, Bool, false),
    (:radius, Union{AbstractVector, AbstractString}, nothing),
    (:center, Union{AbstractVector, AbstractString}, nothing),
    (:roseType, AbstractString, nothing),
]

primitivefactory(:Series, series_spec)
