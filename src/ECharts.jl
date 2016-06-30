VERSION >= v"0.4" && __precompile__()

module ECharts

	using JSON
	import Base.writemime

	export print

	#export EChart
	#export Title, Axis, Series, Toolbox, DataZoom
	# export Tooltip, Legend, Grid, Timeline, DataRange, RoamController, Polar, MarkPoint, MarkLine
	# export LineStyle, AreaStyle, ChordStyle, NodeStyle, LinkStyle, Label, LabelLine, ItemStyle, ItemStyleOpts, TextStyle
	# export AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea
	#export lineplot, barplot, areaplot, scatterplot, piechart, donutchart, gauge
	#export dataformat, title!, yAxis!, xAxis!, toolbox! #, legend!, tooltip!, theme!, grid!

	#Import helper code
	include("jstypes.jl")

	#Primitives - these are (mostly) in order of descending dependency
	include("primitives/textstyle.jl")
	include("primitives/grid.jl")
	include("primitives/polar.jl")
	include("primitives/title.jl") #uses textstyle.jl
	include("primitives/legend.jl") #uses textstyle.jl


	include("primitives/axis.jl") #uses AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea
	include("primitives/radiusaxis.jl") #uses AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea
	include("primitives/angleaxis.jl") #uses AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea
	include("primitives/radar.jl") #uses AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea

	include("primitives/datazoom.jl") #needs to be fleshed out
	include("primitives/visualmap.jl") #needs to be fleshed out
	include("primitives/toolbox.jl")
	include("primitives/geo.jl")
	include("primitives/tooltip.jl")
	include("primitives/parallel.jl")
	include("primitives/parallelaxis.jl") #uses textstyle.jl, AxisLabel, AxisTick
	include("primitives/timeline.jl")
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
