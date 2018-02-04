__precompile__()

module ECharts

	using JSON, Parameters, NoveltyColors, ColorBrewer, StatsBase, Juno, Blink, Atom, DataFrames
	using KernelDensity, Distributions, Missings
	import Base.print, Base.show

	import JSON
	using JSON.StructuralContext
	using JSON.Serializations.CommonSerialization

	export print

	#Create base color library
	const colorpalettes = merge(ColorBrewer.colorSchemes, NoveltyColors.ColorDict)
	export colorpalettes

	export EChart
	export Title, Axis, Series, Toolbox, DataZoom
	export Tooltip, Legend, Grid, Timeline
	export LineStyle, AreaStyle, ItemStyle, ItemStyleOpts, TextStyle
	export AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea, MarkLine, MarkArea, MarkPoint
	export JSFunction, Theme, VisualMap

	export xy_plot, bar, radialbar, line, scatter, area, waterfall
	export box, candlestick, sankey
	export radar, funnel
	export pie, donut, gauge, polar
	export histogram, heatmap, streamgraph, bubble
	export corrplot

	export title!, yaxis!, xaxis!, toolbox!, colorscheme!, flip!, seriesnames!, legend!, slider!, smooth!
	export yline!, xline!, lineargradient, radialgradient, text!, xarea!, yarea!, xgridlines!, ygridlines!
	export radial!, jitter!, labels!

	#This is a package local function, it is NOT overloading JSON.json
	#Define custom JSON serialization rule
	struct JSSerialization <: CommonSerialization end
	struct JSFunction
		data::String
	end

	function JSON.show_json(io::StructuralContext, ::JSSerialization, f::JSFunction)
		for line in split(f.data, '\n')
			Base.print(io, line)
		end
	end

	json(x) = sprint(JSON.show_json, JSSerialization(), x)
	#end custom JSON serialization rule

	#Primitives - in order of descending dependency within files
	include("theme.jl")
	include("definetypes.jl")
	include("render.jl")

	#Visualization mutating functions
	include("chartopts/utilities.jl")
	include("chartopts/modifiers.jl")
	include("chartopts/js_to_julia.jl")

	#Plots
	include("plots/xy_plot.jl")
	include("plots/bar.jl")
	include("plots/radialbar.jl")
	include("plots/line.jl")
	include("plots/scatter.jl")
	include("plots/area.jl")
	include("plots/radar.jl")
	include("plots/circular_plot.jl")
	include("plots/pie.jl")
	include("plots/donut.jl")
	include("plots/gauge.jl")
	include("plots/polar.jl")
	include("plots/funnel.jl")
	include("plots/waterfall.jl")
	include("plots/box.jl")
	include("plots/candlestick.jl")
	include("plots/sankey.jl")
	include("plots/heatmap.jl")
	include("plots/histogram.jl")
	include("plots/streamgraph.jl")
	include("plots/bubble.jl")
	include("plots/corrplot.jl")

	# From JMW originally
	makevalidjson(s::Symbol) = string(s)
	makevalidjson(v::Vector) = [makevalidjson(v_i) for v_i in v]

	function makevalidjson(v::Dict)
	    res = Dict()
	    for (k, v) in v
	        res[k] = makevalidjson(v)
	    end
	    return res
	end
	makevalidjson(x::Missing) = "-" #this is a backstop to a value of missing getting to render step. "-" represents missing in ECharts
	makevalidjson(x::Any) = x

	# By convention, using single underscore at beginning to get around reserved words
	# Check for this, strip off _ before creating js
	function makevalidjson(x::AbstractEChartType)
	    res = Dict()

	    for f in fieldnames(x)
	        if getfield(x, f) != nothing
	        	startswith(string(f), "_") ? res[string(f)[2:end]] = makevalidjson(getfield(x, f)) : res[string(f)] = makevalidjson(getfield(x, f))
	        end
	    end
	    return res
	end

end # module
