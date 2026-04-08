# ECharts.jl

[![CI](https://github.com/randyzwitch/ECharts.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/randyzwitch/ECharts.jl/actions/workflows/CI.yml)

A Julia wrapper around the [Apache ECharts](https://echarts.apache.org/) JavaScript visualization library, designed to make interactive charts easy to create with minimal code.

**Documentation:** [https://randyzwitch.com/ECharts.jl/](https://randyzwitch.com/ECharts.jl/)

## Why ECharts.jl?

Most Julia plotting libraries either produce static images or require verbose configuration to get basic interactivity. ECharts.jl takes a different approach: it generates rich, interactive browser-based charts (hover tooltips, zoom sliders, toolbox, themes) from simple Julia function calls, while staying out of your way when you just need a quick visualization.

The API is intentionally opinionated — sensible defaults handle the boilerplate so you can focus on your data:

- A legend only appears when there are two or more series
- Tooltip-on-hover is enabled automatically
- Common chart options (stacking, smoothing, flipping axes) are one function call away
- `missing` values are handled natively

## Chart Types

| Category | Charts |
|---|---|
| Basic | [`bar`](https://randyzwitch.com/ECharts.jl/charts/bar/), [`line`](https://randyzwitch.com/ECharts.jl/charts/line/), [`area`](https://randyzwitch.com/ECharts.jl/charts/area/), [`differencearea`](https://randyzwitch.com/ECharts.jl/charts/differencearea/), [`scatter`](https://randyzwitch.com/ECharts.jl/charts/scatter/), [`bubble`](https://randyzwitch.com/ECharts.jl/charts/bubble/), [`effectscatter`](https://randyzwitch.com/ECharts.jl/charts/effectscatter/), [`lollipop`](https://randyzwitch.com/ECharts.jl/charts/lollipop/), [`slope`](https://randyzwitch.com/ECharts.jl/charts/slope/), [`dumbbell`](https://randyzwitch.com/ECharts.jl/charts/dumbbell/), [`divergingbar`](https://randyzwitch.com/ECharts.jl/charts/divergingbar/), [`singleaxis`](https://randyzwitch.com/ECharts.jl/charts/single_axis/) |
| Statistical | [`histogram`](https://randyzwitch.com/ECharts.jl/charts/histogram/), [`box`](https://randyzwitch.com/ECharts.jl/charts/box/), [`corrplot`](https://randyzwitch.com/ECharts.jl/charts/corrplot/), [`ecdfplot`](https://randyzwitch.com/ECharts.jl/charts/ecdfplot/), [`qqplot`](https://randyzwitch.com/ECharts.jl/charts/qqplot/), [`forestplot`](https://randyzwitch.com/ECharts.jl/charts/forestplot/), [`streamgraph`](https://randyzwitch.com/ECharts.jl/charts/streamgraph/), [`beeswarm`](https://randyzwitch.com/ECharts.jl/charts/beeswarm/), [`ridgeline`](https://randyzwitch.com/ECharts.jl/charts/ridgeline/), [`violin`](https://randyzwitch.com/ECharts.jl/charts/violin/), [`bump`](https://randyzwitch.com/ECharts.jl/charts/bump/) |
| Part-of-whole | [`pie`](https://randyzwitch.com/ECharts.jl/charts/pie/), [`donut`](https://randyzwitch.com/ECharts.jl/charts/donut/), [`funnel`](https://randyzwitch.com/ECharts.jl/charts/funnel/), [`waterfall`](https://randyzwitch.com/ECharts.jl/charts/waterfall/), [`radialbar`](https://randyzwitch.com/ECharts.jl/charts/radialbar/), [`nightingale`](https://randyzwitch.com/ECharts.jl/charts/nightingale/), [`marimekko`](https://randyzwitch.com/ECharts.jl/charts/marimekko/) |
| Hierarchical / Network | [`treemap`](https://randyzwitch.com/ECharts.jl/charts/treemap/), [`sunburst`](https://randyzwitch.com/ECharts.jl/charts/sunburst/), [`tree`](https://randyzwitch.com/ECharts.jl/charts/tree/), [`sankey`](https://randyzwitch.com/ECharts.jl/charts/sankey/), [`graph`](https://randyzwitch.com/ECharts.jl/charts/graph/), [`arcdiagram`](https://randyzwitch.com/ECharts.jl/charts/arc_diagram/), [`chord`](https://randyzwitch.com/ECharts.jl/charts/chord/) |
| Geographic | [`choropleth`](https://randyzwitch.com/ECharts.jl/charts/choropleth/), [`geoscatter`](https://randyzwitch.com/ECharts.jl/charts/geoscatter/), [`geoheatmap`](https://randyzwitch.com/ECharts.jl/charts/geoheatmap/), [`geolines`](https://randyzwitch.com/ECharts.jl/charts/geolines/) |
| Specialized | [`candlestick`](https://randyzwitch.com/ECharts.jl/charts/candlestick/), [`gauge`](https://randyzwitch.com/ECharts.jl/charts/gauge/), [`radar`](https://randyzwitch.com/ECharts.jl/charts/radar/), [`polar`](https://randyzwitch.com/ECharts.jl/charts/polar/), [`parallel`](https://randyzwitch.com/ECharts.jl/charts/parallel/), [`heatmap`](https://randyzwitch.com/ECharts.jl/charts/heatmap/), [`calendarheatmap`](https://randyzwitch.com/ECharts.jl/charts/calendar_heatmap/), [`punchcard`](https://randyzwitch.com/ECharts.jl/charts/punchcard/), [`gantt`](https://randyzwitch.com/ECharts.jl/charts/gantt/), [`bullet`](https://randyzwitch.com/ECharts.jl/charts/bullet/), [`spanchart`](https://randyzwitch.com/ECharts.jl/charts/span_chart/), [`populationpyramid`](https://randyzwitch.com/ECharts.jl/charts/population_pyramid/), [`xy_plot`](https://randyzwitch.com/ECharts.jl/charts/xy_plot/), [`polarbar`](https://randyzwitch.com/ECharts.jl/charts/polarbar/) |

## Workflow

1. Call a chart function with your data to get an `EChart` object
2. (Optional) Apply mutating functions (ending in `!`) to modify the chart
3. (Optional) Directly set fields on the `EChart` struct for fine-grained control

```julia
using ECharts

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]

# Step 1: create base chart
ar = area(x, y, color = lineargradient("purple", "cyan"))

# Step 2: modify it
smooth!(ar)
xaxis!(ar, name = "Day of Week")
yaxis!(ar, name = "Daily High Temperature °C")
```

## Faceted / Small-Multiples Charts

`facet!` splits any multi-series chart into a trellis of panels — one per series —
while preserving all styling already applied to the chart. `facet` is a convenience
form for building and faceting in one step.

```julia
# Split a grouped bar chart into panels
bar(df, :month, :sales, :region) |> facet!

# Apply styling first, then facet into a 2-column grid
ec = line(df, :quarter, :revenue, :product)
smooth!(ec)
colorscheme!(ec, ("Paired", 12))
facet!(ec; ncols = 2)

# Works with any chart type that supports a group column
scatter(df, :height, :weight, :sex) |> facet!
```

## Mutating Functions

Chart appearance and behavior can be modified after creation:

- **Axes:** [`xaxis!`](https://randyzwitch.com/ECharts.jl/functions/xaxis!_yaxis!/), [`yaxis!`](https://randyzwitch.com/ECharts.jl/functions/xaxis!_yaxis!/) (including `decimals` for tick formatting), [`xline!`](https://randyzwitch.com/ECharts.jl/functions/xline!_yline!/), [`yline!`](https://randyzwitch.com/ECharts.jl/functions/xline!_yline!/), [`xarea!`](https://randyzwitch.com/ECharts.jl/functions/xarea!_yarea!/), [`yarea!`](https://randyzwitch.com/ECharts.jl/functions/xarea!_yarea!/), [`xgridlines!`](https://randyzwitch.com/ECharts.jl/functions/xgridlines!_ygridlines!/), [`ygridlines!`](https://randyzwitch.com/ECharts.jl/functions/xgridlines!_ygridlines!/)
- **Style:** [`colorscheme!`](https://randyzwitch.com/ECharts.jl/functions/colorscheme!/), [`theme!`](https://randyzwitch.com/ECharts.jl/functions/theme!/), [`smooth!`](https://randyzwitch.com/ECharts.jl/functions/smooth!/), [`flip!`](https://randyzwitch.com/ECharts.jl/functions/flip!/), [`jitter!`](https://randyzwitch.com/ECharts.jl/functions/jitter!/), [`shadow!`](https://randyzwitch.com/ECharts.jl/functions/shadow!/), [`radial!`](https://randyzwitch.com/ECharts.jl/functions/radial!/)
- **Layout:** [`facet!`](https://randyzwitch.com/ECharts.jl/charts/facet/), [`legend!`](https://randyzwitch.com/ECharts.jl/functions/legend!/), [`title!`](https://randyzwitch.com/ECharts.jl/functions/title!/), [`toolbox!`](https://randyzwitch.com/ECharts.jl/functions/toolbox!/), [`tooltip!`](https://randyzwitch.com/ECharts.jl/functions/tooltip!/), [`datazoom!`](https://randyzwitch.com/ECharts.jl/functions/datazoom!/)
- **Data:** [`seriesnames!`](https://randyzwitch.com/ECharts.jl/functions/seriesnames!/), [`aria!`](https://randyzwitch.com/ECharts.jl/functions/aria!/), [`errorbar!`](https://randyzwitch.com/ECharts.jl/functions/errorbar!/), [`labels!`](https://randyzwitch.com/ECharts.jl/functions/labels!/), [`text!`](https://randyzwitch.com/ECharts.jl/functions/text!/), [`linreg!`](https://randyzwitch.com/ECharts.jl/functions/linreg!/), [`bollinger!`](https://randyzwitch.com/ECharts.jl/functions/bollinger!/)
- **Output:** [`savefig`](https://randyzwitch.com/ECharts.jl/functions/savefig/)

## Color & Themes

Color schemes come from [ColorBrewer.jl](https://github.com/timothyrenner/ColorBrewer.jl) and [NoveltyColors.jl](https://github.com/randyzwitch/NoveltyColors.jl), or you can pass gradient functions like `lineargradient` directly.

Fifteen pre-built themes are included: `chalk`, `dark`, `essos`, `halloween`, `infographic`, `macarons`, `roma`, `purplepassion`, `shine`, `vintage`, `walden`, `westeros`, `wonderland`, `grayscale`, and more. Custom themes can be created via the `Theme` struct or loaded from ECharts theme builder JSON.

## Output

Charts render automatically based on the environment:

| Environment | Behavior |
|---|---|
| [VS Code](https://www.julia-vscode.org/) (Julia extension) | Inline in the plot panel |
| [IJulia / Jupyter Notebook & JupyterLab](https://github.com/JuliaLang/IJulia.jl) | Inline in the notebook cell |
| [Pluto.jl](https://github.com/fonsp/Pluto.jl) | Inline in the notebook cell |
| Julia REPL | Not supported (use VS Code or Jupyter) |

No configuration required — displaying a chart is as simple as evaluating an `EChart` value in any of these environments.

### Live / real-time charts

`livechart` wraps any `EChart` in a local HTTP server and returns an `EChartLive`
object. Call `update!` with new data to push changes to the browser without reloading
the page — useful for dashboards and streaming data.

```julia
ec = bar(["A", "B", "C"], [1, 2, 3])
lc = livechart(ec)               # opens in browser, starts polling server

update!(lc, bar(["A", "B", "C"], [4, 1, 6]))   # chart updates in place
```

### Saving charts to disk

Use `savefig` to write a chart to a file. Three formats are supported:

| Format | Extension | Notes |
|---|---|---|
| HTML | `.html` | Self-contained file with bundled ECharts JS — open in any browser |
| JSON | `.json` | Raw ECharts option payload — useful for embedding or further processing |
| SVG | `.svg` | Server-side rendered via [NodeJS.jl](https://github.com/nicholasfasching/NodeJS.jl) — no browser required, suitable for CI/headless environments |

```julia
using ECharts

chart = bar(["A", "B", "C"], [1, 2, 3])

savefig("chart.html", chart)   # interactive HTML
savefig("chart.json", chart)   # ECharts option JSON
savefig("chart.svg", chart)    # static SVG (server-side rendered)
```

SVG export uses ECharts' built-in `renderToSVGString` SSR API and requires [NodeJS.jl](https://github.com/nicholasfasching/NodeJS.jl) to be installed. It is loaded lazily — there is no startup overhead when only using HTML or JSON output.

## Geographic Maps

All geographic chart types (`choropleth`, `geoscatter`, `geoheatmap`, `geolines`) share a common `map` and `geojson` interface:

- **`map = "world"`** (default): uses the built-in world map
- **215 country/region maps** (e.g. `"Germany"`, `"USA"`, `"Antigua_and_Barbuda"`): loaded automatically from the bundled artifact — no extra downloads needed
- **Custom GeoJSON**: pass a raw GeoJSON string via `geojson` and a name via `map` to register any map

```julia
# World choropleth
choropleth(country_names, values)

# Country-level map — loaded from bundled artifact
choropleth(state_names, values; map = "USA")

# Custom GeoJSON from disk
geojson_str = read("my_regions.geojson", String)
choropleth(region_names, values; map = "My Regions", geojson = geojson_str)

# Points on a map
geoscatter(lon, lat)
geoscatter(lon, lat, value)          # colour-coded by value

# Heatmap on a map
geoheatmap(lon, lat, intensity)

# Flow lines between coordinates
geolines(start_lon, start_lat, end_lon, end_lat)
geolines(start_lon, start_lat, end_lon, end_lat; effect = true)  # animated trail
```

All four functions also accept a `roam = true` keyword to enable pan and zoom.

## Tables.jl Support

Most chart functions accept any [Tables.jl](https://github.com/JuliaData/Tables.jl)-compatible table alongside column symbols, making it easy to plot tabular data without pre-processing. This includes `DataFrame`, `CSV.File`, `TypedTables.Table`, a `NamedTuple` of vectors, and more:

```julia
bar(df, :category, :value)
bar(df, :category, :value, :group)  # grouped/stacked by a third column
```
