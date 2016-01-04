itemopts_spec =
[
	(:color, Union{AbstractString, Dict{Any, Any}}, nothing),
	(:lineStyle, LineStyle, nothing),
	(:areaStyle, AreaStyle, nothing),
	(:chordStyle, ChordStyle, nothing),
	(:nodeStyle, NodeStyle, nothing),
	(:linkStyle, LinkStyle, nothing),
	(:borderColor, AbstractString, nothing),
	(:borderWidth, Number, nothing),
	(:barBorderColor, AbstractString, "#fff"),
	(:barBorderRadius, Number, 0),
	(:label, Label, nothing),
	(:labelLine, LabelLine, LabelLine(show = true))
]

primitivefactory(:ItemStyleOpts, itemopts_spec)