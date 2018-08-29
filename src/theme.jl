abstract type AbstractEChartType end
abstract type AbstractEChartSeries <: AbstractEChartType end

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

function Theme(x::Dict)

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
const chalk = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/chalk.json")))
const dark = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/dark.json")))
const essos = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/essos.json")))
const halloween = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/halloween.json")))
const infographic = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/infographic.json")))
const macarons = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/macarons.json")))
const purplepassion = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/purple-passion.json")))
const roma = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/roma.json")))
const shine = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/shine.json")))
const vintage = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/vintage.json")))
const walden = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/walden.json")))
const westeros = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/westeros.json")))
const wonderland = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/wonderland.json")))

#custom themes
#grayscale based on 6-color Colorbrewer sequential single-hue
const grayscale = Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/grayscale.json")))
