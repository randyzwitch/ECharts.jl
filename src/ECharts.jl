__precompile__()

module ECharts

	using JSON, Parameters, NoveltyColors, ColorBrewer, StatsBase

	export print

	export EChart
	export Title, Axis, Series, Toolbox, DataZoom
	export Tooltip, Legend, Grid, Timeline
	export LineStyle, AreaStyle, ItemStyle, ItemStyleOpts, TextStyle
	export AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea

	export line, bar, area, scatter, waterfall
	export pie, donut, radar
	export funnel, gauge, polar
	export box
	export candlestick
	export sankey
	export title!, yAxis!, xAxis!, toolbox!, colorscheme!

	#Create base color library
	const colorpalettes = merge(ColorBrewer.colorSchemes, NoveltyColors.ColorDict)

	#Primitives - in order of descending dependency within files
	include("definetypes.jl")
	include("render.jl")

	#Visualization mutating functions
	include("chartopts/utilities.jl")
	include("chartopts/modifiers.jl")

	#Plots
	include("plots/xy_plot.jl")
	include("plots/circular_plot.jl")
	include("plots/funnel_plot.jl")
	include("plots/radar_plot.jl")
	include("plots/boxplot.jl")
	include("plots/candlestick.jl")
	include("plots/sankey.jl")

	# From JMW originally
	tojs(s::Symbol) = string(s)
	tojs(v::Vector) = [tojs(v_i) for v_i in v]

	function tojs(v::Dict)
	    res = Dict()
	    for (k, v) in v
	        res[k] = tojs(v)
	    end
	    return res
	end
	tojs(x::Any) = x

	# By convention, using single underscore at beginning to get around reserved words
	# Check for this, strip off _ before creating js
	function tojs(x::AbstractEChartType)
	    res = Dict()

	    for f in fieldnames(x)
	        if getfield(x, f) != nothing
	        	startswith(string(f), "_") ? res[string(f)[2:end]] = tojs(getfield(x, f)):
	                                         res[string(f)] = tojs(getfield(x, f))
	        end
	    end
	    return res
	end

end # module
