module ECharts

	using JSON, Parameters, NoveltyColors, ColorBrewer, StatsBase
	using Dates, Random, DataFrames
	using KernelDensity
	import Base: print, show
	import LinearAlgebra: triu!, triu, tril, tril!

	export print

	# Create base color library
	"""
	    colorpalettes

	A merged dictionary of named color palettes from
	[ColorBrewer.jl](https://github.com/timothyrenner/ColorBrewer.jl) and
	[NoveltyColors.jl](https://github.com/randyzwitch/NoveltyColors.jl).
	Pass a key from this dict to [`colorscheme!`](@ref) to apply a named palette to a chart.
	"""
	const colorpalettes = merge(ColorBrewer.colorSchemes, NoveltyColors.ColorDict)
	export colorpalettes

	export EChart, EChartRaw, echart, @echart
	export BoxPlotSeries, CandleStickSeries, EffectScatterSeries, FunnelSeries, GaugeSeries, GraphSeries,
	HeatmapSeries, LinesSeries, MapSeries, ParallelSeries, PictorialBarSeries, PieSeries, RadarSeries,
	SankeySeries, SunburstSeries, ThemeRiverSeries, TreeSeries, TreemapSeries, XYSeries
	export Title, Axis, Toolbox, DataZoom
	export Tooltip, Legend, Grid, Timeline
	export LineStyle, AreaStyle, ItemStyle, TextStyle
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
	export radial!, jitter!, labels!, theme!, tooltip!, aria!

	"""
	    JSFunction(data::String)

	Wraps a raw JavaScript string so it is emitted verbatim (unquoted) in the JSON passed to
	ECharts.  Use this wherever the ECharts API expects a JavaScript callback rather than a
	plain value, such as custom `formatter`, `symbolSize`, or gradient expressions.

	## Example
	```julia
	bar(x, y; symbolSize = JSFunction("function(val){ return val * 2; }"))
	```
	"""
	struct JSFunction
		data::String
	end

	json(x) = JSON.json(x)

	# Primitives - in order of descending dependency within files
	include("theme.jl")
	include("definetypes.jl")
	include("render.jl")

	# Visualization mutating functions
	include("chartopts/utilities.jl")
	include("chartopts/seriesnames.jl")
	include("chartopts/xyaxis.jl")
	include("chartopts/gridlines.jl")
	include("chartopts/colorscheme.jl")
	include("chartopts/titletext.jl")
	include("chartopts/smooth.jl")
	include("chartopts/toolbox.jl")
	include("chartopts/tooltip.jl")
	include("chartopts/legend.jl")
	include("chartopts/xyline.jl")
	include("chartopts/xyarea.jl")
	include("chartopts/flip.jl")
	include("chartopts/slider.jl")
	include("chartopts/labels.jl")
	include("chartopts/jitter.jl")
	include("chartopts/theme.jl")
	include("chartopts/radial.jl")
	include("chartopts/gradients.jl")
	include("chartopts/aria.jl")

	# Plots
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
	makevalidjson(f::JSFunction) = JSON.JSONText(f.data)
	makevalidjson(s::Symbol) = string(s)
	makevalidjson(v::Vector) = [makevalidjson(v_i) for v_i in v]

	function makevalidjson(v::Dict)
	    res = Dict()
	    for (k, v) in v
	        res[k] = makevalidjson(v)
	    end
	    return res
	end
	makevalidjson(x::Missing) = "-" # this is a backstop to a value of missing getting to render step. "-" represents missing in ECharts
	makevalidjson(x::Any) = x

	# By convention, using single underscore at beginning to get around reserved words
	# Check for this, strip off _ before creating js
	function makevalidjson(x::AbstractEChartType)
	    res = Dict()

	    for f in fieldnames(typeof(x))
	        if !isnothing(getfield(x, f))
	        	startswith(string(f), "_") ? res[string(f)[2:end]] = makevalidjson(getfield(x, f)) : res[string(f)] = makevalidjson(getfield(x, f))
	        end
	    end
	    return res
	end

end # module
