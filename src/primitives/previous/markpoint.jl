markpoint_spec =
[
	(:clickable, Bool, true),
	(:_symbol, AbstractString, "pin"),
	(:symbolsize, Union{Number, AbstractVector}, 10),
	(:symbolRotate, Number, nothing),
	(:large, Bool, false),
	(:effect, Dict{Any, Any}, nothing),
	(:itemStyle, ItemStyle, nothing),
	(:data, AbstractVector, nothing)
]

primitivefactory(:MarkPoint, markpoint_spec)