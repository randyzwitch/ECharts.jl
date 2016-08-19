__precompile__()

module ECharts

	using JSON, Parameters

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

	#Primitives - in order of descending dependency within files
	include("primitives/definetypes.jl")
	include("primitives/constructors.jl")
	include("primitives/tojs.jl")
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
