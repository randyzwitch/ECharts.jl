VERSION >= v"0.4" && __precompile__()

module ECharts

	using JSON
	import Base.writemime

	export print

	export EChart
	export Title, Axis, Series, Toolbox, DataZoom
	# export Tooltip, Legend, Grid, Timeline, DataRange, RoamController, Polar, MarkPoint, MarkLine
	# export LineStyle, AreaStyle, ChordStyle, NodeStyle, LinkStyle, Label, LabelLine, ItemStyle, ItemStyleOpts, TextStyle
	# export AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea
	export lineplot, barplot, areaplot, scatterplot, piechart, donutchart, gauge
	export dataformat, title!, yAxis!, xAxis!, toolbox! #, legend!, tooltip!, theme!, grid!

	#Import helper code
	include("jstypes.jl")

	#Primitives - these are (mostly) in order of descending dependency
	# include("primitives/linestyle.jl")
	# include("primitives/areastyle.jl")
	# include("primitives/chordstyle.jl")
	# include("primitives/nodestyle.jl")
	# include("primitives/linkstyle.jl")
	include("primitives/textstyle.jl")
	# include("primitives/splitarea.jl") #uses areastyle.jl
	# include("primitives/splitline.jl") #uses linestyle.jl
	# include("primitives/axislabel.jl") #uses textstyle.jl
	# include("primitives/axisline.jl") #uses linestyle.jl
	# include("primitives/axistick.jl") #uses linestyle.jl
	# include("primitives/labelline.jl") #uses linestyle.jl
	# include("primitives/label.jl") #uses textstyle.jl
	# include("primitives/itemstyleopts.jl") #uses line/area/chord/node/linkstyle.jl, label/labelline.jl
	# include("primitives/itemstyle.jl") #uses line/area/chord/node/linkstyle.jl, label/labelline.jl
	include("primitives/tooltip.jl") #uses textstyle.jl
	include("primitives/legend.jl") #uses textstyle.jl
	include("primitives/toolbox.jl")
	include("primitives/axis.jl")
	include("primitives/title.jl")
	include("primitives/grid.jl")
	include("primitives/datazoom.jl")
	include("primitives/timeline.jl") #uses text/linestyle.jl
	# include("primitives/datarange.jl") #uses textstyle.jl
	# include("primitives/roamcontroller.jl")
	include("primitives/polar.jl") #uses line/areastyle.jl
	include("primitives/radiusaxis.jl")
	include("primitives/angleaxis.jl")
	include("primitives/radar.jl")
	include("primitives/visualmap.jl")
	include("primitives/geo.jl")
	include("primitives/parallel.jl")
	include("primitives/parallelaxis.jl")
	# include("primitives/markpoint.jl") #uses itemstyle.jl
	# include("primitives/markline.jl") #uses itemstyle.jl
	include("primitives/series.jl") #uses itemstyle.jl, markpoint/line.jl, tooltip.jl
	include("primitives/echart.jl") #uses all primitives in some way
	include("render.jl") #uses echart.jl

	#Visualization mutating functions
	include("chartopts/utilities.jl")
	include("chartopts/modifiers.jl")

	#Plots
	include("plots/xy_plot.jl")
	include("plots/circular_plot.jl")




end # module
