abstract type AbstractEChartType end
abstract type AbstractEChartSeries <: AbstractEChartType end

"""
    Theme

ECharts visual theme applied to a chart.  All fields mirror the top-level keys of an
ECharts JSON theme file.  Pre-built themes exported by ECharts.jl:
`chalk`, `dark`, `essos`, `halloween`, `infographic`, `macarons`, `purplepassion`, `roma`,
`shine`, `vintage`, `walden`, `westeros`, `wonderland`, `grayscale`.

Pass a theme to any chart constructor via the `theme` keyword, or change it afterwards by
setting `ec.theme = mytheme`.

See also [`theme!`](@ref).
"""
@with_kw mutable struct Theme <: AbstractEChartType
    color::Union{AbstractVector, Nothing} = nothing
    backgroundColor::Union{String, Nothing} = nothing
    textStyle::Union{Dict, Nothing} = nothing
    title::Union{Dict, Nothing} = nothing
    line::Union{Dict, Nothing} = nothing
    radar::Union{Dict, Nothing} = nothing
    bar::Union{Dict, Nothing} = nothing
    pie::Union{Dict, Nothing} = nothing
    scatter::Union{Dict, Nothing} = nothing
    boxplot::Union{Dict, Nothing} = nothing
    parallel::Union{Dict, Nothing} = nothing
    sankey::Union{Dict, Nothing} = nothing
    funnel::Union{Dict, Nothing} = nothing
    gauge::Union{Dict, Nothing} = nothing
    candlestick::Union{Dict, Nothing} = nothing
    graph::Union{Dict, Nothing} = nothing
    map::Union{Dict, Nothing} = nothing
    geo::Union{Dict, Nothing} = nothing
    categoryAxis::Union{Dict, Nothing} = nothing
    valueAxis::Union{Dict, Nothing} = nothing
    logAxis::Union{Dict, Nothing} = nothing
    timeAxis::Union{Dict, Nothing} = nothing
    toolbox::Union{Dict, Nothing} = nothing
    legend::Union{Dict, Nothing} = nothing
    tooltip::Union{Dict, Nothing} = nothing
    timeline::Union{Dict, Nothing} = nothing
    visualMap::Union{Dict, Nothing} = nothing
    dataZoom::Union{Dict, Nothing} = nothing
    markPoint::Union{Dict, Nothing} = nothing
end

"""
    Theme(x)

Constructs a `Theme` from a `Dict`, as produced by parsing an ECharts JSON theme file.
Keys not present in the dict default to `nothing`.
"""
function Theme(x::AbstractDict)

    Theme(
    color = get(x, "color", nothing),
    backgroundColor = get(x, "backgroundColor", nothing),
    textStyle = get(x, "textStyle", nothing),
    title = get(x, "title", nothing),
    line = get(x, "line", nothing),
    radar = get(x, "radar", nothing),
    bar = get(x, "bar", nothing),
    pie = get(x, "pie", nothing),
    scatter = get(x, "scatter", nothing),
    boxplot = get(x, "boxplot", nothing),
    parallel = get(x, "parallel", nothing),
    sankey = get(x, "sankey", nothing),
    funnel = get(x, "funnel", nothing),
    gauge = get(x, "gauge", nothing),
    candlestick = get(x, "candlestick", nothing),
    graph = get(x, "graph", nothing),
    map = get(x, "map", nothing),
    geo = get(x, "geo", nothing),
    categoryAxis = get(x, "categoryAxis", nothing),
    valueAxis = get(x, "valueAxis", nothing),
    logAxis = get(x, "logAxis", nothing),
    timeAxis = get(x, "timeAxis", nothing),
    toolbox = get(x, "toolbox", nothing),
    legend = get(x, "legend", nothing),
    tooltip = get(x, "tooltip", nothing),
    timeline = get(x, "timeline", nothing),
    visualMap = get(x, "visualMap", nothing),
    dataZoom = get(x, "dataZoom", nothing),
    markPoint = get(x, "markPoint", nothing)
    )

end

#themes from http://echarts.baidu.com/theme-builder/
const chalk = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/chalk.json")))
const dark = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/dark.json")))
const essos = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/essos.json")))
const halloween = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/halloween.json")))
const infographic = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/infographic.json")))
const macarons = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/macarons.json")))
const purplepassion = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/purple-passion.json")))
const roma = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/roma.json")))
const shine = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/shine.json")))
const vintage = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/vintage.json")))
const walden = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/walden.json")))
const westeros = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/westeros.json")))
const wonderland = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/wonderland.json")))

#custom themes
#grayscale based on 6-color Colorbrewer sequential single-hue
const grayscale = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "themes/grayscale.json")))
