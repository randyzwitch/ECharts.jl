# ECharts.jl

[![CI](https://github.com/randyzwitch/ECharts.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/randyzwitch/ECharts.jl/actions/workflows/CI.yml)

A Julia wrapper around the [Apache ECharts](https://echarts.apache.org/) JavaScript visualization library, designed to make interactive charts easy to create with minimal code.

**Documentation:** [https://randyzwitch.com/ECharts.jl/](http://randyzwitch.com/ECharts.jl/)

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
| Basic | [`bar`](https://randyzwitch.com/ECharts.jl/charts/bar/), [`line`](https://randyzwitch.com/ECharts.jl/charts/line/), [`area`](https://randyzwitch.com/ECharts.jl/charts/area/), [`scatter`](https://randyzwitch.com/ECharts.jl/charts/scatter/), [`bubble`](https://randyzwitch.com/ECharts.jl/charts/bubble/), [`effectscatter`](https://randyzwitch.com/ECharts.jl/charts/effectscatter/) |
| Statistical | [`histogram`](https://randyzwitch.com/ECharts.jl/charts/histogram/), [`box`](https://randyzwitch.com/ECharts.jl/charts/box/), [`corrplot`](https://randyzwitch.com/ECharts.jl/charts/corrplot/), [`streamgraph`](https://randyzwitch.com/ECharts.jl/charts/streamgraph/), [`beeswarm`](https://randyzwitch.com/ECharts.jl/charts/beeswarm/), [`ridgeline`](https://randyzwitch.com/ECharts.jl/charts/ridgeline/), [`violin`](https://randyzwitch.com/ECharts.jl/charts/violin/) |
| Part-of-whole | [`pie`](https://randyzwitch.com/ECharts.jl/charts/pie/), [`donut`](https://randyzwitch.com/ECharts.jl/charts/donut/), [`funnel`](https://randyzwitch.com/ECharts.jl/charts/funnel/), [`waterfall`](https://randyzwitch.com/ECharts.jl/charts/waterfall/), [`radialbar`](https://randyzwitch.com/ECharts.jl/charts/radialbar/), [`nightingale`](https://randyzwitch.com/ECharts.jl/charts/nightingale/) |
| Hierarchical / Network | [`treemap`](https://randyzwitch.com/ECharts.jl/charts/treemap/), [`sunburst`](https://randyzwitch.com/ECharts.jl/charts/sunburst/), [`tree`](https://randyzwitch.com/ECharts.jl/charts/tree/), [`sankey`](https://randyzwitch.com/ECharts.jl/charts/sankey/), [`graph`](https://randyzwitch.com/ECharts.jl/charts/graph/), [`arc_diagram`](https://randyzwitch.com/ECharts.jl/charts/arc_diagram/) |
| Specialized | [`candlestick`](https://randyzwitch.com/ECharts.jl/charts/candlestick/), [`gauge`](https://randyzwitch.com/ECharts.jl/charts/gauge/), [`radar`](https://randyzwitch.com/ECharts.jl/charts/radar/), [`polar`](https://randyzwitch.com/ECharts.jl/charts/polar/), [`parallel`](https://randyzwitch.com/ECharts.jl/charts/parallel/), [`heatmap`](https://randyzwitch.com/ECharts.jl/charts/heatmap/), [`calendar_heatmap`](https://randyzwitch.com/ECharts.jl/charts/calendar_heatmap/), [`punchcard`](https://randyzwitch.com/ECharts.jl/charts/punchcard/), [`gantt`](https://randyzwitch.com/ECharts.jl/charts/gantt/), [`bullet`](https://randyzwitch.com/ECharts.jl/charts/bullet/), [`span_chart`](https://randyzwitch.com/ECharts.jl/charts/span_chart/), [`population_pyramid`](https://randyzwitch.com/ECharts.jl/charts/population_pyramid/), [`xy_plot`](https://randyzwitch.com/ECharts.jl/charts/xy_plot/) |

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

## Mutating Functions

Chart appearance and behavior can be modified after creation:

- **Axes:** `xaxis!`, `yaxis!`, `xline!`, `yline!`, `xarea!`, `yarea!`, `xgridlines!`, `ygridlines!`
- **Style:** `colorscheme!`, `theme!`, `smooth!`, `flip!`, `jitter!`
- **Layout:** `legend!`, `title!`, `toolbox!`, `tooltip!`, `slider!`
- **Data:** `seriesnames!`, `aria!`

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

## Tables.jl Support

Most chart functions accept any [Tables.jl](https://github.com/JuliaData/Tables.jl)-compatible table alongside column symbols, making it easy to plot tabular data without pre-processing. This includes `DataFrame`, `CSV.File`, `TypedTables.Table`, a `NamedTuple` of vectors, and more:

```julia
bar(df, :category, :value)
bar(df, :category, :value, :group)  # grouped/stacked by a third column
```
