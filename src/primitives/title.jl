title_spec =

[
(:show, Bool, true),
(:text, AbstractString, nothing),
(:link, AbstractString, nothing),
(:target, AbstractString, "blank"),
(:textStyle, TextStyle, nothing),
(:subtext, AbstractString, nothing),
(:sublink, AbstractString, nothing),
(:subtarget, AbstractString, "blank"),
(:subtextStyle, TextStyle, nothing),
(:padding, Union{Int, Vector{Int}}, 5),
(:itemGap, Int, 5),
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{AbstractString, Int}, "left"),
(:top, Union{AbstractString, Int}, "auto"),
(:right, Union{AbstractString, Int}, "auto"),
(:bottom, Union{AbstractString, Int}, "auto"),
(:backgroundColor, AbstractString, "transparent"),
(:borderColor, AbstractString, "transparent"),
(:borderWidth, Int, 1),
(:shadowBlur, Int, nothing),
(:shadowColor, AbstractString, nothing),
(:shadowOffsetX, Int, 0),
(:shadowOffsetY, Int, 0)
]

primitivefactory(:Title, title_spec)