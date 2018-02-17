abstract type AbstractEChartType end
abstract type AbstractEChartSeries <: AbstractEChartType end

@with_kw mutable struct Theme <: AbstractEChartType
    color::Union{AbstractVector, Void} = nothing
    backgroundColor::Union{String, Void} = nothing
    textStyle::Union{Dict, Void} = nothing
    title::Union{Dict, Void} = nothing
    line::Union{Dict, Void} = nothing
    radar::Union{Dict, Void} = nothing
    bar::Union{Dict, Void} = nothing
    pie::Union{Dict, Void} = nothing
    scatter::Union{Dict, Void} = nothing
    boxplot::Union{Dict, Void} = nothing
    parallel::Union{Dict, Void} = nothing
    sankey::Union{Dict, Void} = nothing
    funnel::Union{Dict, Void} = nothing
    gauge::Union{Dict, Void} = nothing
    candlestick::Union{Dict, Void} = nothing
    graph::Union{Dict, Void} = nothing
    map::Union{Dict, Void} = nothing
    geo::Union{Dict, Void} = nothing
    categoryAxis::Union{Dict, Void} = nothing
    valueAxis::Union{Dict, Void} = nothing
    logAxis::Union{Dict, Void} = nothing
    timeAxis::Union{Dict, Void} = nothing
    toolbox::Union{Dict, Void} = nothing
    legend::Union{Dict, Void} = nothing
    tooltip::Union{Dict, Void} = nothing
    timeline::Union{Dict, Void} = nothing
    visualMap::Union{Dict, Void} = nothing
    dataZoom::Union{Dict, Void} = nothing
    markPoint::Union{Dict, Void} = nothing
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
