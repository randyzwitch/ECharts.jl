title_spec =

[
(:show, Bool, true),
(:text, String, nothing),
(:link, String, nothing),
(:target, String, "blank"),
(:textStyle, TextStyle, nothing),
(:subtext, String, nothing),
(:sublink, String, nothing),
(:subtarget, String, "blank"),
(:subtextStyle, TextStyle, nothing),
(:padding, Union{Int, Vector{Int}}, 5),
(:itemGap, Int, 5),
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{String, Int}, "left"),
(:top, Union{String, Int}, "auto"),
(:right, Union{String, Int}, "auto"),
(:bottom, Union{String, Int}, "auto"),
(:backgroundColor, String, "transparent"),
(:borderColor, String, "transparent"),
(:borderWidth, Int, 1),
(:shadowBlur, Int, nothing),
(:shadowColor, String, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0)
]

primitivefactory(:Title, title_spec)