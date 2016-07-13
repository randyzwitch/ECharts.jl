series_spec =
[
    (:name, String, nothing),
    (:_type, String, nothing),
    (:data, AbstractVector, nothing),
    (:areaStyle, Dict, nothing),
    (:smooth, Bool, false),
    (:radius, Union{AbstractVector, String}, nothing),
    (:center, Union{AbstractVector, String}, nothing),
    (:roseType, String, nothing),

    # Validate type signature
    (:left, String, nothing),
    (:right, String, nothing),
    (:top, Int, nothing),
    (:bottom, Int, nothing),
    (:width, String, nothing),
    (:min, Int, nothing),
    (:max, Int, nothing),
    (:minSize, String, "0%"),
    (:maxSize, String, "100%"),
    (:sort, String, nothing),
    (:gap, Int, nothing),
    (:label, Label, nothing),
    (:labelLine, Dict, nothing),
    (:itemStyle, ItemStyle, nothing),

]

primitivefactory(:Series, series_spec)
