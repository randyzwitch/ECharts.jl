legend_spec =

[
(:show, Bool, true),
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{AbstractString, Int}, "auto"),
(:top, Union{AbstractString, Int}, "auto"),
(:right, Union{AbstractString, Int}, "auto"),
(:bottom, Union{AbstractString, Int}, "auto"),
(:width, Union{AbstractString, Int}, "auto"),
(:height, Union{AbstractString, Int}, "auto"),
(:orient, AbstractString, "horizontal"),
(:align, AbstractString, "auto"),
(:padding, Int, 5),
(:itemGap, Int, 10),
(:itemWidth, Int, 25),
(:itemHeight, Int, 14),
(:formatter, AbstractString, nothing), #This also takes JavaScript functions, don't know how to represent in Julia
(:selectedMode, Union{AbstractString, Bool}, true),
(:selected, Dict{AbstractString, Bool}, nothing),
(:textStyle, TextStyle, nothing),
(:data, AbstractVector, nothing), #Needs stricter type
(:backgroundColor, AbstractString, "transparent"),
(:borderColor, AbstractString, "#ccc"),
(:borderWidth, Int, 1),
(:shadowBlur, Int, nothing),
(:shadowColor, AbstractString, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0),
]

primitivefactory(:Legend, legend_spec)
