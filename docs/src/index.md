# ECharts.jl

The [ECharts.jl](https://github.com/randyzwitch/ECharts.jl) package provides a Julia wrapper around the
[Apache ECharts JavaScript library](https://echarts.apache.org/).

ECharts.jl provides:

- High-level functions for quickly creating visualizations such as bar charts, area charts, line charts, and others
- Support for ColorBrewer color scales via [ColorBrewer.jl](https://github.com/timothyrenner/ColorBrewer.jl) and other colors via [NoveltyColors.jl](https://github.com/randyzwitch/NoveltyColors.jl)
- Inline output via [IJulia (Jupyter Notebook)](https://github.com/JuliaLang/IJulia.jl) and VSCode, and REPL support via [Blink.jl](https://github.com/JunoLab/Blink.jl)

## Motivation

The idea behind the ECharts.jl API is _simplicity_. While it is possible to build complex graphics, the goal
is to provide common visualizations with a minimum of configuration:

- A minimum of required arguments (usually, only data is required), with sensible defaults per chart type
- Legends shown only when two or more series are plotted; tooltip-on-hover enabled automatically
- Integrated [`missing`](https://github.com/JuliaData/Missings.jl) value support
- Tight integration with the ECharts JavaScript library, providing rich interactivity (sliders, hover, toolbox, themes)

## Workflow

1. Choose a base chart type
2. (Optional) Apply one or more [modifier functions](@ref "Modifier Functions") (functions ending with `!`) to adjust the chart
3. (Optional) Set individual fields on the resulting `EChart` struct for fine-grained control

### Example

```@example
using ECharts

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]

# Step 1: choose a base chart type
ar = area(x, y, color = lineargradient("purple", "cyan"))

# Step 2: apply modifier functions
smooth!(ar)
xaxis!(ar, name = "Day of Week")
yaxis!(ar, name = "Daily High Temperature °C")
ar
```
