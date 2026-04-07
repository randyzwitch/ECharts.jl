mutable struct BoxPlotStats
    summary::AbstractVector
    outliers::AbstractVector
end
"""
    LineStyle

ECharts line style configuration (color, width, dash type, opacity, etc.).
Set fields directly on a chart's nested struct or pass as a keyword argument where supported.
"""
@with_kw mutable struct LineStyle <: AbstractEChartType
    color::Union{AbstractVector,String, Nothing} = nothing
    width::Union{Int, Nothing} = nothing
    _type::Union{String, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = nothing
    shadowOffsetY::Union{Int, Nothing} = nothing
    opacity::Union{Int, Nothing} = nothing
    curveness::Union{AbstractFloat, Nothing} = nothing
end
"""
    AreaStyle

ECharts area fill style configuration (color, shadow, opacity, etc.).
"""
@with_kw mutable struct AreaStyle <: AbstractEChartType
    color::Union{AbstractVector, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = 0
    shadowOffsetY::Union{Int, Nothing} = 0
    opacity::Union{Number, Nothing} = nothing
end
"""
    TextStyle

ECharts text style configuration (font family, size, weight, color, etc.).
"""
@with_kw mutable struct TextStyle <: AbstractEChartType
    color::Union{String, Nothing} = "#000"
    fontStyle::Union{String, Nothing} = "normal"
    fontWeight::Union{String, Nothing} = "normal"
    fontFamily::Union{String, Nothing} = "sans-serif"
    fontSize::Union{Int, Nothing} = 12
    align::Union{String, Nothing} = nothing
    verticalAlign::Union{String, Nothing} = nothing
    lineHeight::Union{Int, Nothing} = nothing
    width::Union{Int, String, Nothing} = nothing
    height::Union{Int, String, Nothing} = nothing
    textBorderColor::Union{String, Nothing} = nothing
    textBorderWidth::Union{Int, Nothing} = nothing
    textShadowColor::Union{String, Nothing} = nothing
    textShadowBlur::Union{Int, Nothing} = nothing
    textShadowOffsetX::Union{Int, Nothing} = nothing
    textShadowOffsetY::Union{Int, Nothing} = nothing
    rich::Union{Dict, Nothing} = nothing
end
"""
    SplitArea

ECharts split area configuration (alternating background bands between axis ticks).
"""
@with_kw mutable struct SplitArea <: AbstractEChartType
    interval::Union{Int,String, Nothing} = "auto"
    show::Union{Bool, Nothing} = true
    areaStyle::Union{AreaStyle, Nothing} = nothing
end
"""
    SplitLine

ECharts split line configuration (grid lines drawn at axis ticks).
"""
@with_kw mutable struct SplitLine <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    interval::Union{Int,String,JSON.JSONText, Nothing} = "auto"
    lineStyle::Union{LineStyle, Nothing} = LineStyle()
end
"""
    AxisLabel

ECharts axis tick label configuration (show, rotation, format, font, etc.).
"""
@with_kw mutable struct AxisLabel <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    interval::Union{Int,String, Nothing} = "auto"
    inside::Union{Bool, Nothing} = false
    rotate::Union{Int, Nothing} = 0
    margin::Union{Int, Nothing} = 8
    formatter::Union{String, Nothing, JSON.JSONText} = "{value}"
    showMinLabel::Union{Bool, Nothing} = nothing
    showMaxLabel::Union{Bool, Nothing} = nothing
    color::Union{String, Dict, Nothing} = nothing
    fontStyle::Union{String, Nothing} = nothing
    fontWeight::Union{String, Nothing} = nothing
    fontFamily::Union{String, Nothing} = nothing
    fontSize::Union{Int, Nothing} = nothing
    align::Union{String, Nothing} = nothing
    verticalAlign::Union{String, Nothing} = nothing
    lineHeight::Union{Int, Nothing} = nothing
    backgroundColor::Union{String, Nothing} = nothing
    borderColor::Union{String, Nothing} = nothing
    borderWidth::Union{Int, Nothing} = nothing
    borderRadius::Union{Int, Nothing} = nothing
    padding::Union{AbstractVector,Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = nothing
    shadowOffsetY::Union{Int, Nothing} = nothing
    width::Union{Int, Nothing} = nothing
    height::Union{Int, Nothing} = nothing
    textBorderColor::Union{String, Nothing} = nothing
    textBorderWidth::Union{Int, Nothing} = nothing
    textShadowColor::Union{String, Nothing} = nothing
    textShadowBlur::Union{Int, Nothing} = nothing
    textShadowOffsetX::Union{Int, Nothing} = nothing
    textShadowOffsetY::Union{Int, Nothing} = nothing
    rich::Union{Dict, Nothing} = nothing
end
"""
    AxisLine

ECharts axis line configuration (visibility, arrow symbols, line style, etc.).
"""
@with_kw mutable struct AxisLine <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    onZero::Union{Bool, Nothing} = true
    onZeroAxisIndex::Union{Int, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{AbstractVector, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = LineStyle()
end
"""
    AxisTick

ECharts axis tick mark configuration (visibility, alignment, length, line style, etc.).
"""
@with_kw mutable struct AxisTick <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    alignWithLabel::Union{Bool, Nothing} = nothing
    interval::Union{Int,String, Nothing} = "auto"
    inside::Union{Bool, Nothing} = false
    length::Union{Int, Nothing} = 5
    lineStyle::Union{LineStyle, Nothing} = LineStyle()
end
@with_kw mutable struct Label <: AbstractEChartType
    show::Union{Bool, Nothing} = nothing
    position::Union{String, Nothing} = nothing
    offset::Union{AbstractVector, Nothing} = nothing
    formatter::Union{String, JSON.JSONText, Nothing} = nothing
    color::Union{String, Nothing} = nothing
    rotate::Union{Number, Nothing} = nothing
    fontSize::Union{Int, Nothing} = nothing
    fontWeight::Union{String, Nothing} = nothing
    textStyle::Union{TextStyle, Nothing} = nothing
end
"""
    ItemStyle

ECharts item (data point) style configuration (color, border, shadow, opacity, etc.).
"""
@with_kw mutable struct ItemStyle <: AbstractEChartType
    color::Union{String, Dict, Nothing} = nothing
    borderColor::Union{String, Nothing} = nothing
    borderWidth::Union{Int, Nothing} = nothing
    borderRadius::Union{Int, AbstractVector, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = nothing
    shadowOffsetY::Union{Int, Nothing} = nothing
    opacity::Union{Float64, Nothing} = nothing
    gapWidth::Union{Int, Nothing} = nothing
    borderColorSaturation::Union{Number, Nothing} = nothing
end
@with_kw mutable struct IconStyleOpts <: AbstractEChartType
    color::Union{String, Nothing} = "adaptive"
    borderColor::Union{String, Nothing} = "#666"
    borderWidth::Union{Int, Nothing} = 1
    borderType::Union{Int, Nothing} = 1
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = 0
    shadowOffsetY::Union{Int, Nothing} = 0
    opacity::Union{Int, Nothing} = nothing
end
@with_kw mutable struct IconStyle <: AbstractEChartType
    normal::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
end
@with_kw mutable struct CrossStyle <: AbstractEChartType
    color::Union{String, Nothing} = "#555"
    width::Union{Int, Nothing} = 1
    _type::Union{String, Nothing} = "dashed"
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = 0
    shadowOffsetY::Union{Int, Nothing} = 0
    opacity::Union{Number, Nothing} = 0
    textStyle::Union{TextStyle, Nothing} = nothing
end
@with_kw mutable struct ShadowStyle <: AbstractEChartType
    color::Union{String, Nothing} = "rgba(150,150,150,0.5)"
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = 0
    shadowOffsetY::Union{Int, Nothing} = 0
    opacity::Union{Number, Nothing} = 0
end
@with_kw mutable struct AxisPointerLabel <: AbstractEChartType
    show::Union{Bool, Nothing} = false
    precision::Union{String, Number, Nothing} = "auto"
    formatter::Union{String, JSON.JSONText, Nothing} = nothing
    margin::Union{Bool, Number, Nothing} = nothing
    textStyle::Union{TextStyle, Nothing} = nothing
    padding::Union{String, AbstractVector, Nothing} = 5
    backgroundColor::Union{String, Nothing} = nothing
    borderColor::Union{String, Nothing} = nothing
    borderWidth::Union{String, Number, Nothing} = nothing
    shadowBlur::Union{Number, Nothing} = nothing
    shadowColor::Union{String, JSON.JSONText, Nothing} = nothing
    shadowOffsetX::Union{Number, Nothing} = nothing
    shadowOffsetY::Union{Number, Nothing} = nothing
end
@with_kw mutable struct AxisPointer <: AbstractEChartType
    show::Union{Bool, Nothing} = false
    _type::Union{String, Nothing} = "line"
    snap::Union{Bool, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    label::Union{AxisPointerLabel, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    shadowStyle::Union{ShadowStyle, Nothing} = nothing
    triggerTooltip::Union{String, Nothing} = nothing
    value::Union{Number, Nothing} = nothing
    status::Union{Bool, Nothing} = nothing
    handle::Any = nothing #for mobile device, do later
    link::Union{AbstractVector, Any} = nothing
    triggerOn::Union{String, Nothing} = nothing
end
"""
    Tooltip

ECharts tooltip configuration (trigger mode, formatter, styling, etc.).
See also [`tooltip!`](@ref).
"""
@with_kw mutable struct Tooltip <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    trigger::Union{String, Nothing} = "item"
    axisPointer::Union{AxisPointer, Nothing} = nothing
    showContent::Union{Bool, Nothing} = true
    alwaysShowContent::Union{Bool, Nothing} = false
    triggerOn::Union{String, Nothing} = "mousemove"
    showDelay::Union{Int, Nothing} = 0
    hideDelay::Union{Int, Nothing} = 100
    enterable::Union{Bool, Nothing} = true
    confine::Union{Bool, Nothing} = false
    transitionDuration::Union{Number, Nothing} = 0.4
    position::Union{AbstractVector,String, Nothing} = nothing
    formatter::Union{String, Nothing, JSON.JSONText} = nothing
    backgroundColor::Union{String, Nothing, JSON.JSONText} = "rgba(50,50,50,0.9)"
    borderColor::Union{String, Nothing} = "#333"
    borderWidth::Union{Int, Nothing} = 0
    padding::Union{Int, Nothing} = 5
    textStyle::Union{TextStyle, Nothing} = TextStyle(color = "#fff", fontStyle = nothing, fontWeight = nothing, fontFamily = nothing, fontSize = nothing)
    extraCssText::Union{String, Nothing} = nothing
    valueFormatter::Union{String, JSON.JSONText, Nothing} = nothing
    order::Union{String, Nothing} = nothing
    width::Union{Int, String, Nothing} = nothing
end
"""
    Legend

ECharts legend configuration (visibility, position, item styling, etc.).
See also [`legend!`](@ref).
"""
@with_kw mutable struct Legend <: AbstractEChartType
    _type::Union{String, Nothing} = nothing
    show::Union{Bool, Nothing} = true
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    left::Union{Int,String, Nothing} = nothing
    top::Union{Int,String, Nothing} = nothing
    right::Union{Int,String, Nothing} = "auto"
    bottom::Union{Int,String, Nothing} = 0
    width::Union{Int,String, Nothing} = "auto"
    height::Union{Int,String, Nothing} = "auto"
    orient::Union{String, Nothing} = "horizontal"
    align::Union{String, Nothing} = "auto"
    padding::Union{Int, Nothing} = 5
    itemGap::Union{Int, Nothing} = 10
    itemWidth::Union{Int, Nothing} = 25
    itemHeight::Union{Int, Nothing} = 14
    formatter::Union{String, Nothing, JSON.JSONText} = nothing
    selectedMode::Union{Bool,String, Nothing} = true
    inactiveColor::Union{String, Nothing} = "#ccc"
    selected::Union{Dict{String,Bool}, Nothing} = nothing
    textStyle::Union{TextStyle, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    backgroundColor::Union{String, Nothing} = "transparent"
    borderColor::Union{String, Nothing} = "transparent"
    borderWidth::Union{Int, Nothing} = 1
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = 0
    shadowOffsetY::Union{Int, Nothing} = 0
    scrollDataIndex::Union{Int, Nothing} = nothing
    pageButtonItemGap::Union{Int, Nothing} = nothing
    pageButtonPosition::Union{Int, Nothing} = nothing
    pageFormatter::Union{String,JSON.JSONText, Nothing} = nothing
    pageIcons::Union{Dict, Nothing} = nothing
    pageIconColor::Union{String, Nothing} = nothing
    pageIconInactiveColor::Union{String, Nothing} = nothing
    pageIconSize::Union{Int, Nothing} = nothing
    pageTextStyle::Union{TextStyle, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
end
"""
    Toolbox

ECharts toolbox (interactive toolbar) configuration, including save-as-image,
data view, zoom, and restore buttons.
See also [`toolbox!`](@ref).
"""
@with_kw mutable struct Toolbox <: AbstractEChartType
    show::Union{Bool, Nothing} = false
    orient::Union{String, Nothing} = "vertical"
    itemSize::Union{Number, Nothing} = 15
    itemGap::Union{Number, Nothing} = 20
    showTitle::Union{Bool, Nothing} = true
    feature::Union{Dict{Any,Any}, Nothing} = Dict{Any,Any}()
    iconStyle::Union{IconStyle, Nothing} = nothing
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    left::Union{Number,String, Nothing} = nothing
    top::Union{Number,String, Nothing} = "center"
    right::Union{Number,String, Nothing} = "auto"
    bottom::Union{Number,String, Nothing} = nothing
    width::Union{Number,String, Nothing} = "auto"
    height::Union{Number,String, Nothing} = "auto"
end
@with_kw mutable struct Brush <: AbstractEChartType
    toolbox::Union{AbstractArray, Nothing} = nothing
    brushLink::Union{AbstractArray, String, Nothing} = nothing
    seriesIndex::Union{AbstractArray, Number, String, Nothing} = nothing
    geoIndex::Union{AbstractArray, Number, String, Nothing} = nothing
    xAxisIndex::Union{AbstractArray, Number, String, Nothing} = nothing
    yAxisIndex::Union{AbstractArray, Number, String, Nothing} = nothing
    brushType::Union{String, Nothing} = nothing
    brushMode::Union{String, Nothing} = nothing
    transformable::Union{Bool, Nothing} = nothing
    brushStyle::Union{Dict, Nothing} = nothing
    throttleType::Union{String, Nothing} = nothing
    throttleDelay::Union{Number, Nothing} = nothing
    removeOnClick::Union{Bool, Nothing} = nothing
    inBrush::Union{Dict, Nothing} = nothing
    outOfBrush::Union{Dict, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
end
"""
    Axis

ECharts axis configuration (type, name, tick/label/line styling, scale, etc.).
Used for both x- and y-axes via `EChart.xAxis` and `EChart.yAxis`.
See also [`xaxis!`](@ref), [`yaxis!`](@ref).
"""
@with_kw mutable struct Axis <: AbstractEChartType
    show::Union{Bool, Nothing} = nothing
    gridIndex::Union{Int, Nothing} = 0
    position::Union{String, Nothing} = nothing
    offset::Union{Int, Nothing} = nothing
    _type::Union{String, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    nameLocation::Union{String, Nothing} = "middle"
    nameTextStyle::Union{TextStyle, Nothing} = nothing
    nameGap::Union{Int, Nothing} = 30
    nameRotate::Union{Int, Nothing} = nothing
    inverse::Union{Bool, Nothing} = false
    boundaryGap::Union{AbstractVector,Bool, Nothing} = nothing
    min::Union{Int,String, Nothing} = nothing
    max::Union{Int,String, Nothing} = nothing
    scale::Union{Bool, Nothing} = false
    splitNumber::Union{Int, Nothing} = 5
    minInterval::Union{Int, Nothing} = 0
    interval::Union{Int, Nothing} = nothing
    logBase::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = true
    triggerEvent::Union{Bool, Nothing} = false
    axisLine::Union{AxisLine, Nothing} = nothing
    axisTick::Union{AxisTick, Nothing} = nothing
    axisLabel::Union{AxisLabel, Nothing} = AxisLabel()
    splitLine::Union{SplitLine, Nothing} = nothing
    splitArea::Union{SplitArea, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    axisPointer::Union{AxisPointer, Nothing} = nothing
    jitter::Union{Number, Nothing} = nothing
    jitterOverlap::Union{Number, Nothing} = nothing
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 0
end
"""
    Title

ECharts chart title configuration (main text, subtitle, position, styling, etc.).
See also [`title!`](@ref).
"""
@with_kw mutable struct Title <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    text::Union{String, Nothing} = nothing
    link::Union{String, Nothing} = nothing
    target::Union{String, Nothing} = "blank"
    textStyle::Union{TextStyle, Nothing} = nothing
    subtext::Union{String, Nothing} = nothing
    sublink::Union{String, Nothing} = nothing
    subtarget::Union{String, Nothing} = "blank"
    subtextStyle::Union{TextStyle, Nothing} = nothing
    padding::Union{Array{Int,1},Int, Nothing} = 5
    itemGap::Union{Int, Nothing} = 5
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    left::Union{Int,String, Nothing} = "left"
    top::Union{Int,String, Nothing} = "auto"
    right::Union{Int,String, Nothing} = "auto"
    bottom::Union{Int,String, Nothing} = "auto"
    backgroundColor::Union{String, Nothing, JSON.JSONText} = nothing
    borderColor::Union{String, Nothing} = "transparent"
    borderWidth::Union{Int, Nothing} = 1
    borderRadius::Union{Int, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = 0
    shadowOffsetY::Union{Int, Nothing} = 0
end
"""
    Grid

ECharts grid (plot area) configuration (position, size, background, border, etc.).
"""
@with_kw mutable struct Grid <: AbstractEChartType
    show::Bool = false
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{Int,String, Nothing} = nothing
    top::Union{Int,String, Nothing} = nothing
    right::Union{Int,String, Nothing} = nothing
    bottom::Union{Int,String, Nothing} = nothing
    width::Union{Int,String, Nothing} = "auto"
    height::Union{Int,String, Nothing} = "auto"
    containLabel::Union{Bool, Nothing} = nothing
    backgroundColor::Union{String, Nothing,JSON.JSONText} = "transparent"
    borderColor::Union{String, Nothing} = nothing
    borderWidth::Union{Int, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = nothing
    shadowOffsetY::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    DataZoom

ECharts data zoom configuration for interactive axis range selection (slider or inside/scroll).
See also [`datazoom!`](@ref).
"""
@with_kw mutable struct DataZoom <: AbstractEChartType
    _type::Union{String, Nothing} = nothing
    show::Union{Bool, Nothing} = nothing
    start::Union{Number, Nothing} = nothing
    _end::Union{Number, Nothing} = nothing
    xAxisIndex::Union{Int, AbstractVector, Nothing} = nothing
    yAxisIndex::Union{Int, AbstractVector, Nothing} = nothing
    orient::Union{String, Nothing} = nothing
    filterMode::Union{String, Nothing} = nothing
    zoomLock::Union{Bool, Nothing} = nothing
    throttle::Union{Int, Nothing} = nothing
    left::Union{Int,String, Nothing} = nothing
    top::Union{Int,String, Nothing} = nothing
    right::Union{Int,String, Nothing} = nothing
    bottom::Union{Int,String, Nothing} = nothing
end
"""
    Timeline

ECharts timeline component configuration for animated, stepped chart sequences.
"""
@with_kw mutable struct Timeline <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    _type::Union{String, Nothing} = "slider"
    axisType::Union{String, Nothing} = "time"
    currentIndex::Union{Int, Nothing} = 0
    autoPlay::Union{Bool, Nothing} = false
    rewind::Union{Bool, Nothing} = false
    loop::Union{Bool, Nothing} = true
    playInterval::Union{Int, Nothing} = 2000
    realtime::Union{Bool, Nothing} = true
    controlPosition::Union{String, Nothing} = "left"
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    left::Union{Int,String, Nothing} = "auto"
    top::Union{Int,String, Nothing} = "auto"
    right::Union{Int,String, Nothing} = "auto"
    bottom::Union{Int,String, Nothing} = "auto"
    padding::Union{Array{Int,1},Int, Nothing} = 5
    orient::Union{String, Nothing} = "horizontal"
    inverse::Union{Bool, Nothing} = false
    symbol::Union{String, Nothing} = "emptyCircle"
    symbolSize::Union{Array{Int,1},Int,JSON.JSONText, Nothing} = 10
    symbolRotate::Union{Int, Nothing} = nothing
    symbolOffset::Union{Array{Int,1}, Nothing} = [0,0]
    lineStyle::Union{LineStyle, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    checkpointStyle::Union{Dict, Nothing} = nothing
    controlStyle::Union{Dict, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
end
@with_kw mutable struct Polar <: AbstractEChartType
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    center::Union{Array{String,1}, Nothing} = String["50%","50%"]
    radius::Union{AbstractVector, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
@with_kw mutable struct RadiusAxis <: AbstractEChartType
    polarIndex::Union{Int, Nothing} = 0
    _type::Union{String, Nothing} = "value"
    name::Union{String, Nothing} = nothing
    nameLocation::Union{String, Nothing} = "start"
    nameTextStyle::Union{TextStyle, Nothing} = nothing
    nameGap::Union{Int, Nothing} = 15
    nameRotate::Union{Int, Nothing} = nothing
    inverse::Union{Bool, Nothing} = false
    boundaryGap::Union{Array{String,1},Bool, Nothing} = nothing
    min::Union{Int,String, Nothing} = nothing
    max::Union{Int,String, Nothing} = nothing
    scale::Union{Bool, Nothing} = false
    splitNumber::Union{Int, Nothing} = 5
    minInterval::Union{Int, Nothing} = 0
    maxInterval::Union{Int, Nothing} = nothing
    interval::Union{Int, Nothing} = nothing
    logBase::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = true
    triggerEvent::Union{Bool, Nothing} = false
    axisLine::Union{AxisLine, Nothing} = nothing
    axisTick::Union{AxisTick, Nothing} = nothing
    axisLabel::Union{AxisLabel, Nothing} = nothing
    splitLine::Union{SplitLine, Nothing} = nothing
    splitArea::Union{SplitArea, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    axisPointer::Union{AxisPointer, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
end
@with_kw mutable struct AngleAxis <: AbstractEChartType
    polarIndex::Union{Int, Nothing} = 0
    startAngle::Union{Int, Nothing} = nothing
    clockwise::Union{Bool, Nothing} = true
    _type::Union{String, Nothing} = nothing
    boundaryGap::Union{AbstractVector,Bool, Nothing} = nothing
    min::Union{Int,String, Nothing} = nothing
    max::Union{Int,String, Nothing} = nothing
    scale::Union{Bool, Nothing} = false
    splitNumber::Union{Int, Nothing} = nothing
    minInterval::Union{Int, Nothing} = 0
    maxInterval::Union{Int, Nothing} = nothing
    interval::Union{Int, Nothing} = nothing
    logBase::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = true
    triggerEvent::Union{Bool, Nothing} = nothing
    axisLine::Union{AxisLine, Nothing} = nothing
    axisTick::Union{AxisTick, Nothing} = nothing
    axisLabel::Union{AxisLabel, Nothing} = nothing
    splitLine::Union{SplitLine, Nothing} = nothing
    splitArea::Union{SplitArea, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    axisPointer::Union{AxisPointer, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
end
@with_kw mutable struct Radar <: AbstractEChartType
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    center::Union{Array{String,1}, Nothing} = String["50%","50%"]
    radius::Union{Int,String, Nothing} = "75%"
    startAngle::Union{Int, Nothing} = 90
    axisName::Union{Dict{Any,Any}, Nothing} = nothing
    axisNameGap::Union{Int, Nothing} = 15
    splitNumber::Union{Int, Nothing} = nothing
    shape::Union{String, Nothing} = nothing
    scale::Union{Bool, Nothing} = nothing
    silent::Union{Bool, Nothing} = true
    triggerEvent::Union{Bool, Nothing} = nothing
    axisLine::Union{AxisLine, Nothing} = nothing
    axisTick::Union{AxisTick, Nothing} = nothing
    axisLabel::Union{AxisLabel, Nothing} = nothing
    splitLine::Union{SplitLine, Nothing} = nothing
    splitArea::Union{SplitArea, Nothing} = nothing
    indicator::Union{AbstractVector, Nothing} = nothing
end
"""
    VisualMap

ECharts visual map component configuration for mapping data values to visual encodings
(color, size, etc.) via a continuous or piecewise legend.
"""
@with_kw mutable struct VisualMap <: AbstractEChartType
    #continuous
    _type::Union{String, Nothing} = nothing
    min::Union{Real, Nothing} = nothing
    max::Union{Real, Nothing} = nothing
    range::Union{AbstractVector, Nothing} = nothing
    calculable::Union{Bool, Nothing} = nothing
    realtime::Union{Bool, Nothing} = nothing
    inverse::Union{Bool, Nothing} = nothing
    precision::Union{Int, Nothing} = nothing
    itemWidth::Union{Int, Nothing} = nothing
    itemHeight::Union{Int, Nothing} = nothing
    align::Union{String, Nothing} = nothing
    text::Union{AbstractVector, Nothing} = nothing
    textGap::Union{AbstractVector, Int, Nothing} = nothing
    show::Union{Bool, Nothing} = nothing
    dimension::Union{String, Nothing} = nothing
    seriesIndex::Union{AbstractVector, Int, Nothing} = nothing
    hoverLink::Union{Bool, Nothing} = nothing
    inRange::Union{Dict, Nothing} = nothing
    outOfRange::Union{Dict, Nothing} = nothing
    controller::Union{Dict, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Int, Nothing} = nothing
    top::Union{String, Int, Nothing} = nothing
    right::Union{String, Int, Nothing} = nothing
    bottom::Union{String, Int, Nothing} = nothing
    orient::Union{String, Nothing} = nothing
    padding::Union{AbstractVector, Int , Nothing} = nothing
    backgroundColor::Union{String, Nothing} = nothing
    borderColor::Union{String, Nothing} = nothing
    borderWidth::Union{Int, Nothing} = nothing
    color::Union{String, Nothing} = nothing
    textStyle::Union{TextStyle, Nothing} = nothing
    formatter::Union{String, JSON.JSONText, Nothing} = nothing
    #piecewise
    splitNumber::Union{Int, Nothing} = nothing
    pieces::Union{AbstractVector, Nothing} = nothing
    categories::Union{AbstractVector, Nothing} = nothing
    minOpen::Union{Bool, Nothing} = nothing
    maxOpen::Union{Bool, Nothing} = nothing
    selectedMode::Union{String, Nothing} = nothing
    showLabel::Union{Bool, Nothing} = nothing
    itemGap::Union{Int, Nothing} = nothing
    itemSymbol::Union{String, Nothing} = nothing

end
@with_kw mutable struct ScaleLimit <: AbstractEChartType
    min::Union{Int, Nothing} = nothing
    max::Union{Int, Nothing} = nothing
end
@with_kw mutable struct Geo <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    map::Union{String, Nothing} = nothing
    roam::Union{Bool, Nothing} = false
    center::Union{Array{Number,1}, Nothing} = nothing
    aspectScale::Union{Number, Nothing} = nothing
    boundingCoords::Union{AbstractArray, Nothing} = nothing
    zoom::Union{Int, Nothing} = 1
    scaleLimit::Union{ScaleLimit, Nothing} = nothing
    nameMap::Union{Dict, Nothing} = nothing
    selectedMode::Union{Bool, Nothing} = false
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    left::Union{Int,String, Nothing} = "auto"
    top::Union{Int,String, Nothing} = "auto"
    right::Union{Int,String, Nothing} = "auto"
    bottom::Union{Int,String, Nothing} = "auto"
    layoutCenter::Union{Array{Number,1}, Nothing} = nothing
    layoutSize::Union{Number,String, Nothing} = nothing
    regions::Union{AbstractVector, Nothing} = nothing
    silent::Union{Bool, Nothing} = false
end
@with_kw mutable struct Parallel <: AbstractEChartType
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    left::Union{Int,String, Nothing} = "auto"
    top::Union{Int,String, Nothing} = 60
    right::Union{Int,String, Nothing} = 80
    bottom::Union{Int,String, Nothing} = 60
    width::Union{Int,String, Nothing} = "auto"
    height::Union{Int,String, Nothing} = "auto"
    layout::Union{String, Nothing} = "horizontal"
    axisExpandable::Union{Bool, Nothing} = nothing
    axisExpandCenter::Union{Number, Nothing} = nothing
    axisExpandCount::Union{Number, Nothing} = nothing
    axisExpandWidth::Union{Number, Nothing} = nothing
    axisExpandTriggerOn::Union{String, Nothing} = nothing
    parallelAxisDefault::Union{Dict, Nothing} = nothing
end
@with_kw mutable struct AreaSelectStyle <: AbstractEChartType
    width::Union{Int, Nothing} = 20
    borderWidth::Union{Int, Nothing} = 1
    borderColor::Union{String, Nothing} = "rgba(160,197,232)"
    color::Union{String, Nothing} = "rgba(160,197,232)"
    opacity::Union{Number, Nothing} = 0.3
end
@with_kw mutable struct ParallelAxis <: AbstractEChartType
    dim::Union{Int, Nothing} = nothing
    parallelIndex::Union{Int, Nothing} = 0
    realtime::Union{Bool, Nothing} = nothing
    areaSelectStyle::Union{AreaSelectStyle, Nothing} = nothing
    _type::Union{String, Nothing} = "value"
    name::Union{String, Nothing} = nothing
    nameLocation::Union{String, Nothing} = "start"
    nameTextStyle::Union{TextStyle, Nothing} = TextStyle(color = "#fff")
    nameGap::Union{Int, Nothing} = 15
    nameRotate::Union{Int, Nothing} = nothing
    inverse::Union{Bool, Nothing} = false
    boundaryGap::Union{AbstractVector,Bool, Nothing} = nothing
    min::Union{Int,String, Nothing} = "auto"
    max::Union{Int,String, Nothing} = "auto"
    scale::Union{Bool, Nothing} = false
    splitNumber::Union{Int, Nothing} = 5
    minInterval::Union{Int, Nothing} = 0
    maxInterval::Union{Int, Nothing} = nothing
    interval::Union{Int, Nothing} = nothing
    logBase::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = true
    triggerEvent::Union{Bool, Nothing} = nothing
    axisLine::Union{AxisLine, Nothing} = nothing
    axisTick::Union{AxisTick, Nothing} = nothing
    axisLabel::Union{AxisLabel, Nothing} = nothing
    data::Union{Dict, Nothing} = nothing
end
@with_kw mutable struct SingleAxis <: AbstractEChartType
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Number, Nothing} = nothing
    top::Union{String, Number, Nothing} = nothing
    right::Union{String, Number, Nothing} = nothing
    bottom::Union{String, Number, Nothing} = nothing
    width::Union{String, Number, Nothing} = nothing
    height::Union{String, Number, Nothing} = nothing
    orient::Union{String, Nothing} = nothing
    _type::Union{String, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    nameLocation::Union{String, Nothing} = nothing
    nameTextStyle::Union{TextStyle, Nothing} = nothing
    nameGap::Union{Number, Nothing} = nothing
    nameRotate::Union{Number, Nothing} = nothing
    inverse::Union{Bool, Nothing} = nothing
    boundaryGap::Union{Bool, AbstractVector, Nothing} = nothing
    min::Union{String, Number, Nothing} = nothing
    max::Union{String, Number, Nothing} = nothing
    scale::Union{Bool, Nothing} = nothing
    splitNumber::Union{Number, Nothing} = nothing
    minInterval::Union{Number, Nothing}  = nothing
    maxInterval::Union{Number, Nothing}  = nothing
    interval::Union{Number, Nothing} = nothing
    logBase::Union{Number, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    triggerEvent::Union{Bool, Nothing} = nothing
    axisLine::Union{AxisLine, Nothing} = nothing
    axisTick::Union{AxisTick, Nothing} = nothing
    axisLabel::Union{AxisLabel, Nothing} = nothing
    splitLine::Union{SplitLine, Nothing} = nothing
    splitArea::Union{SplitArea, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    axisPointer::Union{AxisPointer, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
#Needs to be fleshed out, might not be possible due to $action fieldname
@with_kw mutable struct Graphic <: AbstractEChartType
    tbd::Any = nothing
end
@with_kw mutable struct Calendar <: AbstractEChartType
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Number, Nothing} = nothing
    top::Union{String, Number, Nothing} = nothing
    right::Union{String, Number, Nothing} = nothing
    bottom::Union{String, Number, Nothing} = nothing
    width::Union{String, Number, Nothing} = nothing
    height::Union{String, Number, Nothing} = nothing
    range::Union{String, Number, AbstractVector, Nothing} = nothing
    cellSize::Union{Number, AbstractVector, Nothing} = nothing
    orient::Union{String, Nothing} = nothing
    splitLine::Union{SplitLine, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    dayLabel::Union{Dict, Nothing} = nothing
    monthLabel::Union{Dict, Nothing} = nothing
    yearLabel::Union{Dict, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
end
@with_kw mutable struct Dataset <: AbstractEChartType
    id::Union{String, Nothing} = nothing
    source::Union{Dict, Array, Nothing} = nothing
    dimensions::Union{AbstractVector, Nothing} = nothing
    sourceHeader::Union{Bool, Nothing} = nothing
    transform::Union{Dict, AbstractVector, Nothing} = nothing
    fromDatasetIndex::Union{Int, Nothing} = nothing
    fromDatasetId::Union{String, Nothing} = nothing
    fromTransformResult::Union{Int, Nothing} = nothing
end
@with_kw mutable struct Aria <: AbstractEChartType
    enabled::Union{Bool, Nothing} = true
    label::Union{Dict, Nothing} = nothing
    decal::Union{Dict, Nothing} = nothing
end
"""
    MarkPoint

ECharts mark point annotation configuration (symbol, size, label, style, etc.)
for highlighting specific data points on a series.
"""
@with_kw mutable struct MarkPoint <: AbstractEChartType
    _symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, AbstractVector, JSON.JSONText, Nothing} = nothing
    symbolRotate::Union{Int, Nothing} = nothing
    symbolOffset::Union{AbstractVector, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    data::Union{Dict, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
end
"""
    MarkLine

ECharts mark line annotation configuration for drawing reference lines
(e.g. average, min, max) across a series.
"""
@with_kw mutable struct MarkLine <: AbstractEChartType
    silent::Union{Bool, Nothing} = nothing
    _symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, AbstractVector, JSON.JSONText, Nothing} = nothing
    precision::Union{Int, Nothing} = nothing
    label::Union{Dict, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = deepcopy(LineStyle())
    data::Union{Vector, Nothing} = Any[]
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
end
"""
    MarkArea

ECharts mark area annotation configuration for shading rectangular regions of a chart.
"""
@with_kw mutable struct MarkArea <: AbstractEChartType
    silent::Union{Bool, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = Any[]
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
end
#Need to validate for all types
#Make individual series types like echarts.js?
"""
    PieSeries

ECharts series configuration for pie and donut charts.
"""
@with_kw mutable struct PieSeries <: AbstractEChartSeries
    _type::String = "pie"
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    selectedMode::Union{Bool, String, Nothing} = nothing
    selectedOffset::Union{Int, Nothing} = nothing
    clockwise::Union{Bool, Nothing} = nothing
    startAngle::Union{Int, Nothing} = nothing
    minAngle::Union{Int, Nothing} = nothing
    roseType::Union{String, Nothing} = nothing
    avoidLabelOverlap::Union{Bool, Nothing} = nothing
    stillShowZeroSum::Union{Bool, Nothing} = nothing
    padAngle::Union{Number, Nothing} = nothing
    bleedMargin::Union{Number, Nothing} = nothing
    cursor::Union{String, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    labelLine::Union{Dict, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    center::Union{AbstractVector,String, Nothing} = nothing
    radius::Union{AbstractVector,String, Nothing} = nothing
    seriesLayoutBy::Union{String, Nothing} = nothing
    datasetIndex::Union{Int, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animationType::Union{String, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    RadarSeries

ECharts series configuration for radar (spider/web) charts.
"""
@with_kw mutable struct RadarSeries <: AbstractEChartSeries
    _type::String = "radar"
    name::Union{String, Nothing} = nothing
    radarIndex::Union{Int, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, Nothing} = nothing
    symbolRotate::Union{Int, Nothing} = nothing
    symbolOffset::Union{AbstractVector, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    areaStyle::Union{AreaStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing}
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    animationDurationUpdate::Union{Int,JSON.JSONText, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSON.JSONText, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    BoxPlotSeries

ECharts series configuration for box (box-and-whisker) plots.
"""
@with_kw mutable struct BoxPlotSeries <: AbstractEChartSeries
    _type::String = "boxplot"
    coordinateSystem::String = "cartesian2d"
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    layout::Union{String, Nothing} = nothing
    boxWidth::Union{AbstractVector, Nothing} = nothing
    dimensions::Union{AbstractVector, Nothing} = nothing
    encode::Union{Dict, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    ThemeRiverSeries

ECharts series configuration for theme river (streamgraph) charts.
"""
@with_kw mutable struct ThemeRiverSeries <: AbstractEChartSeries
    _type::String = "themeRiver"
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Int, Nothing} = nothing
    top::Union{String, Int, Nothing} = nothing
    right::Union{String, Int, Nothing} = nothing
    bottom::Union{String, Int, Nothing} = nothing
    width::Union{String, Int, Nothing} = nothing
    height::Union{String, Int, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    boundaryGap::Union{AbstractVector, Nothing} = nothing
    singleAxisIndex::Union{Int, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    PictorialBarSeries

ECharts series configuration for pictorial bar charts (bars shaped like custom symbols).
"""
@with_kw mutable struct PictorialBarSeries <: AbstractEChartSeries
    _type::String = "pictorialBar"
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    cursor::Union{String, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    barWidth::Union{Int, String, Nothing} = nothing
    barMaxWidth::Union{Int, String, Nothing} = nothing
    barMinHeight::Union{Int, Nothing} = nothing
    barGap::Union{Int, String, Nothing} = nothing
    barCategoryGap::Union{Int, String, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{AbstractVector, Nothing} = nothing
    symbolPosition::Union{String, Nothing} = nothing
    symbolOffset::Union{AbstractVector, Nothing} = nothing
    symbolRotate::Union{Int, Nothing} = nothing
    symbolRepeat::Union{Bool, Int, String, Nothing} = nothing
    symbolRepeatDirection::Union{String, Nothing} = nothing
    symbolMargin::Union{Int, String, Nothing} = nothing
    symbolClip::Union{Bool, Nothing} = nothing
    symbolBoundingData::Union{Int, AbstractArray, Nothing} = nothing
    symbolPatternSize::Union{Int, Nothing} = nothing
    dimensions::Union{AbstractArray, Nothing} = nothing
    encode::Union{Dict, Nothing} = nothing
    data::Union{AbstractArray, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    GaugeSeries

ECharts series configuration for gauge (dial/speedometer) charts.
"""
@with_kw mutable struct GaugeSeries <: AbstractEChartSeries
    _type::String = "gauge"
    name::Union{String, Nothing} = nothing
    radius::Union{String, Nothing} = nothing
    startAngle::Union{Int, Nothing} = nothing
    endAngle::Union{Int, Nothing} = nothing
    clockwise::Union{Bool, Nothing} = nothing
    min::Union{Int, Nothing} = nothing
    max::Union{Int, Nothing} = nothing
    splitNumber::Union{Int, Nothing} = nothing
    axisLine::Union{AxisLine, Nothing} = nothing
    progress::Union{Dict, Nothing} = nothing
    splitLine::Union{SplitLine, Nothing} = nothing
    axisTick::Union{AxisTick, Nothing} = nothing
    axisLabel::Union{AxisLabel, Nothing} = nothing
    pointer::Union{Dict, Nothing} = nothing
    anchor::Union{Dict, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    title::Union{Title, Nothing} = nothing
    detail::Union{Dict, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSON.JSONText, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
    data::Union{AbstractArray, Nothing} = nothing
end
"""
    FunnelSeries

ECharts series configuration for funnel charts.
"""
@with_kw mutable struct FunnelSeries <: AbstractEChartSeries
    _type::String = "funnel"
    name::Union{String, Nothing} = nothing
    min::Union{Int, Nothing} = nothing
    max::Union{Int, Nothing} = nothing
    minSize::Union{String, Int, Nothing} = nothing
    maxSize::Union{String, Int, Nothing} = nothing
    sort::Union{String, Nothing} = nothing
    gap::Union{Int, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    funnelAlign::Union{String, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    labelLine::Union{LineStyle, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    seriesLayoutBy::Union{String, Nothing} = nothing
    datasetIndex::Union{Int, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSON.JSONText, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    SankeySeries

ECharts series configuration for Sankey flow diagrams.
"""
@with_kw mutable struct SankeySeries <: AbstractEChartSeries
    _type::String = "sankey"
    name::Union{String, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Int, Nothing} = nothing
    top::Union{String, Int, Nothing} = nothing
    right::Union{String, Int, Nothing} = nothing
    bottom::Union{String, Int, Nothing} = nothing
    width::Union{String, Int, Nothing} = nothing
    height::Union{String, Int, Nothing} = nothing
    nodeWidth::Union{Int, Nothing} = nothing
    nodeGap::Union{Int, Nothing} = nothing
    nodeAlign::Union{String, Nothing} = nothing
    layout::Union{String, Nothing} = nothing
    layoutIterations::Union{Int, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    nodes::Union{AbstractVector, Nothing} = nothing
    links::Union{AbstractVector, Nothing} = nothing
    edges::Union{AbstractVector, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSON.JSONText, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    ChordSeries

ECharts series configuration for chord diagrams showing bidirectional flow between nodes.
"""
@with_kw mutable struct ChordSeries <: AbstractEChartSeries
    _type::String = "chord"
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    colorBy::Union{String, Nothing} = nothing
    center::Union{AbstractVector, Nothing} = nothing
    radius::Union{AbstractVector, Nothing} = nothing
    clockwise::Union{Bool, Nothing} = nothing
    startAngle::Union{Number, Nothing} = nothing
    endAngle::Union{Any, Nothing} = nothing
    minAngle::Union{Number, Nothing} = nothing
    padAngle::Union{Number, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    links::Union{AbstractVector, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSON.JSONText, Nothing} = nothing
    universalTransition::Union{Dict, Bool, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    GraphSeries

ECharts series configuration for graph / network relationship charts.
"""
@with_kw mutable struct GraphSeries <: AbstractEChartSeries
    _type::String = "graph"
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    polarIndex::Union{Int, Nothing} = nothing
    geoIndex::Union{Int, Nothing} = nothing
    calendarIndex::Union{Int, Nothing} = nothing
    layout::Union{String, Nothing} = nothing
    circular::Union{Dict, Nothing} = nothing
    force::Union{Dict, Nothing} = nothing
    roam::Union{Bool, Nothing} = nothing
    nodeScaleRatio::Union{AbstractFloat, Nothing} = nothing
    draggable::Union{Bool, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, Nothing} = nothing
    symbolRotate::Union{Int, Nothing} = nothing
    symbolOffset::Union{AbstractVector, Nothing} = nothing
    edgeSymbol::Union{AbstractVector, Nothing} = nothing
    edgeSymbolSize::Union{Int, Nothing} = nothing
    cursor::Union{String, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    labelLayout::Union{Dict, Nothing} = nothing
    edgeLabel::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    categories::Union{AbstractVector, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    nodes::Union{AbstractVector, Nothing} = nothing
    links::Union{AbstractVector, Nothing} = nothing
    edges::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    thumbnail::Union{Dict, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Nothing} = nothing
    top::Union{String, Nothing} = nothing
    right::Union{String, Nothing} = nothing
    bottom::Union{String, Nothing} = nothing
    width::Union{Int, String, Nothing} = nothing
    height::Union{Int, String, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSON.JSONText, Nothing} = nothing
    universalTransition::Union{Dict, Bool, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    LinesSeries

ECharts series configuration for geographic line (route) charts.
"""
@with_kw mutable struct LinesSeries <: AbstractEChartSeries
    _type::String = "lines"
    name::Union{String, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    geoIndex::Union{Int, Nothing} = nothing
    polyline::Union{Bool, Nothing} = nothing
    effect::Union{Dict, Nothing} = nothing
    large::Union{Bool, Nothing} = nothing
    largeThreshold::Union{Int, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    emphasis::Union{LineStyle, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSON.JSONText, Nothing} = nothing
end
"""
    ParallelSeries

ECharts series configuration for parallel coordinates charts.
"""
@with_kw mutable struct ParallelSeries <: AbstractEChartSeries
    _type::String = "parallel"
    coordinateSystem::Union{String, Nothing} = nothing
    parallelIndex::Union{Int, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
    inactiveOpacity::Union{AbstractFloat, Nothing} = nothing
    activeOpacity::Union{Int, Nothing} = nothing
    realtime::Union{Bool, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
end
"""
    MapSeries

ECharts series configuration for geographic map choropleth charts.
"""
@with_kw mutable struct MapSeries <: AbstractEChartSeries
    _type::String = "map"
    name::Union{String, Nothing} = nothing
    map::Union{String, Nothing} = nothing
    roam::Union{Bool, Nothing} = nothing
    center::Union{AbstractVector, Nothing} = nothing
    aspectScale::Union{AbstractFloat, Nothing} = nothing
    boundingCoords::Union{AbstractVector, Nothing} = nothing
    zoom::Union{AbstractFloat, Nothing} = nothing
    scaleLimit::Union{ScaleLimit, Nothing} = nothing
    nameMap::Union{Dict, Nothing} = nothing
    selectedMode::Union{Bool, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Nothing} = nothing
    top::Union{String, Nothing} = nothing
    right::Union{String, Nothing} = nothing
    bottom::Union{String, Nothing} = nothing
    layoutCenter::Union{AbstractVector, Nothing} = nothing
    layoutSize::Union{String, Real, Nothing} = nothing
    geoIndex::Union{Int, Nothing} = nothing
    mapValueCalculation::Union{String, Nothing} = nothing
    showLegendSymbol::Union{Bool, Nothing} = nothing
    seriesLayoutBy::Union{String, Nothing} = nothing
    datasetIndex::Union{Int, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    HeatmapSeries

ECharts series configuration for heatmap charts.
"""
@with_kw mutable struct HeatmapSeries <: AbstractEChartSeries
    _type::String = "heatmap"
    name::Union{String, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    geoIndex::Union{Int, Nothing} = nothing
    calendarIndex::Union{Int, Nothing} = nothing
    blurSize::Union{Int, Nothing} = nothing
    minOpacity::Union{Int, Nothing} = nothing
    maxOpacity::Union{Int, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    CandleStickSeries

ECharts series configuration for candlestick (OHLC) financial charts.
"""
@with_kw mutable struct CandleStickSeries <: AbstractEChartSeries
    _type::String = "candlestick"
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    layout::Union{String, Nothing} = nothing
    barWidth::Union{Int, Nothing} = nothing
    barMinWidth::Union{Int, Nothing} = nothing
    barMaxWidth::Union{Int, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    dimensions::Union{AbstractVector, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    encode::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{JSON.JSONText, String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    SunburstSeries

ECharts series configuration for sunburst (multi-level pie) charts.
"""
@with_kw mutable struct SunburstSeries <: AbstractEChartSeries
    _type::String = "sunburst"
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    center::Union{AbstractVector, Nothing} = nothing
    radius::Union{AbstractVector, Nothing} = nothing
    color::Union{AbstractVector, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    nodeClick::Union{String, Nothing} = nothing
    sort::Union{String, Nothing} = nothing
    renderLabelForZeroData::Union{Bool, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    blur::Union{Dict, Nothing} = nothing
    levels::Union{AbstractVector, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
end
"""
    TreemapSeries

ECharts series configuration for treemap (nested rectangle) charts.
"""
@with_kw mutable struct TreemapSeries <: AbstractEChartSeries
    _type::String = "treemap"
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Nothing} = nothing
    top::Union{String, Nothing} = nothing
    right::Union{String, Nothing} = nothing
    bottom::Union{String, Nothing} = nothing
    width::Union{String, Nothing} = nothing
    height::Union{String, Nothing} = nothing
    breadcrumb::Union{Dict, Nothing} = nothing
    squareRatio::Union{Number, Nothing} = nothing
    leafDepth::Union{Int, Nothing} = nothing
    drillDownIcon::Union{String, Nothing} = nothing
    roam::Union{Bool, String, Nothing} = nothing
    nodeClick::Union{Bool, String, Nothing} = nothing
    zoomToNodeRatio::Union{Number, Nothing} = nothing
    levels::Union{AbstractVector, Nothing} = nothing
    silent::Union{Dict, Nothing} = nothing
    visualDimension::Union{Number, AbstractVector, Nothing} = nothing
    visualMin::Union{Number, Nothing} = nothing
    visualMax::Union{Number, Nothing} = nothing
    colorAlpha::Union{AbstractVector, Nothing} = nothing
    colorSaturation::Union{Number, Nothing} = nothing
    colorMappingBy::Union{String, Nothing} = nothing
    visibleMin::Union{Number, Nothing} = nothing
    childrenVisibleMin::Union{Number, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    upperLabel::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, JSON.JSONText, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    TreeSeries

ECharts series configuration for tree (hierarchy) charts.
"""
@with_kw mutable struct TreeSeries <: AbstractEChartSeries
    _type::String = "tree"
    name::Union{String, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    left::Union{String, Nothing} = nothing
    top::Union{String, Nothing} = nothing
    right::Union{String, Nothing} = nothing
    bottom::Union{String, Nothing} = nothing
    width::Union{Int, String, Nothing} = nothing
    height::Union{Int, String, Nothing} = nothing
    layout::Union{String, Nothing} = nothing
    orient::Union{String, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, Nothing} = nothing
    symbolRotate::Union{Int, Nothing} = nothing
    symbolOffset::Union{AbstractVector, Nothing} = nothing
    expandAndCollapse::Union{Bool, Nothing} = nothing
    initialTreeDepth::Union{Int, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    leaves::Union{Dict, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    edgeShape::Union{String, Nothing} = nothing
    edgeForkPosition::Union{String, Number, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    select::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Dict, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    EffectScatterSeries

ECharts series configuration for effect scatter charts (scatter with ripple animation).
"""
@with_kw mutable struct EffectScatterSeries <: AbstractEChartSeries
    _type::String = "effectScatter"
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    effectType::Union{String, Nothing} = nothing
    showEffectOn::Union{String, Nothing} = nothing
    rippleEffect::Union{Dict, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    polarIndex::Union{Int, Nothing} = nothing
    geoIndex::Union{Int, Nothing} = nothing
    calendarIndex::Union{Int, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, Nothing} = nothing
    symbolRotate::Union{Int, Nothing} = nothing
    symbolOffset::Union{AbstractVector, Nothing} = nothing
    cursor::Union{String, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    dimensions::Union{AbstractVector, Nothing} = nothing
    encode::Union{Dict, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    seriesLayoutBy::Union{String, Nothing} = nothing
    datasetIndex::Union{Int, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, JSON.JSONText, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, JSON.JSONText, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    XYSeries

ECharts series configuration for Cartesian (x-y axis) chart types: bar, line, scatter, area, etc.
This is the series type used internally by [`bar`](@ref), [`line`](@ref), [`scatter`](@ref),
[`area`](@ref), and related functions.
"""
@with_kw mutable struct XYSeries <: AbstractEChartSeries
    #line
    _type::Union{String, Nothing} = nothing
    id::Union{String, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    colorBy::Union{String, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Int = 0
    yAxisIndex::Int = 0
    polarIndex::Union{Int, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Number, AbstractVector,JSON.JSONText, Nothing} = nothing
    symbolRotate::Union{Int, Nothing} = nothing
    symbolOffset::Union{AbstractVector, Nothing} = nothing
    showSymbol::Union{Bool, Nothing} = nothing
    showAllSymbol::Union{Bool, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    stack::Union{Int,String, Nothing} = nothing
    clip::Union{Bool, Nothing} = nothing
    connectNulls::Union{Bool, Nothing} = nothing
    step::Union{String, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    emphasis::Union{Dict, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    areaStyle::Union{AreaStyle, Nothing} = nothing
    smooth::Union{Bool, Nothing} = false
    smoothMonotone::Union{String, Nothing} = nothing
    sampling::Union{String, Nothing} = nothing
    seriesLayoutBy::Union{String, Nothing} = nothing
    datasetIndex::Union{Int, Nothing} = nothing
    dimensions::Union{AbstractVector, Nothing} = nothing
    encode::Union{Dict, Nothing} = nothing
    dataGroupId::Union{String, Nothing} = nothing
    realtimeSort::Union{Bool, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = MarkLine()
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSON.JSONText, Nothing} = nothing
    animationDurationUpdate::Union{Int,JSON.JSONText, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSON.JSONText, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
    #bar
    barWidth::Union{Int, Nothing} = nothing
    barMaxWidth::Union{Int, String, Nothing} = nothing
    barMinHeight::Union{Int, Nothing} = nothing
    barGap::Union{String, Int, Nothing} = nothing
    barCategoryGap::Union{String, Int, Nothing} = nothing
    universalTransition::Union{Dict, Bool, Nothing} = nothing
    #scatter
    geoIndex::Union{Int, Nothing} = nothing
    large::Union{Bool, Nothing} = nothing
    largeThreshold::Union{Int, Nothing} = nothing
end
"""
    CustomSeries

ECharts series configuration for custom-rendered charts. The `renderItem` field accepts
a `JSON.JSONText`-wrapped JavaScript function string that ECharts calls for each data
point to produce SVG/canvas primitives (rect, circle, etc.).

Used internally by [`marimekko`](@ref).
"""
@with_kw mutable struct CustomSeries <: AbstractEChartSeries
    _type::String = "custom"
    name::Union{String, Nothing} = nothing
    renderItem::Union{JSON.JSONText, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    encode::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
"""
    EChart

The main chart struct returned by all ECharts.jl chart constructors (e.g. [`bar`](@ref),
[`line`](@ref), [`scatter`](@ref)).

Fields prefixed with `ec_` are ECharts.jl-internal and do not affect the JavaScript output:
- `ec_width` / `ec_height` : canvas size in pixels (default 800 × 400)
- `ec_renderer` : `"canvas"` (default) or `"svg"`
- `ec_charttype` : internal label for the chart type
- `theme` : the [`Theme`](@ref) applied at render time

All other fields map directly to Apache ECharts option keys (`title`, `xAxis`, `yAxis`,
`series`, `legend`, etc.) and can be mutated after construction for fine-grained control.

See the [Apache ECharts documentation](https://echarts.apache.org/en/option.html) for field
details.
"""
@with_kw mutable struct EChart <: AbstractEChartType
    #fields prefixed with ec_ are ECharts.jl internal, no effect on echarts.js
    ec_width::Int = 800
    ec_height::Int = 400
    ec_renderer::String = "canvas" #svg
    ec_charttype::Union{String, Nothing} = nothing
    ec_mapname::Union{String, Nothing} = nothing
    ec_mapdata::Union{String, Nothing} = nothing
    theme::Theme = roma #required for chart to render
    title::Union{Vector{Title}, Nothing} = [Title()]
    legend::Union{Legend, Nothing} = nothing   #Already has legend! defined, need to modify legend! if change default here
    grid::Union{Array{Grid}, Nothing} = [Grid()]
    xAxis::Union{Array{Axis,1}, Nothing} = nothing
    yAxis::Union{Array{Axis,1}, Nothing} = nothing
    polar::Union{Vector{Polar}, Polar, Nothing} = nothing
    radiusAxis::Union{RadiusAxis, Nothing} = nothing
    angleAxis::Union{AngleAxis, Nothing} = nothing
    radar::Union{Vector{Radar}, Nothing} = nothing
    dataZoom::Union{Vector{DataZoom}, Nothing} = nothing
    visualMap::Union{VisualMap, Nothing} = nothing  #typedef needs to be filled out
    tooltip::Union{Tooltip, Nothing} = Tooltip()
    axisPointer::Union{AxisPointer, Nothing} = nothing
    toolbox::Union{Toolbox, Nothing} = Toolbox()
    brush::Union{Brush, Nothing} = nothing
    geo::Union{Geo, Nothing} = nothing
    parallel::Union{Parallel, Nothing} = nothing
    parallelAxis::Union{AbstractVector, ParallelAxis, Nothing} = nothing
    singleAxis::Union{SingleAxis, Nothing} = nothing
    timeline::Union{Timeline, Nothing} = nothing
    graphic::Union{Graphic, Nothing} = nothing
    calendar::Union{Calendar, Nothing} = nothing
    dataset::Union{Dataset, Nothing} = nothing
    aria::Union{Aria, Nothing} = Aria()
    series::Union{AbstractVector{<:AbstractEChartSeries}, Nothing} = nothing
    color::Union{AbstractVector, Dict, Nothing} = nothing
    backgroundColor::Union{String, Nothing, JSON.JSONText} = nothing
    textStyle::Union{TextStyle, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
    progressive::Any = nothing
    progressiveThreshold::Any = nothing
    blendMode::Any = nothing
    hoverLayerThreshold::Any = nothing
    useUTC::Union{Bool, Nothing} = nothing
    options::Union{AbstractVector, Nothing} = nothing
    media::Union{AbstractVector, Nothing} = nothing
end
