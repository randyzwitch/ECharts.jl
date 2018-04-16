mutable struct BoxPlotStats
    summary::AbstractVector
    outliers::AbstractVector
end
@with_kw mutable struct LineStyle <: AbstractEChartType
    color::Union{AbstractVector,String,Void} = nothing
    width::Union{Int,Void} = nothing
    _type::Union{String,Void} = nothing
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = nothing
    shadowOffsetY::Union{Int,Void} = nothing
    opacity::Union{Int,Void} = nothing
    curveness::Union{AbstractFloat,Void} = nothing
end
@with_kw mutable struct AreaStyle <: AbstractEChartType
    color::Union{AbstractVector,Void} = nothing
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Number,Void} = nothing
end
@with_kw mutable struct TextStyle <: AbstractEChartType
    color::Union{String,Void} = "#000"
    fontStyle::Union{String,Void} = "normal"
    fontWeight::Union{String,Void} = "normal"
    fontFamily::Union{String,Void} = "sans-serif"
    fontSize::Union{Int,Void} = 12
    align::Union{String, Void} = nothing
    verticalAlign::Union{String, Void} = nothing
    lineHeight::Union{Int, Void} = nothing
    width::Union{Int, String, Void} = nothing
    height::Union{Int, String, Void} = nothing
    textBorderColor::Union{String, Void} = nothing
    textBorderWidth::Union{Int, Void} = nothing
    textShadowColor::Union{String, Void} = nothing
    textShadowBlur::Union{Int, Void} = nothing
    textShadowOffsetX::Union{Int, Void} = nothing
    textShadowOffsetY::Union{Int, Void} = nothing
    rich::Union{Dict, Void} = nothing
end
@with_kw mutable struct SplitArea <: AbstractEChartType
    interval::Union{Int,String,Void} = "auto"
    show::Union{Bool,Void} = true
    areaStyle::Union{AreaStyle,Void} = nothing
end
@with_kw mutable struct SplitLine <: AbstractEChartType
    show::Union{Bool,Void} = true
    interval::Union{Int,String,JSFunction,Void} = "auto"
    lineStyle::Union{LineStyle,Void} = LineStyle()
end
@with_kw mutable struct AxisLabel <: AbstractEChartType
    show::Union{Bool,Void} = true
    interval::Union{Int,String,Void} = "auto"
    inside::Union{Bool,Void} = false
    rotate::Union{Int,Void} = 0
    margin::Union{Int,Void} = 8
    formatter::Union{String,Void, JSFunction} = "{value}"
    showMinLabel::Union{Bool, Void} = nothing
    showMaxLabel::Union{Bool, Void} = nothing
    color::Union{String,JSFunction,Void} = nothing
    fontStyle::Union{String, Void} = nothing
    fontWeight::Union{String, Void} = nothing
    fontFamily::Union{String, Void} = nothing
    fontSize::Union{Int, Void} = nothing
    align::Union{String, Void} = nothing
    verticalAlign::Union{String, Void} = nothing
    lineHeight::Union{Int, Void} = nothing
    backgroundColor::Union{String, Void} = nothing
    borderColor::Union{String, Void} = nothing
    borderWidth::Union{Int, Void} = nothing
    borderRadius::Union{Int, Void} = nothing
    padding::Union{AbstractVector,Int, Void} = nothing
    shadowColor::Union{String, Void} = nothing
    shadowBlur::Union{Int, Void} = nothing
    shadowOffsetX::Union{Int, Void} = nothing
    shadowOffsetY::Union{Int, Void} = nothing
    width::Union{Int, Void} = nothing
    height::Union{Int, Void} = nothing
    textBorderColor::Union{String, Void} = nothing
    textBorderWidth::Union{Int, Void} = nothing
    textShadowColor::Union{String, Void} = nothing
    textShadowBlur::Union{Int, Void} = nothing
    textShadowOffsetX::Union{Int, Void} = nothing
    textShadowOffsetY::Union{Int, Void} = nothing
    rich::Union{Dict, Void} = nothing
end
@with_kw mutable struct AxisLine <: AbstractEChartType
    show::Union{Bool,Void} = true
    onZero::Union{Bool,Void} = true
    onZeroAxisIndex::Union{Int, Void} = nothing
    symbol::Union{String, Void} = nothing
    symbolSize::Union{AbstractVector, Void} = nothing
    lineStyle::Union{LineStyle,Void} = LineStyle()
end
@with_kw mutable struct AxisTick <: AbstractEChartType
    show::Union{Bool,Void} = true
    alignWithLabel::Union{Bool, Void} = nothing
    interval::Union{Int,String,Void} = "auto"
    inside::Union{Bool,Void} = false
    length::Union{Int,Void} = 5
    lineStyle::Union{LineStyle,Void} = LineStyle()
end
@with_kw mutable struct Label <: AbstractEChartType
    show::Union{Bool,Void} = nothing
    position::Union{String, Void} = nothing
    offset::Union{AbstractVector, Void} = nothing
    formatter::Union{String, JSFunction, Void} = nothing
    textStyle::Union{TextStyle,Void} = nothing
end
@with_kw mutable struct ItemStyle <: AbstractEChartType
    color::Union{String, JSFunction, Void} = nothing
    barBorderColor::Union{String,Void} = nothing
    borderColor::Union{String,Void} = nothing
    borderWidth::Union{Int,Void} = nothing
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = nothing
    shadowOffsetY::Union{Int,Void} = nothing
    opacity::Union{Float64,Void} = nothing
end
@with_kw mutable struct IconStyleOpts <: AbstractEChartType
    color::Union{String,Void} = "adaptive"
    borderColor::Union{String,Void} = "#666"
    borderWidth::Union{Int,Void} = 1
    borderType::Union{Int,Void} = 1
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Int,Void} = nothing
end
@with_kw mutable struct IconStyle <: AbstractEChartType
    normal::Union{ItemStyle,Void} = nothing
    emphasis::Union{ItemStyle,Void} = nothing
end
@with_kw mutable struct CrossStyle <: AbstractEChartType
    color::Union{String,Void} = "#555"
    width::Union{Int,Void} = 1
    _type::Union{String,Void} = "dashed"
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Number,Void} = 0
    textStyle::Union{TextStyle,Void} = nothing
end
@with_kw mutable struct ShadowStyle <: AbstractEChartType
    color::Union{String,Void} = "rgba(150,150,150,0.5)"
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Number,Void} = 0
end
@with_kw mutable struct AxisPointerLabel <: AbstractEChartType
    show::Union{Bool, Void} = false
    precision::Union{String, Number, Void} = "auto"
    formatter::Union{String, JSFunction, Void} = nothing
    margin::Union{Bool, Number, Void} = nothing
    textStyle::Union{TextStyle, Void} = nothing
    padding::Union{String, AbstractVector, Void} = 5
    backgroundColor::Union{String, Void} = nothing
    borderColor::Union{String, Void} = nothing
    borderWidth::Union{String, Number, Void} = nothing
    shadowBlur::Union{Number, Void} = nothing
    shadowColor::Union{String, JSFunction, Void} = nothing
    shadowOffsetX::Union{Number, Void} = nothing
    shadowOffsetY::Union{Number, Void} = nothing
