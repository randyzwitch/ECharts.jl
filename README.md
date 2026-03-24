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
| Basic | `bar`, `line`, `area`, `scatter`, `bubble` |
| Statistical | `histogram`, `box`, `corrplot`, `streamgraph` |
| Part-of-whole | `pie`, `donut`, `funnel`, `waterfall`, `radialbar` |
| Specialized | `candlestick`, `gauge`, `radar`, `polar`, `sankey` |

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
| Julia REPL | Opens in a [Blink.jl](https://github.com/JunoLab/Blink.jl) browser window |

No configuration required — displaying a chart is as simple as evaluating an `EChart` value in any of these environments.

## DataFrame Support

Most chart functions accept a `DataFrame` directly alongside column symbols, making it easy to plot tabular data without pre-processing:

```julia
bar(df, :category, :value)
bar(df, :category, :value, :group)  # grouped/stacked by a third column
```
