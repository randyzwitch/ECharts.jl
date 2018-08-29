mutable struct BoxPlotStats
    summary::AbstractVector
    outliers::AbstractVector
end
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
@with_kw mutable struct AreaStyle <: AbstractEChartType
    color::Union{AbstractVector, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = 0
    shadowOffsetY::Union{Int, Nothing} = 0
    opacity::Union{Number, Nothing} = nothing
end
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
@with_kw mutable struct SplitArea <: AbstractEChartType
    interval::Union{Int,String, Nothing} = "auto"
    show::Union{Bool, Nothing} = true
    areaStyle::Union{AreaStyle, Nothing} = nothing
end
@with_kw mutable struct SplitLine <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    interval::Union{Int,String,JSFunction, Nothing} = "auto"
    lineStyle::Union{LineStyle, Nothing} = LineStyle()
end
@with_kw mutable struct AxisLabel <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    interval::Union{Int,String, Nothing} = "auto"
    inside::Union{Bool, Nothing} = false
    rotate::Union{Int, Nothing} = 0
    margin::Union{Int, Nothing} = 8
    formatter::Union{String, Nothing, JSFunction} = "{value}"
    showMinLabel::Union{Bool, Nothing} = nothing
    showMaxLabel::Union{Bool, Nothing} = nothing
    color::Union{String,JSFunction, Nothing} = nothing
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
@with_kw mutable struct AxisLine <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    onZero::Union{Bool, Nothing} = true
    onZeroAxisIndex::Union{Int, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{AbstractVector, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = LineStyle()
end
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
    formatter::Union{String, JSFunction, Nothing} = nothing
    textStyle::Union{TextStyle, Nothing} = nothing
end
@with_kw mutable struct ItemStyle <: AbstractEChartType
    color::Union{String, JSFunction, Nothing} = nothing
    barBorderColor::Union{String, Nothing} = nothing
    borderColor::Union{String, Nothing} = nothing
    borderWidth::Union{Int, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = nothing
    shadowOffsetY::Union{Int, Nothing} = nothing
    opacity::Union{Float64, Nothing} = nothing
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
    formatter::Union{String, JSFunction, Nothing} = nothing
    margin::Union{Bool, Number, Nothing} = nothing
    textStyle::Union{TextStyle, Nothing} = nothing
    padding::Union{String, AbstractVector, Nothing} = 5
    backgroundColor::Union{String, Nothing} = nothing
    borderColor::Union{String, Nothing} = nothing
    borderWidth::Union{String, Number, Nothing} = nothing
    shadowBlur::Union{Number, Nothing} = nothing
    shadowColor::Union{String, JSFunction, Nothing} = nothing
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
    formatter::Union{String, Nothing, JSFunction} = nothing
    backgroundColor::Union{String, Nothing, JSFunction} = "rgba(50,50,50,0.7)"
    borderColor::Union{String, Nothing} = "#333"
    borderWidth::Union{Int, Nothing} = 0
    padding::Union{Int, Nothing} = 5
    textStyle::Union{TextStyle, Nothing} = nothing
    extraCssText::Union{String, Nothing} = nothing
end
@with_kw mutable struct Legend <: AbstractEChartType
    _type::Union{String, Nothing} = nothing
    show::Union{Bool, Nothing} = true
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 2
    left::Union{Int,String, Nothing} = nothing
    top::Union{Int,String, Nothing} = "auto"
    right::Union{Int,String, Nothing} = "auto"
    bottom::Union{Int,String, Nothing} = "auto"
    width::Union{Int,String, Nothing} = "auto"
    height::Union{Int,String, Nothing} = "auto"
    orient::Union{String, Nothing} = "horizontal"
    align::Union{String, Nothing} = "auto"
    padding::Union{Int, Nothing} = 5
    itemGap::Union{Int, Nothing} = 10
    itemWidth::Union{Int, Nothing} = 25
    itemHeight::Union{Int, Nothing} = 14
    formatter::Union{String, Nothing, JSFunction} = nothing
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
    pageFormatter::Union{String,JSFunction, Nothing} = nothing
    pageIcons::Union{Dict, Nothing} = nothing
    pageIconColor::Union{String, Nothing} = nothing
    pageIconInactiveColor::Union{String, Nothing} = nothing
    pageIconSize::Union{Int, Nothing} = nothing
    pageTextStyle::Union{TextStyle, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
end
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
    zlevel::Union{Int, Nothing} = 0
    z::Union{Int, Nothing} = 0
end
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
    backgroundColor::Union{String, Nothing, JSFunction} = nothing
    borderColor::Union{String, Nothing} = "transparent"
    borderWidth::Union{Int, Nothing} = 1
    borderRadius::Union{Int, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = 0
    shadowOffsetY::Union{Int, Nothing} = 0
end
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
    backgroundColor::Union{String, Nothing,JSFunction} = "transparent"
    borderColor::Union{String, Nothing} = nothing
    borderWidth::Union{Int, Nothing} = nothing
    shadowBlur::Union{Int, Nothing} = nothing
    shadowColor::Union{String, Nothing} = nothing
    shadowOffsetX::Union{Int, Nothing} = nothing
    shadowOffsetY::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
#This needs work, documentation not clear about what to implement
@with_kw mutable struct DataZoom <: AbstractEChartType
    _type::Union{String, Nothing} = nothing
    show::Bool = false
    start::Union{Number, Nothing} = nothing
    _end::Union{Number, Nothing} = nothing
end
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
    symbolSize::Union{Array{Int,1},Int,JSFunction, Nothing} = 10
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
    name::Union{Dict{Any,Any}, Nothing} = nothing
    nameGap::Union{Int, Nothing} = 15
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
    formatter::Union{String, JSFunction, Nothing} = nothing
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
    nameTextStyle::Union{TextStyle, Nothing} = "#fff"
    nameGap::Union{Int, Nothing} = 15
    nameRotate::Union{Int, Nothing}
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
    source::Union{Dict, Array, Nothing} = nothing
    dimensions::Union{AbstractVector, Nothing} = nothing
    sourceHeader::Union{Bool, Nothing} = nothing
end
@with_kw mutable struct Aria <: AbstractEChartType
    show::Union{Bool, Nothing} = true
    description::Union{String, Nothing} = nothing
    general::Union{Dict, Nothing} = nothing
    series::Union{Dict, Nothing} = nothing
    data::Union{Dict, Nothing} = nothing
end
@with_kw mutable struct MarkPoint <: AbstractEChartType
    _symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, AbstractVector, JSFunction, Nothing} = nothing
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
@with_kw mutable struct MarkLine <: AbstractEChartType
    silent::Union{Bool, Nothing} = nothing
    _symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Int, AbstractVector, JSFunction, Nothing} = nothing
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
@with_kw mutable struct PieSeries <: AbstractEChartSeries
    _type::String = "pie"
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    hoverAnimation::Union{Bool, Nothing} = nothing
    hoverOffset::Union{Int, Nothing} = nothing
    selectedMode::Union{Bool, String, Nothing} = nothing
    selectedOffset::Union{Int, Nothing} = nothing
    clockwise::Union{Bool, Nothing} = nothing
    startAngle::Union{Int, Nothing} = nothing
    minAngle::Union{Int, Nothing} = nothing
    roseType::Union{String, Nothing} = nothing
    aNothingLabelOverlap::Union{Bool, Nothing} = nothing
    stillShowZeroSum::Union{Bool, Nothing} = nothing
    cursor::Union{String, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    labelLine::Union{Dict, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
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
    areaStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
    data::Union{AbstractVector, Nothing}
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSFunction, Nothing} = nothing
    animationDurationUpdate::Union{Int,JSFunction, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
@with_kw mutable struct BoxPlotSeries <: AbstractEChartSeries
    _type::String = "boxplot"
    coordinateSystem::String = "cartesian2d"
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    hoverAnimation::Union{Bool, Nothing} = nothing
    layout::Union{String, Nothing} = nothing
    boxWidth::Union{AbstractVector, Nothing} = nothing
    dimensions::Union{AbstractVector, Nothing} = nothing
    encode::Union{Dict, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSFunction, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
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
    emphasis::Union{ItemStyle, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
@with_kw mutable struct PictorialBarSeries <: AbstractEChartSeries
    _type::String = "pictorialBar"
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    cursor::Union{String, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle} = nothing
    emphasis::Union{ItemStyle} = nothing
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
    hoverAnimation::Union{Dict, Nothing} = nothing
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
    splitLine::Union{SplitLine, Nothing} = nothing
    axisTick::Union{AxisTick, Nothing} = nothing
    axisLabel::Union{AxisLabel, Nothing} = nothing
    pointer::Union{Dict, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
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
    animationDelay::Union{Int, JSFunction, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
    data::Union{AbstractArray, Nothing} = nothing
end
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
    emphasis::Union{ItemStyle, Nothing} = nothing
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
    animationDelay::Union{Int, JSFunction, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
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
    layout::Union{String, Nothing} = nothing
    layoutIterations::Union{Int, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    lineStyle::Union{LineStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    nodes::Union{AbstractVector, Nothing} = nothing
    links::Union{AbstractVector, Nothing} = nothing
    edges::Union{AbstractVector, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animation::Union{Bool, Nothing} = nothing
    animationThreshold::Union{Int, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, Nothing} = nothing
    animationDelay::Union{Int, JSFunction, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
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
    hoverAnimation::Union{Bool, Nothing} = nothing
    layout::Union{String, Nothing} = nothing
    circular::Union{Dict, Nothing} = nothing
    force::Union{Dict, Nothing} = nothing
    roam::Union{Bool, Nothing} = nothing
    nodeScaleRatio::Union{AbstractFloat, Nothing} = nothing
    draggable::Union{Bool, Nothing} = nothing
    focusNodeAdjacency::Union{Bool, Nothing} = nothing
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
    edgeLabel::Union{ItemStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
    categories::Union{AbstractVector, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    nodes::Union{AbstractVector, Nothing} = nothing
    links::Union{AbstractVector, Nothing} = nothing
    edges::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
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
    animationDelay::Union{Int, JSFunction, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
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
    animationDelay::Union{Int, JSFunction, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{Dict, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Nothing} = nothing
end
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
    emphasis::Union{ItemStyle, Nothing} = nothing
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
    emphasis::Union{ItemStyle, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
@with_kw mutable struct CandleStickSeries <: AbstractEChartSeries
    _type::String = "candlestick"
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Union{Int, Nothing} = nothing
    yAxisIndex::Union{Int, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    hoverAnimation::Union{Bool, Nothing} = nothing
    layout::Union{String, Nothing} = nothing
    barWidth::Union{Int, Nothing} = nothing
    barMinWidth::Union{Int, Nothing} = nothing
    barMaxWidth::Union{Int, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    dimensions::Union{AbstractVector, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
    encode::Union{Dict, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    markPoint::Union{MarkPoint, Nothing} = nothing
    markLine::Union{MarkLine, Nothing} = nothing
    markArea::Union{MarkArea, Nothing} = nothing
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    silent::Union{Bool, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{JSFunction, String, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
@with_kw mutable struct SunburstSeries <: AbstractEChartSeries
    _type::String = "sunburst"
    zlevel::Union{Int, Nothing} = nothing
    z::Union{Int, Nothing} = nothing
    center::Union{AbstractVector, Nothing} = nothing
    radius::Union{AbstractVector, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    highlightPolicy::Union{String, Nothing} = nothing
    nodeClick::Union{String, Nothing} = nothing
    sort::Union{String, Nothing} = nothing
    renderLabelForZeroData::Union{Bool, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
    highlight::Union{Dict, Nothing} = nothing
    downplay::Union{Dict, Nothing} = nothing
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
    emphasis::Union{ItemStyle, Nothing} = nothing
    data::Union{AbstractVector, Nothing} = nothing
    animationDuration::Union{Int, Nothing} = nothing
    animationEasing::Union{String, JSFunction, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
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
    lineStyle::Union{LineStyle, Nothing} = nothing
    emphasis::Union{ItemStyle, Nothing} = nothing
    data::Union{Dict, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
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
    emphasis::Union{ItemStyle, Nothing} = nothing
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
    animationEasing::Union{String, JSFunction, Nothing} = nothing
    animationDelay::Union{Int, Nothing} = nothing
    animationDurationUpdate::Union{Int, Nothing} = nothing
    animationEasingUpdate::Union{String, JSFunction, Nothing} = nothing
    animationDelayUpdate::Union{Int, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
end
@with_kw mutable struct XYSeries <: AbstractEChartSeries
    #line
    _type::Union{String, Nothing} = nothing
    name::Union{String, Nothing} = nothing
    coordinateSystem::Union{String, Nothing} = nothing
    xAxisIndex::Int = 0
    yAxisIndex::Int = 0
    polarIndex::Union{Int, Nothing} = nothing
    symbol::Union{String, Nothing} = nothing
    symbolSize::Union{Number, AbstractVector,JSFunction, Nothing} = nothing
    symbolRotate::Union{Int, Nothing} = nothing
    symbolOffset::Union{AbstractVector, Nothing} = nothing
    showSymbol::Union{Bool, Nothing} = nothing
    showAllSymbol::Union{Bool, Nothing} = nothing
    hoverAnimation::Union{Bool, Nothing} = nothing
    legendHoverLink::Union{Bool, Nothing} = nothing
    stack::Union{Int,String, Nothing} = nothing
    clipOverflow::Union{Bool, Nothing} = nothing
    connectNulls::Union{Bool, Nothing} = nothing
    step::Union{String, Nothing} = nothing
    label::Union{Label, Nothing} = nothing
    itemStyle::Union{ItemStyle, Nothing} = nothing
    lineStyle::Union{ItemStyle, Nothing} = nothing
    areaStyle::Union{ItemStyle, Nothing} = nothing
    smooth::Union{Bool, Nothing} = false
    smoothMonotone::Union{String, Nothing} = nothing
    sampling::Union{String, Nothing} = nothing
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
    animationDelay::Union{Int, JSFunction, Nothing} = nothing
    animationDurationUpdate::Union{Int,JSFunction, Nothing} = nothing
    animationEasingUpdate::Union{String, Nothing} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Nothing} = nothing
    tooltip::Union{Tooltip, Nothing} = nothing
    #bar
    barWidth::Union{Int, Nothing} = nothing
    barMaxWidth::Union{Int, String, Nothing} = nothing
    barMinHeight::Union{Int, Nothing} = nothing
    barGap::Union{String, Int, Nothing} = nothing
    barCategoryGap::Union{String, Int, Nothing} = nothing
    #scatter
    geoIndex::Union{Int, Nothing} = nothing
    large::Union{Bool, Nothing} = nothing
    largeThreshold::Union{Int, Nothing} = nothing
end
@with_kw mutable struct EChart <: AbstractEChartType
    #fields prefixed with ec_ are ECharts.jl internal, no effect on echarts.js
    ec_width::Int = 800
    ec_height::Int = 400
    ec_renderer::String = "canvas" #svg
    ec_charttype::Union{String, Nothing} = nothing
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
    parallelAxis::Union{ParallelAxis, Nothing} = nothing
    singleAxis::Union{SingleAxis, Nothing} = nothing
    timeline::Union{Timeline, Nothing} = nothing
    graphic::Union{Graphic, Nothing} = nothing
    calendar::Union{Calendar, Nothing} = nothing
    dataset::Union{Dataset, Nothing} = nothing
    aria::Union{Aria, Nothing} = Aria()
    series::Union{AbstractVector{<:AbstractEChartSeries}, Nothing} = nothing
    color::Union{AbstractVector,JSFunction, Nothing} = nothing
    backgroundColor::Union{String, Nothing, JSFunction} = nothing
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
end