end
@with_kw mutable struct AxisPointer <: AbstractEChartType
    show::Union{Bool,Void} = false
    _type::Union{String,Void} = "line"
    snap::Union{Bool,Void} = nothing
    z::Union{Int,Void} = nothing
    label::Union{AxisPointerLabel,Void} = nothing
    lineStyle::Union{LineStyle,Void} = nothing
    shadowStyle::Union{ShadowStyle,Void} = nothing
    triggerTooltip::Union{String,Void} = nothing
    value::Union{Number, Void} = nothing
    status::Union{Bool, Void} = nothing
    handle::Any = nothing #for mobile device, do later
    link::Union{AbstractVector, Any} = nothing
    triggerOn::Union{String, Void} = nothing
end
@with_kw mutable struct Tooltip <: AbstractEChartType
    show::Union{Bool,Void} = true
    trigger::Union{String,Void} = "item"
    axisPointer::Union{AxisPointer,Void} = nothing
    showContent::Union{Bool,Void} = true
    alwaysShowContent::Union{Bool,Void} = false
    triggerOn::Union{String,Void} = "mousemove"
    showDelay::Union{Int,Void} = 0
    hideDelay::Union{Int,Void} = 100
    enterable::Union{Bool,Void} = true
    confine::Union{Bool,Void} = false
    transitionDuration::Union{Number,Void} = 0.4
    position::Union{AbstractVector,String,Void} = nothing
    formatter::Union{String,Void, JSFunction} = nothing
    backgroundColor::Union{String,Void, JSFunction} = "rgba(50,50,50,0.7)"
    borderColor::Union{String,Void} = "#333"
    borderWidth::Union{Int,Void} = 0
    padding::Union{Int,Void} = 5
    textStyle::Union{TextStyle,Void} = nothing
    extraCssText::Union{String,Void} = nothing
