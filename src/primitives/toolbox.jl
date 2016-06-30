toolbox_spec =
[
    (:show, Bool, true),
    (:orient, AbstractString, "horizontal"),
    (:itemSize, Number, 15),
    (:itemGap, Number, 10),
    (:showTitle, Bool, true),
    # (:feature, Feature, nothing)
    # (:iconStyle, IconStyle, nothing)
    (:zlevel, Int, 0),
    (:z, Int, 2),
    (:left, Union{Int, AbstractString}, "auto"),
    (:top, Union{Int, AbstractString}, "auto"),
    (:right, Union{Int, AbstractString}, "auto"),
    (:bottom, Union{Int, AbstractString}, "auto"),
    (:width, Union{Int, AbstractString}, "auto"),
    (:height, Union{Int, AbstractString}, "auto"),
]

primitivefactory(:Toolbox, toolbox_spec)