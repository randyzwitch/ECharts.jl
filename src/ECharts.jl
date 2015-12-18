module ECharts

	using JSON

	export print

	export EChart
	export Tooltip, Legend, Toolbox, Axis, Series, Title, Grid, DataZoom, Timeline, DataRange, RoamController, Polar, MarkPoint, MarkLine
	export LineStyle, AreaStyle, ChordStyle, NodeStyle, LinkStyle, Label, LabelLine, ItemStyle, TextStyle
	export AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea

	#Import helper code
	include("jstypes.jl")

	#Primitives - these are (mostly) in order of descending dependency
	include("primitives/linestyle.jl")
	include("primitives/areastyle.jl")
	include("primitives/chordstyle.jl")
	include("primitives/nodestyle.jl")
	include("primitives/linkstyle.jl")
	include("primitives/textstyle.jl")
	include("primitives/splitarea.jl") #uses areastyle.jl
	include("primitives/splitline.jl") #uses linestyle.jl
	include("primitives/axislabel.jl") #uses textstyle.jl
	include("primitives/axisline.jl") #uses linestyle.jl
	include("primitives/axistick.jl") #uses linestyle.jl
	include("primitives/labelline.jl") #uses linestyle.jl
	include("primitives/label.jl") #uses textstyle.jl
	include("primitives/itemstyle.jl") #uses line/area/chord/node/linkstyle.jl, label/labelline.jl
	include("primitives/tooltip.jl") #uses textstyle.jl
	include("primitives/legend.jl") #uses textstyle.jl
	include("primitives/toolbox.jl") #uses textstyle.jl
	include("primitives/axis.jl") #uses axis/line/tick/label.jl, split/line/area.jl
	include("primitives/title.jl") #uses textstyle.jl
	include("primitives/grid.jl")
	include("primitives/datazoom.jl")
	include("primitives/timeline.jl") #uses text/linestyle.jl
	include("primitives/datarange.jl") #uses textstyle.jl
	include("primitives/roamcontroller.jl")
	include("primitives/polar.jl") #uses line/areastyle.jl
	include("primitives/markpoint.jl") #uses itemstyle.jl
	include("primitives/markline.jl") #uses itemstyle.jl
	include("primitives/series.jl") #uses itemstyle.jl, markpoint/line.jl, tooltip.jl
	include("primitives/echart.jl") #uses all primitives in some way
	include("render.jl") #uses echart.jl



end # module