end
@with_kw mutable struct Legend <: AbstractEChartType
    _type::Union{String,Void} = nothing
    show::Union{Bool,Void} = true
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = nothing
    top::Union{Int,String,Void} = "auto"
    right::Union{Int,String,Void} = "auto"
    bottom::Union{Int,String,Void} = "auto"
    width::Union{Int,String,Void} = "auto"
    height::Union{Int,String,Void} = "auto"
    orient::Union{String,Void} = "horizontal"
    align::Union{String,Void} = "auto"
    padding::Union{Int,Void} = 5
    itemGap::Union{Int,Void} = 10
    itemWidth::Union{Int,Void} = 25
    itemHeight::Union{Int,Void} = 14
    formatter::Union{String,Void, JSFunction} = nothing
    selectedMode::Union{Bool,String,Void} = true
    inactiveColor::Union{String,Void} = "#ccc"
    selected::Union{Dict{String,Bool},Void} = nothing
    textStyle::Union{TextStyle,Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    backgroundColor::Union{String,Void} = "transparent"
    borderColor::Union{String,Void} = "transparent"
    borderWidth::Union{Int,Void} = 1
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    scrollDataIndex::Union{Int,Void} = nothing
    pageButtonItemGap::Union{Int,Void} = nothing
    pageButtonPosition::Union{Int,Void} = nothing
    pageFormatter::Union{String,JSFunction,Void} = nothing
    pageIcons::Union{Dict, Void} = nothing
    pageIconColor::Union{String, Void} = nothing
    pageIconInactiveColor::Union{String, Void} = nothing
    pageIconSize::Union{Int, Void} = nothing
    pageTextStyle::Union{TextStyle, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
end
@with_kw mutable struct Toolbox <: AbstractEChartType
    show::Union{Bool,Void} = false
    orient::Union{String,Void} = "vertical"
    itemSize::Union{Number,Void} = 15
    itemGap::Union{Number,Void} = 20
    showTitle::Union{Bool,Void} = true
    feature::Union{Dict{Any,Any},Void} = Dict{Any,Any}()
    iconStyle::Union{IconStyle,Void} = nothing
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Number,String,Void} = nothing
    top::Union{Number,String,Void} = "center"
    right::Union{Number,String,Void} = "auto"
    bottom::Union{Number,String,Void} = nothing
    width::Union{Number,String,Void} = "auto"
    height::Union{Number,String,Void} = "auto"
end
@with_kw mutable struct Brush <: AbstractEChartType
    toolbox::Union{AbstractArray, Void} = nothing
    brushLink::Union{AbstractArray, String, Void} = nothing
    seriesIndex::Union{AbstractArray, Number, String, Void} = nothing
    geoIndex::Union{AbstractArray, Number, String, Void} = nothing
    xAxisIndex::Union{AbstractArray, Number, String, Void} = nothing
    yAxisIndex::Union{AbstractArray, Number, String, Void} = nothing
    brushType::Union{String, Void} = nothing
    brushMode::Union{String, Void} = nothing
    transformable::Union{Bool, Void} = nothing
    brushStyle::Union{Dict, Void} = nothing
    throttleType::Union{String, Void} = nothing
    throttleDelay::Union{Number, Void} = nothing
    removeOnClick::Union{Bool, Void} = nothing
    inBrush::Union{Dict, Void} = nothing
    outOfBrush::Union{Dict, Void} = nothing
    z::Union{Int, Void} = nothing
end
@with_kw mutable struct Axis <: AbstractEChartType
    show::Union{Bool, Void} = nothing
    gridIndex::Union{Int,Void} = 0
    position::Union{String,Void} = nothing
    offset::Union{Int,Void} = nothing
    _type::Union{String,Void} = nothing
    name::Union{String,Void} = nothing
    nameLocation::Union{String,Void} = "middle"
    nameTextStyle::Union{TextStyle,Void} = nothing
    nameGap::Union{Int,Void} = 30
    nameRotate::Union{Int,Void} = nothing
    inverse::Union{Bool,Void} = false
    boundaryGap::Union{AbstractVector,Bool,Void} = nothing
    min::Union{Int,String,Void} = nothing
    max::Union{Int,String,Void} = nothing
    scale::Union{Bool,Void} = false
    splitNumber::Union{Int,Void} = 5
    minInterval::Union{Int,Void} = 0
    interval::Union{Int,Void} = nothing
    logBase::Union{Int, Void} = nothing
    silent::Union{Bool,Void} = true
    triggerEvent::Union{Bool,Void} = false
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = AxisLabel()
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    axisPointer::Union{AxisPointer, Void} = nothing
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 0
end
@with_kw mutable struct Title <: AbstractEChartType
    show::Union{Bool,Void} = true
    text::Union{String,Void} = nothing
    link::Union{String,Void} = nothing
    target::Union{String,Void} = "blank"
    textStyle::Union{TextStyle,Void} = nothing
    subtext::Union{String,Void} = nothing
    sublink::Union{String,Void} = nothing
    subtarget::Union{String,Void} = "blank"
    subtextStyle::Union{TextStyle,Void} = nothing
    padding::Union{Array{Int,1},Int,Void} = 5
    itemGap::Union{Int,Void} = 5
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = "left"
    top::Union{Int,String,Void} = "auto"
    right::Union{Int,String,Void} = "auto"
    bottom::Union{Int,String,Void} = "auto"
    backgroundColor::Union{String,Void, JSFunction} = nothing
    borderColor::Union{String,Void} = "transparent"
    borderWidth::Union{Int,Void} = 1
    borderRadius::Union{Int,Void} = nothing
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
end
@with_kw mutable struct Grid <: AbstractEChartType
    show::Bool = false
    zlevel::Union{Int,Void} = nothing
    z::Union{Int,Void} = nothing
    left::Union{Int,String,Void} = nothing
    top::Union{Int,String,Void} = nothing
    right::Union{Int,String,Void} = nothing
    bottom::Union{Int,String,Void} = nothing
    width::Union{Int,String,Void} = "auto"
    height::Union{Int,String,Void} = "auto"
    containLabel::Union{Bool,Void} = nothing
    backgroundColor::Union{String,Void,JSFunction} = "transparent"
    borderColor::Union{String,Void} = nothing
    borderWidth::Union{Int,Void} = nothing
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = nothing
    shadowOffsetY::Union{Int,Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
#This needs work, documentation not clear about what to implement
@with_kw mutable struct DataZoom <: AbstractEChartType
    _type::Union{String,Void} = nothing
    show::Bool = false
    start::Union{Number,Void} = nothing
    _end::Union{Number,Void} = nothing
end
@with_kw mutable struct Timeline <: AbstractEChartType
    show::Union{Bool,Void} = true
    _type::Union{String,Void} = "slider"
    axisType::Union{String,Void} = "time"
    currentIndex::Union{Int,Void} = 0
    autoPlay::Union{Bool,Void} = false
    rewind::Union{Bool,Void} = false
    loop::Union{Bool,Void} = true
    playInterval::Union{Int,Void} = 2000
    realtime::Union{Bool,Void} = true
    controlPosition::Union{String,Void} = "left"
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = "auto"
    top::Union{Int,String,Void} = "auto"
    right::Union{Int,String,Void} = "auto"
    bottom::Union{Int,String,Void} = "auto"
    padding::Union{Array{Int,1},Int,Void} = 5
    orient::Union{String,Void} = "horizontal"
    inverse::Union{Bool,Void} = false
    symbol::Union{String,Void} = "emptyCircle"
    symbolSize::Union{Array{Int,1},Int,JSFunction,Void} = 10
    symbolRotate::Union{Int,Void} = nothing
    symbolOffset::Union{Array{Int,1},Void} = [0,0]
    lineStyle::Union{LineStyle,Void} = nothing
    label::Union{Label,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    checkpointStyle::Union{Dict,Void} = nothing
    controlStyle::Union{Dict,Void} = nothing
    emphasis::Union{Dict,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
end
@with_kw mutable struct Polar <: AbstractEChartType
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    center::Union{Array{String,1},Void} = String["50%","50%"]
    radius::Union{AbstractVector,Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct RadiusAxis <: AbstractEChartType
    polarIndex::Union{Int,Void} = 0
    _type::Union{String,Void} = "value"
    name::Union{String,Void} = nothing
    nameLocation::Union{String,Void} = "start"
    nameTextStyle::Union{TextStyle,Void} = nothing
    nameGap::Union{Int,Void} = 15
    nameRotate::Union{Int,Void} = nothing
    inverse::Union{Bool,Void} = false
    boundaryGap::Union{Array{String,1},Bool,Void} = nothing
    min::Union{Int,String,Void} = nothing
    max::Union{Int,String,Void} = nothing
    scale::Union{Bool,Void} = false
    splitNumber::Union{Int,Void} = 5
    minInterval::Union{Int,Void} = 0
    maxInterval::Union{Int,Void} = nothing
    interval::Union{Int,Void} = nothing
    logBase::Union{Int,Void} = nothing
    silent::Union{Bool,Void} = true
    triggerEvent::Union{Bool,Void} = false
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    axisPointer::Union{AxisPointer, Void} = nothing
    zlevel::Union{Int,Void} = nothing
    z::Union{Int,Void} = nothing
end
@with_kw mutable struct AngleAxis <: AbstractEChartType
    polarIndex::Union{Int,Void} = 0
    startAngle::Union{Int,Void} = nothing
    clockwise::Union{Bool,Void} = true
    _type::Union{String,Void} = nothing
    boundaryGap::Union{AbstractVector,Bool,Void} = nothing
    min::Union{Int,String,Void} = nothing
    max::Union{Int,String,Void} = nothing
    scale::Union{Bool,Void} = false
    splitNumber::Union{Int,Void} = nothing
    minInterval::Union{Int,Void} = 0
    maxInterval::Union{Int,Void} = nothing
    interval::Union{Int,Void} = nothing
    logBase::Union{Int,Void} = nothing
    silent::Union{Bool,Void} = true
    triggerEvent::Union{Bool,Void} = nothing
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    axisPointer::Union{AxisPointer, Void} = nothing
    zlevel::Union{Int,Void} = nothing
    z::Union{Int,Void} = nothing
end
@with_kw mutable struct Radar <: AbstractEChartType
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    center::Union{Array{String,1},Void} = String["50%","50%"]
    radius::Union{Int,String,Void} = "75%"
    startAngle::Union{Int,Void} = 90
    name::Union{Dict{Any,Any},Void} = nothing
    nameGap::Union{Int,Void} = 15
    splitNumber::Union{Int,Void} = nothing
    shape::Union{String, Void} = nothing
    scale::Union{Bool, Void} = nothing
    silent::Union{Bool,Void} = true
    triggerEvent::Union{Bool, Void} = nothing
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    indicator::Union{AbstractVector,Void} = nothing
end
@with_kw mutable struct VisualMap <: AbstractEChartType
    #continuous
    _type::Union{String,Void} = nothing
    min::Union{Real,Void} = nothing
    max::Union{Real,Void} = nothing
    range::Union{AbstractVector, Void} = nothing
    calculable::Union{Bool, Void} = nothing
    realtime::Union{Bool, Void} = nothing
    inverse::Union{Bool, Void} = nothing
    precision::Union{Int,Void} = nothing
    itemWidth::Union{Int,Void} = nothing
    itemHeight::Union{Int,Void} = nothing
    align::Union{String,Void} = nothing
    text::Union{AbstractVector, Void} = nothing
    textGap::Union{AbstractVector, Int, Void} = nothing
    show::Union{Bool, Void} = nothing
    dimension::Union{String,Void} = nothing
    seriesIndex::Union{AbstractVector, Int, Void} = nothing
    hoverLink::Union{Bool, Void} = nothing
    inRange::Union{Dict, Void} = nothing
    outOfRange::Union{Dict, Void} = nothing
    controller::Union{Dict, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    left::Union{String, Int, Void} = nothing
    top::Union{String, Int, Void} = nothing
    right::Union{String, Int, Void} = nothing
    bottom::Union{String, Int, Void} = nothing
    orient::Union{String,Void} = nothing
    padding::Union{AbstractVector, Int ,Void} = nothing
    backgroundColor::Union{String,Void} = nothing
    borderColor::Union{String,Void} = nothing
    borderWidth::Union{Int,Void} = nothing
    color::Union{String,Void} = nothing
    textStyle::Union{TextStyle, Void} = nothing
    formatter::Union{String, JSFunction, Void} = nothing
    #piecewise
    splitNumber::Union{Int, Void} = nothing
    pieces::Union{AbstractVector, Void} = nothing
    categories::Union{AbstractVector, Void} = nothing
    minOpen::Union{Bool, Void} = nothing
    maxOpen::Union{Bool, Void} = nothing
    selectedMode::Union{String, Void} = nothing
    showLabel::Union{Bool, Void} = nothing
    itemGap::Union{Int, Void} = nothing
    itemSymbol::Union{String, Void} = nothing

end
@with_kw mutable struct ScaleLimit <: AbstractEChartType
    min::Union{Int,Void} = nothing
    max::Union{Int,Void} = nothing
end
@with_kw mutable struct Geo <: AbstractEChartType
    show::Union{Bool,Void} = true
    map::Union{String,Void} = nothing
    roam::Union{Bool,Void} = false
    center::Union{Array{Number,1},Void} = nothing
    aspectScale::Union{Number, Void} = nothing
    boundingCoords::Union{AbstractArray, Void} = nothing
    zoom::Union{Int,Void} = 1
    scaleLimit::Union{ScaleLimit,Void} = nothing
    nameMap::Union{Dict,Void} = nothing
    selectedMode::Union{Bool,Void} = false
    label::Union{Label,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    emphasis::Union{Dict, Void} = nothing
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = "auto"
    top::Union{Int,String,Void} = "auto"
    right::Union{Int,String,Void} = "auto"
    bottom::Union{Int,String,Void} = "auto"
    layoutCenter::Union{Array{Number,1},Void} = nothing
    layoutSize::Union{Number,String,Void} = nothing
    regions::Union{AbstractVector,Void} = nothing
    silent::Union{Bool,Void} = false
end
@with_kw mutable struct Parallel <: AbstractEChartType
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = "auto"
    top::Union{Int,String,Void} = 60
    right::Union{Int,String,Void} = 80
    bottom::Union{Int,String,Void} = 60
    width::Union{Int,String,Void} = "auto"
    height::Union{Int,String,Void} = "auto"
    layout::Union{String,Void} = "horizontal"
    axisExpandable::Union{Bool, Void} = nothing
    axisExpandCenter::Union{Number, Void} = nothing
    axisExpandCount::Union{Number, Void} = nothing
    axisExpandWidth::Union{Number, Void} = nothing
    axisExpandTriggerOn::Union{String, Void} = nothing
    parallelAxisDefault::Union{Dict,Void} = nothing
end
@with_kw mutable struct AreaSelectStyle <: AbstractEChartType
    width::Union{Int,Void} = 20
    borderWidth::Union{Int,Void} = 1
    borderColor::Union{String,Void} = "rgba(160,197,232)"
    color::Union{String,Void} = "rgba(160,197,232)"
    opacity::Union{Number,Void} = 0.3
end
@with_kw mutable struct ParallelAxis <: AbstractEChartType
    dim::Union{Int,Void} = nothing
    parallelIndex::Union{Int,Void} = 0
    realtime::Union{Bool,Void} = nothing
    areaSelectStyle::Union{AreaSelectStyle,Void} = nothing
    _type::Union{String,Void} = "value"
    name::Union{String,Void} = nothing
    nameLocation::Union{String,Void} = "start"
    nameTextStyle::Union{TextStyle,Void} = "#fff"
    nameGap::Union{Int,Void} = 15
    nameRotate::Union{Int,Void}
    inverse::Union{Bool,Void} = false
    boundaryGap::Union{AbstractVector,Bool,Void} = nothing
    min::Union{Int,String,Void} = "auto"
    max::Union{Int,String,Void} = "auto"
    scale::Union{Bool,Void} = false
    splitNumber::Union{Int,Void} = 5
    minInterval::Union{Int,Void} = 0
    maxInterval::Union{Int,Void} = nothing
    interval::Union{Int,Void} = nothing
    logBase::Union{Int,Void} = nothing
    silent::Union{Bool,Void} = true
    triggerEvent::Union{Bool,Void} = nothing
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    data::Union{Dict,Void} = nothing
end
@with_kw mutable struct SingleAxis <: AbstractEChartType
    zlevel::Union{Int,Void} = nothing
    z::Union{Int,Void} = nothing
    left::Union{String, Number, Void} = nothing
    top::Union{String, Number, Void} = nothing
    right::Union{String, Number, Void} = nothing
    bottom::Union{String, Number, Void} = nothing
    width::Union{String, Number, Void} = nothing
    height::Union{String, Number, Void} = nothing
    orient::Union{String, Void} = nothing
    _type::Union{String, Void} = nothing
    name::Union{String, Void} = nothing
    nameLocation::Union{String, Void} = nothing
    nameTextStyle::Union{TextStyle, Void} = nothing
    nameGap::Union{Number, Void} = nothing
    nameRotate::Union{Number, Void} = nothing
    inverse::Union{Bool, Void} = nothing
    boundaryGap::Union{Bool, AbstractVector, Void} = nothing
    min::Union{String, Number, Void} = nothing
    max::Union{String, Number, Void} = nothing
    scale::Union{Bool, Void} = nothing
    splitNumber::Union{Number, Void} = nothing
    minInterval::Union{Number, Void}  = nothing
    maxInterval::Union{Number, Void}  = nothing
    interval::Union{Number, Void} = nothing
    logBase::Union{Number, Void} = nothing
    silent::Union{Bool, Void} = nothing
    triggerEvent::Union{Bool, Void} = nothing
    axisLine::Union{AxisLine, Void} = nothing
    axisTick::Union{AxisTick, Void} = nothing
    axisLabel::Union{AxisLabel, Void} = nothing
    splitLine::Union{SplitLine, Void} = nothing
    splitArea::Union{SplitArea, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    axisPointer::Union{AxisPointer, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
#Needs to be fleshed out, might not be possible due to $action fieldname
@with_kw mutable struct Graphic <: AbstractEChartType
    tbd::Any = nothing
end
@with_kw mutable struct Calendar <: AbstractEChartType
    zlevel::Union{Int,Void} = nothing
    z::Union{Int,Void} = nothing
    left::Union{String, Number, Void} = nothing
    top::Union{String, Number, Void} = nothing
    right::Union{String, Number, Void} = nothing
    bottom::Union{String, Number, Void} = nothing
    width::Union{String, Number, Void} = nothing
    height::Union{String, Number, Void} = nothing
    range::Union{String, Number, AbstractVector, Void} = nothing
    cellSize::Union{Number, AbstractVector, Void} = nothing
    orient::Union{String, Void} = nothing
    splitLine::Union{SplitLine, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    dayLabel::Union{Dict, Void} = nothing
    monthLabel::Union{Dict, Void} = nothing
    yearLabel::Union{Dict, Void} = nothing
    silent::Union{Bool,Void} = nothing
end
@with_kw mutable struct Dataset <: AbstractEChartType
    source::Union{Dict, Array, Void} = nothing
    dimensions::Union{AbstractVector, Void} = nothing
    sourceHeader::Union{Bool, Void} = nothing
end
@with_kw mutable struct Aria <: AbstractEChartType
    show::Union{Bool, Void} = true
    description::Union{String, Void} = nothing
    general::Union{Dict, Void} = nothing
    series::Union{Dict, Void} = nothing
    data::Union{Dict, Void} = nothing
end
@with_kw mutable struct MarkPoint <: AbstractEChartType
    _symbol::Union{String, Void} = nothing
    symbolSize::Union{Int, AbstractVector, JSFunction, Void} = nothing
    symbolRotate::Union{Int, Void} = nothing
    symbolOffset::Union{AbstractVector, Void} = nothing
    silent::Union{Bool, Void} = nothing
    label::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    data::Union{Dict, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{String, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{String, Void} = nothing
    animationDelayUpdate::Union{Int, Void} = nothing
end
@with_kw mutable struct MarkLine <: AbstractEChartType
    silent::Union{Bool, Void} = nothing
    _symbol::Union{String, Void} = nothing
    symbolSize::Union{Int, AbstractVector, JSFunction, Void} = nothing
    precision::Union{Int, Void} = nothing
    label::Union{Dict, Void} = nothing
    lineStyle::Union{LineStyle, Void} = deepcopy(LineStyle())
    data::Union{Vector, Void} = Any[]
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{String, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{String, Void} = nothing
    animationDelayUpdate::Union{Int, Void} = nothing
end
@with_kw mutable struct MarkArea <: AbstractEChartType
    silent::Union{Bool, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    data::Union{AbstractVector, Void} = Any[]
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{String, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{String, Void} = nothing
    animationDelayUpdate::Union{Int, Void} = nothing
end
#Need to validate for all types
#Make individual series types like echarts.js?
@with_kw mutable struct PieSeries <: AbstractEChartSeries
    _type::String = "pie"
    name::Union{String,Void} = nothing
    legendHoverLink::Union{Bool,Void} = nothing
    hoverAnimation::Union{Bool,Void} = nothing
    hoverOffset::Union{Int, Void} = nothing
    selectedMode::Union{Bool, String, Void} = nothing
    selectedOffset::Union{Int, Void} = nothing
    clockwise::Union{Bool, Void} = nothing
    startAngle::Union{Int, Void} = nothing
    minAngle::Union{Int, Void} = nothing
    roseType::Union{String,Void} = nothing
    avoidLabelOverlap::Union{Bool, Void} = nothing
    stillShowZeroSum::Union{Bool, Void} = nothing
    cursor::Union{String, Void} = nothing
    label::Union{Label, Void} = nothing
    labelLine::Union{Dict,Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    emphasis::Union{ItemStyle,Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    center::Union{AbstractVector,String,Void} = nothing
    radius::Union{AbstractVector,String,Void} = nothing
    seriesLayoutBy::Union{String, Void} = nothing
    datasetIndex::Union{Int, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animationType::Union{String,Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{String, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{String, Void} = nothing
    animationDelayUpdate::Union{Int, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct RadarSeries <: AbstractEChartSeries
    _type::String = "radar"
    name::Union{String,Void} = nothing
    radarIndex::Union{Int, Void} = nothing
    symbol::Union{String,Void} = nothing
    symbolSize::Union{Int, Void} = nothing
    symbolRotate::Union{Int, Void} = nothing
    symbolOffset::Union{AbstractVector, Void} = nothing
    label::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    lineStyle::Union{LineStyle,Void} = nothing
    areaStyle::Union{ItemStyle,Void} = nothing
    emphasis::Union{ItemStyle,Void} = nothing
    data::Union{AbstractVector, Void}
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool,Void} = nothing
    animationThreshold::Union{Int,Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int, JSFunction, Void} = nothing
    animationDurationUpdate::Union{Int,JSFunction, Void} = nothing
    animationEasingUpdate::Union{String,Void} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct BoxPlotSeries <: AbstractEChartSeries
    _type::String = "boxplot"
    coordinateSystem::String = "cartesian2d"
    xAxisIndex::Union{Int, Void} = nothing
    yAxisIndex::Union{Int, Void} = nothing
    name::Union{String,Void} = nothing
    legendHoverLink::Union{Bool, Void} = nothing
    hoverAnimation::Union{Bool, Void} = nothing
    layout::Union{String,Void} = nothing
    boxWidth::Union{AbstractVector,Void} = nothing
    dimensions::Union{AbstractVector,Void} = nothing
    encode::Union{Dict,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    markPoint::Union{MarkPoint,Void} = nothing
    markLine::Union{MarkLine,Void} = nothing
    markArea::Union{MarkArea,Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int, JSFunction, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct ThemeRiverSeries <: AbstractEChartSeries
    _type::String = "themeRiver"
    zlevel::Union{Int,Void} = nothing
    z::Union{Int,Void} = nothing
    left::Union{String, Int, Void} = nothing
    top::Union{String, Int, Void} = nothing
    right::Union{String, Int, Void} = nothing
    bottom::Union{String, Int, Void} = nothing
    width::Union{String, Int, Void} = nothing
    height::Union{String, Int, Void} = nothing
    coordinateSystem::Union{String, Void} = nothing
    boundaryGap::Union{AbstractVector, Void} = nothing
    singleAxisIndex::Union{Int, Void} = nothing
    label::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct PictorialBarSeries <: AbstractEChartSeries
    _type::String = "pictorialBar"
    name::Union{String, Void} = nothing
    legendHoverLink::Union{Bool, Void} = nothing
    coordinateSystem::Union{String, Void} = nothing
    xAxisIndex::Union{Int, Void} = nothing
    yAxisIndex::Union{Int, Void} = nothing
    cursor::Union{String, Void} = nothing
    label::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle} = nothing
    emphasis::Union{ItemStyle} = nothing
    barWidth::Union{Int, String, Void} = nothing
    barMaxWidth::Union{Int, String, Void} = nothing
    barMinHeight::Union{Int, Void} = nothing
    barGap::Union{Int, String, Void} = nothing
    barCategoryGap::Union{Int, String, Void} = nothing
    symbol::Union{String, Void} = nothing
    symbolSize::Union{AbstractVector, Void} = nothing
    symbolPosition::Union{String, Void} = nothing
    symbolOffset::Union{AbstractVector, Void} = nothing
    symbolRotate::Union{Int, Void} = nothing
    symbolRepeat::Union{Bool, Int, String, Void} = nothing
    symbolRepeatDirection::Union{String, Void} = nothing
    symbolMargin::Union{Int, String, Void} = nothing
    symbolClip::Union{Bool, Void} = nothing
    symbolBoundingData::Union{Int, AbstractArray, Void} = nothing
    symbolPatternSize::Union{Int, Void} = nothing
    hoverAnimation::Union{Dict, Void} = nothing
    dimensions::Union{AbstractArray, Void} = nothing
    encode::Union{Dict, Void} = nothing
    data::Union{AbstractArray, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{Dict, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct GaugeSeries <: AbstractEChartSeries
    _type::String = "gauge"
    name::Union{String, Void} = nothing
    radius::Union{String, Void} = nothing
    startAngle::Union{Int, Void} = nothing
    endAngle::Union{Int, Void} = nothing
    clockwise::Union{Bool, Void} = nothing
    min::Union{Int, Void} = nothing
    max::Union{Int, Void} = nothing
    splitNumber::Union{Int, Void} = nothing
    axisLine::Union{AxisLine, Void} = nothing
    splitLine::Union{SplitLine, Void} = nothing
    axisTick::Union{AxisTick, Void} = nothing
    axisLabel::Union{AxisLabel, Void} = nothing
    pointer::Union{Dict, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    title::Union{Title, Void} = nothing
    detail::Union{Dict, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int, JSFunction, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{Dict, Void} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
    data::Union{AbstractArray, Void} = nothing
end
@with_kw mutable struct FunnelSeries <: AbstractEChartSeries
    _type::String = "funnel"
    name::Union{String, Void} = nothing
    min::Union{Int, Void} = nothing
    max::Union{Int, Void} = nothing
    minSize::Union{String, Int, Void} = nothing
    maxSize::Union{String, Int, Void} = nothing
    sort::Union{String, Void} = nothing
    gap::Union{Int, Void} = nothing
    legendHoverLink::Union{Bool, Void} = nothing
    funnelAlign::Union{String, Void} = nothing
    label::Union{Label, Void} = nothing
    labelLine::Union{LineStyle, Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    seriesLayoutBy::Union{String, Void} = nothing
    datasetIndex::Union{Int, Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int, JSFunction, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{Dict, Void} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct SankeySeries <: AbstractEChartSeries
    _type::String = "sankey"
    name::Union{String, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    left::Union{String, Int, Void} = nothing
    top::Union{String, Int, Void} = nothing
    right::Union{String, Int, Void} = nothing
    bottom::Union{String, Int, Void} = nothing
    width::Union{String, Int, Void} = nothing
    height::Union{String, Int, Void} = nothing
    nodeWidth::Union{Int, Void} = nothing
    nodeGap::Union{Int, Void} = nothing
    layout::Union{String, Void} = nothing
    layoutIterations::Union{Int, Void} = nothing
    label::Union{Label,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    lineStyle::Union{LineStyle,Void} = nothing
    emphasis::Union{ItemStyle,Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    nodes::Union{AbstractVector, Void} = nothing
    links::Union{AbstractVector, Void} = nothing
    edges::Union{AbstractVector, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int, JSFunction, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{Dict, Void} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct GraphSeries <: AbstractEChartSeries
    _type::String = "graph"
    name::Union{String,Void} = nothing
    legendHoverLink::Union{Bool,Void} = nothing
    coordinateSystem::Union{String,Void} = nothing
    xAxisIndex::Union{Int, Void} = nothing
    yAxisIndex::Union{Int, Void} = nothing
    polarIndex::Union{Int, Void} = nothing
    geoIndex::Union{Int, Void} = nothing
    calendarIndex::Union{Int, Void} = nothing
    hoverAnimation::Union{Bool, Void} = nothing
    layout::Union{String, Void} = nothing
    circular::Union{Dict, Void} = nothing
    force::Union{Dict, Void} = nothing
    roam::Union{Bool, Void} = nothing
    nodeScaleRatio::Union{AbstractFloat, Void} = nothing
    draggable::Union{Bool, Void} = nothing
    focusNodeAdjacency::Union{Bool, Void} = nothing
    symbol::Union{String, Void} = nothing
    symbolSize::Union{Int, Void} = nothing
    symbolRotate::Union{Int, Void} = nothing
    symbolOffset::Union{AbstractVector, Void} = nothing
    edgeSymbol::Union{AbstractVector, Void} = nothing
    edgeSymbolSize::Union{Int, Void} = nothing
    cursor::Union{String, Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    lineStyle::Union{LineStyle,Void} = nothing
    label::Union{Label,Void} = nothing
    edgeLabel::Union{ItemStyle,Void} = nothing
    emphasis::Union{ItemStyle,Void} = nothing
    categories::Union{AbstractVector, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    nodes::Union{AbstractVector, Void} = nothing
    links::Union{AbstractVector, Void} = nothing
    edges::Union{AbstractVector, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    left::Union{String, Void} = nothing
    top::Union{String, Void} = nothing
    right::Union{String, Void} = nothing
    bottom::Union{String, Void} = nothing
    width::Union{Int, String, Void} = nothing
    height::Union{Int, String, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int, JSFunction, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{Dict, Void} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct LinesSeries <: AbstractEChartSeries
    _type::String = "lines"
    name::Union{String, Void} = nothing
    coordinateSystem::Union{String, Void} = nothing
    xAxisIndex::Union{Int, Void} = nothing
    yAxisIndex::Union{Int, Void} = nothing
    geoIndex::Union{Int, Void} = nothing
    polyline::Union{Bool, Void} = nothing
    effect::Union{Dict, Void} = nothing
    large::Union{Bool, Void} = nothing
    largeThreshold::Union{Int, Void} = nothing
    symbol::Union{String, Void} = nothing
    symbolSize::Union{Int, Void} = nothing
    lineStyle::Union{LineStyle, Void} = nothing
    label::Union{Label, Void} = nothing
    emphasis::Union{LineStyle, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int, JSFunction, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{Dict, Void} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Void} = nothing
end
@with_kw mutable struct ParallelSeries <: AbstractEChartSeries
    _type::String = "parallel"
    coordinateSystem::Union{String, Void} = nothing
    parallelIndex::Union{Int, Void} = nothing
    name::Union{String, Void} = nothing
    lineStyle::Union{LineStyle, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    inactiveOpacity::Union{AbstractFloat, Void} = nothing
    activeOpacity::Union{Int, Void} = nothing
    realtime::Union{Bool, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{String, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{String, Void} = nothing
    animationDelayUpdate::Union{Int, Void} = nothing
end
@with_kw mutable struct MapSeries <: AbstractEChartSeries
    _type::String = "map"
    name::Union{String, Void} = nothing
    map::Union{String, Void} = nothing
    roam::Union{Bool, Void} = nothing
    center::Union{AbstractVector, Void} = nothing
    aspectScale::Union{AbstractFloat, Void} = nothing
    boundingCoords::Union{AbstractVector, Void} = nothing
    zoom::Union{AbstractFloat, Void} = nothing
    scaleLimit::Union{ScaleLimit, Void} = nothing
    nameMap::Union{Dict, Void} = nothing
    selectedMode::Union{Bool, Void} = nothing
    label::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    left::Union{String, Void} = nothing
    top::Union{String, Void} = nothing
    right::Union{String, Void} = nothing
    bottom::Union{String, Void} = nothing
    layoutCenter::Union{AbstractVector, Void} = nothing
    layoutSize::Union{String, Real, Void} = nothing
    geoIndex::Union{Int, Void} = nothing
    mapValueCalculation::Union{String, Void} = nothing
    showLegendSymbol::Union{Bool, Void} = nothing
    seriesLayoutBy::Union{String, Void} = nothing
    datasetIndex::Union{Int, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    silent::Union{Bool, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct HeatmapSeries <: AbstractEChartSeries
    _type::String = "heatmap"
    name::Union{String, Void} = nothing
    coordinateSystem::Union{String, Void} = nothing
    xAxisIndex::Union{Int, Void} = nothing
    yAxisIndex::Union{Int, Void} = nothing
    geoIndex::Union{Int, Void} = nothing
    calendarIndex::Union{Int, Void} = nothing
    blurSize::Union{Int, Void} = nothing
    minOpacity::Union{Int, Void} = nothing
    maxOpacity::Union{Int, Void} = nothing
    label::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    silent::Union{Bool, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct CandleStickSeries <: AbstractEChartSeries
    _type::String = "candlestick"
    coordinateSystem::Union{String, Void} = nothing
    xAxisIndex::Union{Int, Void} = nothing
    yAxisIndex::Union{Int, Void} = nothing
    name::Union{String, Void} = nothing
    legendHoverLink::Union{Bool, Void} = nothing
    hoverAnimation::Union{Bool, Void} = nothing
    layout::Union{String, Void} = nothing
    barWidth::Union{Int, Void} = nothing
    barMinWidth::Union{Int, Void} = nothing
    barMaxWidth::Union{Int, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    dimensions::Union{AbstractVector, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    encode::Union{Dict, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{JSFunction, String, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct SunburstSeries <: AbstractEChartSeries
    _type::String = "sunburst"
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    center::Union{AbstractVector, Void} = nothing
    radius::Union{AbstractVector, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    label::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    highlightPolicy::Union{String, Void} = nothing
    nodeClick::Union{String, Void} = nothing
    sort::Union{String, Void} = nothing
    renderLabelForZeroData::Union{Bool, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    highlight::Union{Dict, Void} = nothing
    downplay::Union{Dict, Void} = nothing
    levels::Union{AbstractVector, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{String, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{String, Void} = nothing
    animationDelayUpdate::Union{Int, Void} = nothing
end
@with_kw mutable struct TreemapSeries <: AbstractEChartSeries
    _type::String = "treemap"
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    left::Union{String, Void} = nothing
    top::Union{String, Void} = nothing
    right::Union{String, Void} = nothing
    bottom::Union{String, Void} = nothing
    width::Union{String, Void} = nothing
    height::Union{String, Void} = nothing
    breadcrumb::Union{Dict, Void} = nothing
    squareRatio::Union{Number, Void} = nothing
    leafDepth::Union{Int,Void} = nothing
    drillDownIcon::Union{String, Void} = nothing
    roam::Union{Bool, String, Void} = nothing
    nodeClick::Union{Bool, String, Void} = nothing
    zoomToNodeRatio::Union{Number, Void} = nothing
    levels::Union{AbstractVector, Void} = nothing
    silent::Union{Dict, Void} = nothing
    visualDimension::Union{Number, AbstractVector, Void} = nothing
    visualMin::Union{Number, Void} = nothing
    visualMax::Union{Number, Void} = nothing
    colorAlpha::Union{AbstractVector, Void} = nothing
    colorSaturation::Union{Number, Void} = nothing
    colorMappingBy::Union{String,Void} = nothing
    visibleMin::Union{Number, Void} = nothing
    childrenVisibleMin::Union{Number, Void} = nothing
    label::Union{Label, Void} = nothing
    upperLabel::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{String, JSFunction, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct TreeSeries <: AbstractEChartSeries
    _type::String = "tree"
    name::Union{String, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    left::Union{String, Void} = nothing
    top::Union{String, Void} = nothing
    right::Union{String, Void} = nothing
    bottom::Union{String, Void} = nothing
    width::Union{Int, String, Void} = nothing
    height::Union{Int, String, Void} = nothing
    layout::Union{String, Void} = nothing
    orient::Union{String, Void} = nothing
    symbol::Union{String, Void} = nothing
    symbolSize::Union{Int, Void} = nothing
    symbolRotate::Union{Int, Void} = nothing
    symbolOffset::Union{AbstractVector, Void} = nothing
    expandAndCollapse::Union{Bool, Void} = nothing
    initialTreeDepth::Union{Int, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    label::Union{Label, Void} = nothing
    lineStyle::Union{LineStyle, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct EffectScatterSeries <: AbstractEChartSeries
    _type::String = "effectScatter"
    name::Union{String, Void} = nothing
    legendHoverLink::Union{Bool, Void} = nothing
    effectType::Union{String, Void} = nothing
    showEffectOn::Union{String, Void} = nothing
    rippleEffect::Union{Dict, Void} = nothing
    coordinateSystem::Union{String, Void} = nothing
    xAxisIndex::Union{Int, Void} = nothing
    yAxisIndex::Union{Int, Void} = nothing
    polarIndex::Union{Int, Void} = nothing
    geoIndex::Union{Int, Void} = nothing
    calendarIndex::Union{Int, Void} = nothing
    symbol::Union{String, Void} = nothing
    symbolSize::Union{Int, Void} = nothing
    symbolRotate::Union{Int, Void} = nothing
    symbolOffset::Union{AbstractVector, Void} = nothing
    cursor::Union{String, Void} = nothing
    label::Union{Label, Void} = nothing
    itemStyle::Union{ItemStyle, Void} = nothing
    dimensions::Union{AbstractVector, Void} = nothing
    encode::Union{Dict, Void} = nothing
    emphasis::Union{ItemStyle, Void} = nothing
    seriesLayoutBy::Union{String, Void} = nothing
    datasetIndex::Union{Int, Void} = nothing
    data::Union{AbstractVector, Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = nothing
    markArea::Union{MarkArea, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    silent::Union{Bool, Void} = nothing
    animation::Union{Bool, Void} = nothing
    animationThreshold::Union{Int, Void} = nothing
    animationDuration::Union{Int, Void} = nothing
    animationEasing::Union{String, JSFunction, Void} = nothing
    animationDelay::Union{Int, Void} = nothing
    animationDurationUpdate::Union{Int, Void} = nothing
    animationEasingUpdate::Union{String, JSFunction, Void} = nothing
    animationDelayUpdate::Union{Int, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw mutable struct XYSeries <: AbstractEChartSeries
    #line
    _type::Union{String,Void} = nothing
    name::Union{String,Void} = nothing
    coordinateSystem::Union{String,Void} = nothing
    xAxisIndex::Int = 0
    yAxisIndex::Int = 0
    polarIndex::Union{Int, Void} = nothing
    symbol::Union{String, Void} = nothing
    symbolSize::Union{Number, AbstractVector,JSFunction,Void} = nothing
    symbolRotate::Union{Int, Void} = nothing
    symbolOffset::Union{AbstractVector, Void} = nothing
    showSymbol::Union{Bool,Void} = nothing
    showAllSymbol::Union{Bool,Void} = nothing
    hoverAnimation::Union{Bool,Void} = nothing
    legendHoverLink::Union{Bool,Void} = nothing
    stack::Union{Int,String,Void} = nothing
    clipOverflow::Union{Bool,Void} = nothing
    connectNulls::Union{Bool,Void} = nothing
    step::Union{String,Void} = nothing
    label::Union{Label,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    lineStyle::Union{ItemStyle,Void} = nothing
    areaStyle::Union{ItemStyle,Void} = nothing
    smooth::Union{Bool,Void} = false
    smoothMonotone::Union{String,Void} = nothing
    sampling::Union{String,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    markPoint::Union{MarkPoint, Void} = nothing
    markLine::Union{MarkLine, Void} = MarkLine()
    markArea::Union{MarkArea, Void} = nothing
    zlevel::Union{Int, Void} = nothing
    z::Union{Int, Void} = nothing
    animation::Union{Bool,Void} = nothing
    animationThreshold::Union{Int,Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int, JSFunction, Void} = nothing
    animationDurationUpdate::Union{Int,JSFunction, Void} = nothing
    animationEasingUpdate::Union{String,Void} = nothing
    animationDelayUpdate::Union{Int, JSFunction, Void} = nothing
    tooltip::Union{Tooltip, Void} = nothing
    #bar
    barWidth::Union{Int, Void} = nothing
    barMaxWidth::Union{Int, String, Void} = nothing
    barMinHeight::Union{Int, Void} = nothing
    barGap::Union{String, Int, Void} = nothing
    barCategoryGap::Union{String, Int, Void} = nothing
    #scatter
    geoIndex::Union{Int, Void} = nothing
    large::Union{Bool, Void} = nothing
    largeThreshold::Union{Int, Void} = nothing
end
@with_kw mutable struct EChart <: AbstractEChartType
    #fields prefixed with ec_ are ECharts.jl internal, no effect on echarts.js
    ec_width::Int = 800
    ec_height::Int = 400
    ec_renderer::String = "canvas" #svg
    ec_charttype::Union{String,Void} = nothing
    theme::Theme = roma #required for chart to render
    title::Union{Vector{Title},Void} = [Title()]
    legend::Union{Legend,Void} = nothing   #Already has legend! defined, need to modify legend! if change default here
    grid::Union{Array{Grid},Void} = [Grid()]
    xAxis::Union{Array{Axis,1},Void} = nothing
    yAxis::Union{Array{Axis,1},Void} = nothing
    polar::Union{Vector{Polar}, Polar, Void} = nothing
    radiusAxis::Union{RadiusAxis,Void} = nothing
    angleAxis::Union{AngleAxis,Void} = nothing
    radar::Union{Vector{Radar},Void} = nothing
    dataZoom::Union{Vector{DataZoom},Void} = nothing
    visualMap::Union{VisualMap,Void} = nothing  #typedef needs to be filled out
    tooltip::Union{Tooltip,Void} = Tooltip()
    axisPointer::Union{AxisPointer, Void} = nothing
    toolbox::Union{Toolbox,Void} = Toolbox()
    brush::Union{Brush, Void} = nothing
    geo::Union{Geo,Void} = nothing
    parallel::Union{Parallel,Void} = nothing
    parallelAxis::Union{ParallelAxis,Void} = nothing
    singleAxis::Union{SingleAxis,Void} = nothing
    timeline::Union{Timeline,Void} = nothing
    graphic::Union{Graphic,Void} = nothing
    calendar::Union{Calendar,Void} = nothing
    dataset::Union{Dataset, Void} = nothing
    aria::Union{Aria, Void} = Aria()
    series::Union{AbstractVector{<:AbstractEChartSeries},Void} = nothing
    color::Union{AbstractVector,JSFunction,Void} = nothing
    backgroundColor::Union{String,Void, JSFunction} = nothing
    textStyle::Union{TextStyle,Void} = nothing
    animation::Union{Bool,Void} = nothing
    animationThreshold::Union{Int,Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int,Void} = nothing
    animationDurationUpdate::Union{Int,Void} = nothing
    animationEasingUpdate::Union{String,Void} = nothing
    animationDelayUpdate::Union{Int,Void} = nothing
    progressive::Any = nothing
    progressiveThreshold::Any = nothing
    blendMode::Any = nothing
    hoverLayerThreshold::Any = nothing
    useUTC::Union{Bool, Void} = nothing
end
