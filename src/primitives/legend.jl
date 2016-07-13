legend_spec =

[
(:show, Bool, true),
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{String, Int}, "auto"),
(:top, Union{String, Int}, "auto"),
(:right, Union{String, Int}, "auto"),
(:bottom, Union{String, Int}, "auto"),
(:width, Union{String, Int}, "auto"),
(:height, Union{String, Int}, "auto"),
(:orient, String, "horizontal"),
(:align, String, "auto"),
(:padding, Int, 5),
(:itemGap, Int, 10),
(:itemWidth, Int, 25),
(:itemHeight, Int, 14),
(:formatter, String, nothing), #This also takes JavaScript functions, don't know how to represent in Julia
(:selectedMode, Union{String, Bool}, true),
(:selected, Dict{String, Bool}, nothing),
(:textStyle, TextStyle, nothing),
(:data, AbstractVector, nothing), #Needs stricter type
(:backgroundColor, String, "transparent"),
(:borderColor, String, "#ccc"),
(:borderWidth, Int, 1),
(:shadowBlur, Int, nothing),
(:shadowColor, String, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
]

primitivefactory(:Legend, legend_spec)
