series_spec =
[
    (:_type, AbstractString, nothing),
    (:data, AbstractVector, nothing),
    (:areaStyle, Dict, nothing),
    (:smooth, Bool, false),
]

primitivefactory(:Series, series_spec)
