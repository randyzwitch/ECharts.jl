VERSION >= v"0.4" && __precompile__()

module ECharts

	using JSON, Parameters
	import Base.writemime

	export print

	export EChart
	export Title, Axis, Series, Toolbox, DataZoom
	export Tooltip, Legend, Grid, Timeline
	export LineStyle, AreaStyle, ItemStyle, ItemStyleOpts, TextStyle
	export AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea

	export lineplot, barplot, areaplot, scatterplot 
	export piechart, donutchart, radarchart
	export funnel, gauge
	export title!, yAxis!, xAxis!, toolbox!

	#Import helper code
	include("jstypes.jl")

	#Primitives - in order of descending dependency
	#AbstractVectors should be defined more strictly
	include("primitives/linestyle.jl")
	include("primitives/areastyle.jl")
	include("primitives/textstyle.jl")
	include("primitives/splitarea.jl")
	include("primitives/splitline.jl")
	include("primitives/axislabel.jl")
	include("primitives/axisline.jl")
	include("primitives/axistick.jl")
	include("primitives/label.jl")
	include("primitives/itemstyle.jl")
	include("primitives/iconstyle.jl")
	include("primitives/axispointer.jl")
	include("primitives/tooltip.jl")
	include("primitives/legend.jl")
	include("primitives/toolbox.jl")
	include("primitives/axis.jl")
	include("primitives/title.jl")
	include("primitives/grid.jl")
	include("primitives/datazoom.jl") #Needs a lot of work still
	include("primitives/timeline.jl")
	include("primitives/polar.jl")
	include("primitives/radiusaxis.jl")
	include("primitives/angleaxis.jl")
	include("primitives/radar.jl")
	include("primitives/visualmap.jl") #Needs a lot of work still
	include("primitives/geo.jl")
	include("primitives/parallel.jl")
	include("primitives/parallelaxis.jl")
	include("primitives/series.jl")
	include("primitives/echart.jl")
	include("render.jl")

	#Visualization mutating functions
	include("chartopts/utilities.jl")
	include("chartopts/modifiers.jl")

	#Plots
	include("plots/xy_plot.jl")
	include("plots/circular_plot.jl")
	include("plots/funnel_plot.jl")
	include("plots/radar_plot.jl")

end # module
