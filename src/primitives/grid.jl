grid_spec =

[
(:show, Bool, false),
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{String, Int}, "auto"),
(:top, Union{String, Int}, 60),
(:right, Union{String, Int}, "10%"),
(:bottom, Union{String, Int}, 60),
(:width, Union{String, Int}, "auto"),
(:height, Union{String, Int}, "auto"),
(:containLabel, Bool, false),
(:backgroundColor, String, "transparent"),
(:borderColor, String, "#ccc"),
(:borderWidth, Int, 1),
(:shadowBlur, Int, nothing),
(:shadowColor, String, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0)
]

primitivefactory(:Grid, grid_spec)