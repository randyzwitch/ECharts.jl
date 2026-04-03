module ECharts

	using JSON, Parameters, NoveltyColors, ColorBrewer, StatsBase
	using Dates, Random, Tables
	using KernelDensity
	using LazyArtifacts
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

	export EChart, EChartRaw, echart, @echart, from_json
	export BoxPlotSeries, CandleStickSeries, ChordSeries, CustomSeries, EffectScatterSeries, FunnelSeries, GaugeSeries, GraphSeries,
	HeatmapSeries, LinesSeries, MapSeries, ParallelSeries, PictorialBarSeries, PieSeries, RadarSeries,
	SankeySeries, SunburstSeries, ThemeRiverSeries, TreeSeries, TreemapSeries, TernarySeries, XYSeries
	export Ternary, TernaryAxis
	export Title, Axis, Toolbox, DataZoom
	export Tooltip, Legend, Grid, Timeline
	export LineStyle, AreaStyle, ItemStyle, TextStyle
	export AxisLine, AxisTick, AxisLabel, SplitLine, SplitArea, MarkLine, MarkArea, MarkPoint
	export Theme, VisualMap

	export xy_plot, bar, radialbar, polarbar, line, scatter, area, waterfall, lollipop, slope, marimekko
	export bump
	export box, candlestick, sankey
	export radar, funnel
	export pie, donut, gauge, polar
	export histogram, heatmap, streamgraph, bubble
	export corrplot
	export sunburst
	export tree
	export treemap
	export parallel
	export effectscatter
	export graph
	export arcdiagram
	export calendarheatmap
	export punchcard
	export beeswarm
	export populationpyramid
	export gantt
	export ridgeline
	export violin
	export nightingale
	export bullet
	export spanchart
	export chord
	export singleaxis
	export choropleth
	export ternary

	export title!, yaxis!, xaxis!, toolbox!, colorscheme!, flip!, seriesnames!, legend!, datazoom!, smooth!
	export yline!, xline!, lineargradient, radialgradient, text!, xarea!, yarea!, xgridlines!, ygridlines!
	export radial!, jitter!, labels!, theme!, tooltip!, aria!, shadow!
	export savefig


	# Primitives - in order of descending dependency within files
	include("theme.jl")
	include("definetypes.jl")
	include("render.jl")
	include("from_json.jl")

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
	include("chartopts/shadow.jl")

	# Plots
	include("plots/xy_plot.jl")
	include("plots/bar.jl")
	include("plots/radialbar.jl")
	include("plots/polarbar.jl")
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
	include("plots/sunburst.jl")
	include("plots/tree.jl")
	include("plots/treemap.jl")
	include("plots/parallel.jl")
	include("plots/effectscatter.jl")
	include("plots/graph.jl")
	include("plots/arc_diagram.jl")
	include("plots/calendar_heatmap.jl")
	include("plots/punchcard.jl")
	include("plots/beeswarm.jl")
	include("plots/population_pyramid.jl")
	include("plots/gantt.jl")
	include("plots/ridgeline.jl")
	include("plots/violin.jl")
	include("plots/nightingale.jl")
	include("plots/bullet.jl")
	include("plots/span_chart.jl")
	include("plots/chord.jl")
	include("plots/single_axis.jl")
	include("plots/bump.jl")
	include("plots/lollipop.jl")
	include("plots/slope.jl")
	include("plots/marimekko.jl")
	include("plots/choropleth.jl")
	include("plots/ternary.jl")

	# JSON.lower hooks replace the old makevalidjson pipeline.
	# JSON.jl calls these automatically during serialization and recurses into
	# the returned value, so Vector/Dict/primitive handling is implicit.
	JSON.lower(s::Symbol) = string(s)
	JSON.lower(::Missing) = "-" # "-" represents missing in ECharts

	# By convention, fields starting with _ are reserved words — strip the prefix.
	# Fields starting with ec_ are ECharts.jl-internal and excluded from JSON output.
	function JSON.lower(x::AbstractEChartType)
	    res = Dict{String,Any}()
	    for f in fieldnames(typeof(x))
	        startswith(string(f), "ec_") && continue
	        v = getfield(x, f)
	        isnothing(v) && continue
	        key = startswith(string(f), "_") ? string(f)[2:end] : string(f)
	        res[key] = v
	    end
	    return res
	end

end # module
