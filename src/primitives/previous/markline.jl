markline_spec =
[
	(:clickable, Bool, true),
	(:_symbol, Union{AbstractString, AbstractVector}, ["circle", "arrow"]),
	(:symbolsize, Union{Number, AbstractVector}, [2,4]),
	(:symbolRotate, Union{Number, AbstractVector}, nothing),
	(:large, Bool, false),
	(:smooth, Bool, false),
	(:smoothness, Number, 0.2),
	(:precision, Number, 2),
	(:bundling, Dict{Any, Any}, nothing),
	(:effect, Dict{Any, Any}, nothing),
	(:itemStyle, ItemStyle, nothing),
	(:data, AbstractVector, nothing)
]

primitivefactory(:MarkLine, markline_spec)