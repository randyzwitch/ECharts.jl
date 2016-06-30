grid_spec =

[
(:show, Bool, false),
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{AbstractString, Int}, "auto"),
(:top, Union{AbstractString, Int}, 60),
(:right, Union{AbstractString, Int}, "10%"),
(:bottom, Union{AbstractString, Int}, 60),
(:width, Union{AbstractString, Int}, "auto"),
(:height, Union{AbstractString, Int}, "auto"),
(:containLabel, Bool, false),
(:backgroundColor, AbstractString, "transparent"),
(:borderColor, AbstractString, "#ccc"),
(:borderWidth, Int, 1),
(:shadowBlur, Int, nothing),
(:shadowColor, AbstractString, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0)
]

primitivefactory(:Grid, grid_spec)