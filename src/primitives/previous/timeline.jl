timeline_spec =
[
	(:show, Bool, true),
	(:zlevel, Int, 0),
	(:z, Int, 4),
	(:_type, AbstractString, "time"),
	(:notMerge, Bool, false),
	(:realtime, Bool, true),
	(:x, Int, 80),
	(:y, Union{Number, AbstractString}, nothing),
	(:x2, Int, 80),
	(:y2, Int, 0),
	(:width, Int, nothing),
	(:height, Int, 50),
	(:backgroundColor, AbstractString, "rgba(0,0,0,0)"),
	(:borderWidth, Int, 0),
	(:borderColor, AbstractString, "#ccc"),
	(:padding, Union{Int, AbstractVector}, 5),
	(:controlPosition, AbstractString, "left"),
	(:autoPlay, Bool, false),
	(:loop, Bool, true),
	(:playInterval, Int, 2000),
	(:lineStyle, LineStyle, nothing),
	(:label, TextStyle, nothing),
	(:checkpointStyle, Dict{Any, Any}, nothing),
	(:controlStyle, Dict{Any, Any}, nothing),
	(:symbol, AbstractString, "emptyDiamond"),
	(:symbolSize, Int, 4),
	(:currentIndex, Int, 0),
	(:data, AbstractVector, nothing)
]

primitivefactory(:Timeline, timeline_spec)