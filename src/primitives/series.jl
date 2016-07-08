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

    # Validate type signature
    (:left, AbstractString, nothing),
    (:right, AbstractString, nothing),
    (:top, Int, nothing),
    (:bottom, Int, nothing),
    (:width, AbstractString, nothing),
    (:min, Int, nothing),
    (:max, Int, nothing),
    (:minSize, AbstractString, "0%"),
    (:maxSize, AbstractString, "100%"),
    (:sort, AbstractString, nothing),
    (:gap, Int, nothing),
    (:label, Label, nothing),
    (:labelLine, Dict, nothing),
    (:itemStyle, ItemStyle, nothing),

]

primitivefactory(:Series, series_spec)
