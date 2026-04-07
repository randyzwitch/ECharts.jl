using Documenter
using ECharts

# Tell ECharts to skip inlining echarts.min.js — it's loaded once as a page asset below.
ENV["ECHARTS_DOCS_BUILD"] = "true"

# Wrap echarts.min.js so it doesn't conflict with Documenter's RequireJS.
# Echarts detects `define` and tries to register as an anonymous AMD module,
# which RequireJS rejects. Hiding `define` during load prevents this.
mkpath(joinpath(@__DIR__, "src/assets"))
let echarts_src = read(joinpath(@__DIR__, "../src/echarts.min.js"), String)
    wrapped = """
(function() {
    var _define = window.define;
    window.define = undefined;
    $echarts_src
    window.define = _define;
}());
"""
    write(joinpath(@__DIR__, "src/assets/echarts.min.js"), wrapped)
end

makedocs(
    sitename = "ECharts.jl",
    modules = [ECharts],
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        assets = ["assets/echarts.min.js"],
        size_threshold = 512 * 1024,
        size_threshold_warn = 256 * 1024,
    ),
    pages = [
        "Home" => "index.md",
        "Charts" => [
            "charts/arc_diagram.md",
            "charts/area.md",
            "charts/bar.md",
            "charts/beeswarm.md",
            "charts/bump.md",
            "charts/box.md",
            "charts/bubble.md",
            "charts/bullet.md",
            "charts/calendar_heatmap.md",
            "charts/candlestick.md",
            "charts/chord.md",
            "charts/choropleth.md",
            "charts/corrplot.md",
            "charts/divergingbar.md",
            "charts/donut.md",
            "charts/echart_raw.md",
            "charts/ecdfplot.md",
            "charts/effectscatter.md",
            "charts/funnel.md",
            "charts/gantt.md",
            "charts/gauge.md",
            "charts/graph.md",
            "charts/heatmap.md",
            "charts/histogram.md",
            "charts/line.md",
            "charts/lollipop.md",
            "charts/marimekko.md",
            "charts/nightingale.md",
            "charts/parallel.md",
            "charts/pie.md",
            "charts/punchcard.md",
            "charts/population_pyramid.md",
            "charts/polar.md",
            "charts/polarbar.md",
            "charts/radar.md",
            "charts/radialbar.md",
            "charts/ridgeline.md",
            "charts/sankey.md",
            "charts/scatter.md",
            "charts/slope.md",
            "charts/single_axis.md",
            "charts/span_chart.md",
            "charts/streamgraph.md",
            "charts/sunburst.md",
            "charts/tree.md",
            "charts/treemap.md",
            "charts/violin.md",
            "charts/waterfall.md",
            "charts/xy_plot.md",
        ],
        "Modifier Functions" => [
            "functions/aria!.md",
            "functions/colorscheme!.md",
            "functions/flip!.md",
            "functions/jitter!.md",
            "functions/labels!.md",
            "functions/legend!.md",
            "functions/lineargradient.md",
            "functions/radial!.md",
            "functions/radialgradient.md",
            "functions/seriesnames!.md",
            "functions/datazoom!.md",
            "functions/shadow!.md",
            "functions/smooth!.md",
            "functions/text!.md",
            "functions/theme!.md",
            "functions/title!.md",
            "functions/toolbox!.md",
            "functions/tooltip!.md",
            "functions/xarea!_yarea!.md",
            "functions/xaxis!_yaxis!.md",
            "functions/xgridlines!_ygridlines!.md",
            "functions/xline!_yline!.md",
        ],
        "Types" => "types.md",
        "API Reference" => "api.md",
    ],
    checkdocs = :exports,
    warnonly = true,
)

deploydocs(
    repo = "github.com/randyzwitch/ECharts.jl.git",
    devbranch = "master",
)

# siteinfo.js and versions.js are only generated during real deployments;
# create stubs so local previews don't log 404 errors for them.
if !isfile(joinpath(@__DIR__, "build/siteinfo.js"))
    write(joinpath(@__DIR__, "build/siteinfo.js"),
          "var DOCUMENTER_CURRENT_VERSION = \"dev\";\n" *
          "var DOCUMENTER_NEWEST = \"dev\";\n" *
          "var DOCUMENTER_STABLE = \"\";\n")
end
if !isfile(joinpath(@__DIR__, "versions.js"))
    write(joinpath(@__DIR__, "versions.js"),
          "var DOCUMENTER_VERSIONS = [\"dev\"];\n")
end
