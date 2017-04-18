__precompile__()

module ECharts

	using JSON, Parameters, NoveltyColors, ColorBrewer, StatsBase
	import Base.hcat, Base.print, Base.show

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
	export AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea
	export JSFunction

	export line, bar, area, scatter, waterfall
	export pie, donut, radar
	export funnel, gauge, polar
	export box
	export candlestick
	export sankey
	export title!, yAxis!, xAxis!, toolbox!, colorscheme!, flip!, seriesnames!, legend!, slider!

	#Define custom JSON serialization rule
	immutable JSSerialization <: CommonSerialization end
	immutable JSFunction
		data::String
	end

	function JSON.show_json(io::StructuralContext,
							  ::JSSerialization, f::JSFunction)
		#first = true
		for line in split(f.data, '\n')
			# if !first
			# 	JSON.indent(io)
			# end
			# first = false
			Base.print(io, line)
		end
	end

	#this is a package local function, it is not overloading JSON.json
	json(x) = sprint(JSON.show_json, JSSerialization(), x)
	#end custom JSON serialization rule

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
	makevalidjson(s::Symbol) = string(s)
	makevalidjson(v::Vector) = [makevalidjson(v_i) for v_i in v]

	function makevalidjson(v::Dict)
	    res = Dict()
	    for (k, v) in v
	        res[k] = makevalidjson(v)
	    end
	    return res
	end
	makevalidjson(x::Any) = x

	# By convention, using single underscore at beginning to get around reserved words
	# Check for this, strip off _ before creating js
	function makevalidjson(x::AbstractEChartType)
	    res = Dict()

	    for f in fieldnames(x)
	        if getfield(x, f) != nothing
	        	startswith(string(f), "_") ? res[string(f)[2:end]] = makevalidjson(getfield(x, f)): res[string(f)] = makevalidjson(getfield(x, f))
	        end
	    end
	    return res
	end

end # module
