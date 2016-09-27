abstract AbstractEChartType

@with_kw type LineStyle <: AbstractEChartType
    color::Union{AbstractVector,String,Void} = "#333"
    width::Union{Int,Void} = 1
    _type::Union{String,Void} = "solid"
    shadowBlur::Union{Int,Void} = 1
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Int,Void} = nothing
end
@with_kw type AreaStyle <: AbstractEChartType
    color::Union{AbstractVector,Void} = nothing
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Number,Void} = nothing
end
@with_kw type TextStyle <: AbstractEChartType
    color::Union{String,Void} = "#000"
    fontStyle::Union{String,Void} = "normal"
    fontWeight::Union{String,Void} = "normal"
    fontFamily::Union{String,Void} = "sans-serif"
    fontSize::Union{Int,Void} = 12
end
@with_kw type SplitArea <: AbstractEChartType
    interval::Union{Int,String,Void} = "auto"
    show::Union{Bool,Void} = true
    areaStyle::Union{AreaStyle,Void} = nothing
end
@with_kw type SplitLine <: AbstractEChartType
    show::Union{Bool,Void} = true
    interval::Union{Int,String,Void} = "auto"
    lineStyle::Union{LineStyle,Void} = nothing
end
@with_kw type AxisLabel <: AbstractEChartType
    show::Union{Bool,Void} = true
    interval::Union{Int,String,Void} = "auto"
    inside::Union{Bool,Void} = false
    rotate::Union{Int,Void} = 0
    margin::Union{Int,Void} = 8
    formatter::Union{String,Void} = nothing
    textStyle::Union{TextStyle,Void} = nothing
end
@with_kw type AxisLine <: AbstractEChartType
    show::Union{Bool,Void} = true
    onZero::Union{Bool,Void} = true
    lineStyle::Union{LineStyle,Void} = LineStyle()
end
@with_kw type AxisTick <: AbstractEChartType
    show::Union{Bool,Void} = true
    interval::Union{Int,String,Void} = "auto"
    inside::Union{Bool,Void} = false
    length::Union{Int,Void} = 5
    lineStyle::Union{LineStyle,Void} = LineStyle()
end
@with_kw type LabelOpts <: AbstractEChartType
    show::Union{Bool,Void} = false
    textStyle::Union{TextStyle,Void} = nothing
end
@with_kw type Label <: AbstractEChartType
    normal::Union{LabelOpts,Void} = nothing
    emphasis::Union{LabelOpts,Void} = nothing
end
@with_kw type ItemStyleOpts <: AbstractEChartType
    color::Union{String,Void} = "adaptive"
    barBorderColor::Union{String,Void} = nothing
    borderColor::Union{String,Void} = "#000"
    borderWidth::Union{Int,Void} = 0
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Int,Void} = nothing
end
@with_kw type ItemStyle <: AbstractEChartType
    normal::Any = nothing
    emphasis::Any = nothing
end
@with_kw type IconStyleOpts <: AbstractEChartType
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
@with_kw type IconStyle <: AbstractEChartType
    normal::Union{ItemStyleOpts,Void} = nothing
    emphasis::Union{ItemStyleOpts,Void} = nothing
end
@with_kw type CrossStyle <: AbstractEChartType
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
@with_kw type ShadowStyle <: AbstractEChartType
    color::Union{String,Void} = "rgba(150,150,150,0.5)"
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Number,Void} = 0
end
@with_kw type AxisPointer <: AbstractEChartType
    _type::Union{String,Void} = "line"
    axis::Union{String,Void} = "auto"
    animation::Union{Bool,Void} = "auto"
    animationThreshold::Union{Int,Void} = 2000
    animationDuration::Union{Int,Void} = 1000
    animationDelay::Union{Int,Void} = 1000
    animationDurationUpdate::Union{Int,Void} = 300
    animationEasingUpdate::Union{String,Void} = "cubicOut"
    animationDelayUpdate::Union{Int,Void} = 0
    lineStyle::Union{LineStyle,Void} = nothing
    crossStyle::Union{CrossStyle,Void} = nothing
    shadowStyle::Union{ShadowStyle,Void} = nothing
end
@with_kw type Tooltip <: AbstractEChartType
    show::Union{Bool,Void} = true
    showContent::Union{Bool,Void} = true
    trigger::Union{String,Void} = "item"
    triggerOn::Union{String,Void} = "mousemove"
    alwaysShowContent::Union{Bool,Void} = false
    showDelay::Union{Int,Void} = 0
    hideDelay::Union{Int,Void} = 100
    enterable::Union{Bool,Void} = true
    position::Union{AbstractVector,String,Void} = nothing
    transitionDuration::Union{Number,Void} = 0.4
    formatter::Union{String,Void} = nothing
    backgroundColor::Union{String,Void} = "rgba(50,50,50,0.7)"
    borderColor::Union{String,Void} = "#333"
    borderWidth::Union{Int,Void} = 0
    padding::Union{Int,Void} = 5
    textStyle::Union{TextStyle,Void} = "#fff"
    extraCssText::Union{String,Void} = nothing
    axisPointer::Union{AxisPointer,Void} = nothing
end
@with_kw type Legend <: AbstractEChartType
    show::Union{Bool,Void} = true
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = "auto"
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
    formatter::Union{String,Void} = nothing
    selectedMode::Union{Bool,String,Void} = true
    selected::Union{Dict{String,Bool},Void} = nothing
    textStyle::Union{TextStyle,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    backgroundColor::Union{String,Void} = "transparent"
    borderColor::Union{String,Void} = "#ccc"
    borderWidth::Union{Int,Void} = 1
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
end
@with_kw type Toolbox <: AbstractEChartType
    show::Union{Bool,Void} = false
    orient::Union{String,Void} = "vertical"
    itemGap::Union{Number,Void} = 10
    itemSize::Union{Number,Void} = 15
    feature::Union{Dict{Any,Any},Void} = Dict{Any,Any}()
    showTitle::Union{Bool,Void} = true
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    iconStyle::Union{IconStyle,Void} = nothing
    left::Union{Number,String,Void} = nothing
    top::Union{Number,String,Void} = "center"
    right::Union{Number,String,Void} = "auto"
    bottom::Union{Number,String,Void} = nothing
    width::Union{Number,String,Void} = "auto"
    height::Union{Number,String,Void} = "auto"
end
@with_kw type Axis <: AbstractEChartType
    gridIndex::Union{Int,Void} = 0
    position::Union{String,Void} = nothing
    _type::Union{String,Void} = nothing
    name::Union{String,Void} = nothing
    nameLocation::Union{String,Void} = "start"
    nameTextStyle::Union{TextStyle,Void} = nothing
    nameGap::Union{Int,Void} = 15
    inverse::Union{Bool,Void} = false
    boundaryGap::Union{AbstractVector,Bool,Void} = nothing
    min::Union{Int,String,Void} = nothing
    max::Union{Int,String,Void} = nothing
    scale::Union{Bool,Void} = false
    splitNumber::Union{Int,Void} = 5
    minInterval::Union{Int,Void} = 0
    interval::Union{Int,Void} = nothing
    silent::Union{Bool,Void} = true
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
end
@with_kw type Title <: AbstractEChartType
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
    backgroundColor::Union{String,Void} = nothing
    borderColor::Union{String,Void} = "transparent"
    borderWidth::Union{Int,Void} = 1
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
end
@with_kw type Grid <: AbstractEChartType
    show::Union{Bool,Void} = false
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = "auto"
    top::Union{Int,String,Void} = 60
    right::Union{Int,String,Void} = "10%"
    bottom::Union{Int,String,Void} = 60
    width::Union{Int,String,Void} = "auto"
    height::Union{Int,String,Void} = "auto"
    containLabel::Union{Bool,Void} = false
    backgroundColor::Union{String,Void} = "transparent"
    borderColor::Union{String,Void} = "#ccc"
    borderWidth::Union{Int,Void} = 1
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
end
@with_kw type DataZoom <: AbstractEChartType
    _type::Union{String,Void} = nothing
    start::Union{Number,Void} = 60
    _end::Union{Number,Void} = 80
end
@with_kw type Timeline <: AbstractEChartType
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
    symbolSize::Union{Array{Int,1},Int,Void} = 10
    symbolRotate::Union{Int,Void} = nothing
    symbolOffset::Union{Array{Int,1},Void} = [0,0]
    lineStyle::Union{LineStyle,Void} = nothing
    label::Union{Label,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    checkpointStyle::Union{Dict,Void} = nothing
    controlStyle::Union{Dict,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
end
@with_kw type Polar <: AbstractEChartType
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    center::Union{Array{String,1},Void} = String["50%","50%"]
    radius::Union{AbstractVector,Void} = nothing
end
@with_kw type RadiusAxis <: AbstractEChartType
    polarIndex::Union{Int,Void} = 0
    _type::Union{String,Void} = "value"
    name::Union{String,Void} = nothing
    nameLocation::Union{String,Void} = "start"
    nameTextStyle::Union{TextStyle,Void} = nothing
    nameGap::Union{Int,Void} = 15
    inverse::Union{Bool,Void} = false
    boundaryGap::Union{Array{String,1},Bool,Void} = nothing
    min::Union{Int,String,Void} = "auto"
    max::Union{Int,String,Void} = "auto"
    scale::Union{Bool,Void} = false
    splitNumber::Union{Int,Void} = 5
    minInterval::Union{Int,Void} = 0
    interval::Union{Int,Void} = nothing
    silent::Union{Bool,Void} = true
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
end
@with_kw type AngleAxis <: AbstractEChartType
    polarIndex::Union{Int,Void} = 0
    startAngle::Union{Int,Void} = 0
    clockwise::Union{Bool,Void} = true
    _type::Union{String,Void} = "category"
    boundaryGap::Union{AbstractVector,Bool,Void} = nothing
    min::Union{Int,String,Void} = "auto"
    max::Union{Int,String,Void} = "auto"
    scale::Union{Bool,Void} = false
    splitNumber::Union{Int,Void} = 5
    minInterval::Union{Int,Void} = 0
    interval::Union{Int,Void} = nothing
    silent::Union{Bool,Void} = true
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
end
@with_kw type Radar <: AbstractEChartType
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    center::Union{Array{String,1},Void} = String["50%","50%"]
    radius::Union{Int,String,Void} = "75%"
    startAngle::Union{Int,Void} = 90
    name::Union{Dict{Any,Any},Void} = nothing
    nameGap::Union{Int,Void} = 15
    silent::Union{Bool,Void} = true
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    indicator::Union{AbstractVector,Void} = nothing
end
@with_kw type VisualMap <: AbstractEChartType
    _type::Union{String,Void} = nothing
end
@with_kw type ScaleLimit <: AbstractEChartType
    min::Union{Int,Void} = nothing
    max::Union{Int,Void} = nothing
end
@with_kw type Geo <: AbstractEChartType
    show::Union{Bool,Void} = true
    map::Union{String,Void} = nothing
    roam::Union{Bool,Void} = false
    center::Union{Array{Number,1},Void} = nothing
    zoom::Union{Int,Void} = 1
    scaleLimit::Union{ScaleLimit,Void} = nothing
    nameMap::Union{Dict,Void} = nothing
    selectedMode::Union{Bool,Void} = false
    label::Union{Label,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = "auto"
    top::Union{Int,String,Void} = "auto"
    right::Union{Int,String,Void} = "auto"
    bottom::Union{Int,String,Void} = "auto"
    regions::Union{AbstractVector,Void} = nothing
    silent::Union{Bool,Void} = false
end
@with_kw type Parallel <: AbstractEChartType
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 2
    left::Union{Int,String,Void} = "auto"
    top::Union{Int,String,Void} = 60
    right::Union{Int,String,Void} = 80
    bottom::Union{Int,String,Void} = 60
    width::Union{Int,String,Void} = "auto"
    height::Union{Int,String,Void} = "auto"
    layout::Union{String,Void} = "horizontal"
    parallelAxisDefault::Union{Dict,Void} = nothing
end
@with_kw type AreaSelectStyle <: AbstractEChartType
    width::Union{Int,Void} = 20
    borderWidth::Union{Int,Void} = 1
    borderColor::Union{String,Void} = "rgba(160,197,232)"
    color::Union{String,Void} = "rgba(160,197,232)"
    opacity::Union{Number,Void} = 0.3
end
@with_kw type ParallelAxis <: AbstractEChartType
    dim::Union{Int,Void} = nothing
    parallelIndex::Union{Int,Void} = 0
    areaSelectStyle::Union{AreaSelectStyle,Void} = nothing
    _type::Union{String,Void} = "value"
    name::Union{String,Void} = nothing
    nameLocation::Union{String,Void} = "start"
    nameTextStyle::Union{TextStyle,Void} = "#fff"
    nameGap::Union{Int,Void} = 15
    inverse::Union{Bool,Void} = false
    boundaryGap::Union{AbstractVector,Bool,Void} = nothing
    min::Union{Int,String,Void} = "auto"
    max::Union{Int,String,Void} = "auto"
    scale::Union{Bool,Void} = false
    splitNumber::Union{Int,Void} = 5
    minInterval::Union{Int,Void} = 0
    interval::Union{Int,Void} = nothing
    silent::Union{Bool,Void} = true
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    data::Union{Dict,Void} = nothing
end
@with_kw type Series <: AbstractEChartType
    coordinateSystem::Union{String,Void} = nothing
    name::Union{String,Void} = nothing
    _type::Union{String,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    areaStyle::Union{ItemStyle,Void} = nothing
    smooth::Union{Bool,Void} = false
    radius::Union{AbstractVector,String,Void} = nothing
    center::Union{AbstractVector,String,Void} = nothing
    roseType::Union{String,Void} = nothing
    stack::Union{Int,String,Void} = nothing
    left::Union{String,Void} = nothing
    right::Union{String,Void} = nothing
    top::Union{Int,Void} = nothing
    bottom::Union{Int,Void} = nothing
    width::Union{String,Void} = nothing
    min::Union{Int,Void} = nothing
    max::Union{Int,Void} = nothing
    minSize::Union{String,Void} = "0%"
    maxSize::Union{String,Void} = "100%"
    sort::Union{String,Void} = nothing
    gap::Union{Int,Void} = nothing
    label::Union{Label,Void} = nothing
    labelLine::Union{Dict,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    showSymbol::Union{Bool,Void} = nothing
    symbolSize::Union{Number, AbstractVector,Void} = nothing
    step::Union{String,Void} = nothing
end
@with_kw type EChart <: AbstractEChartType
    title::Union{Title,Void} = Title()
    legend::Union{Legend,Void} = nothing
    grid::Union{Grid,Void} = nothing
    xAxis::Union{Array{Axis,1},Void} = nothing
    yAxis::Union{Array{Axis,1},Void} = nothing
    polar::Union{Polar,Void} = nothing
    radiusAxis::Union{RadiusAxis,Void} = nothing
    angleAxis::Union{AngleAxis,Void} = nothing
    radar::Union{Radar,Void} = nothing
    dataZoom::Union{DataZoom,Void} = nothing
    visualMap::Union{VisualMap,Void} = nothing
    tooltip::Union{Tooltip,Void} = nothing
    toolbox::Union{Toolbox,Void} = Toolbox()
    geo::Union{Geo,Void} = nothing
    parallel::Union{Parallel,Void} = nothing
    parallelAxis::Union{ParallelAxis,Void} = nothing
    timeline::Union{Timeline,Void} = nothing
    series::Union{Array{Series,1},Void} = nothing
    color::Union{AbstractVector,Void} = nothing
    backgroundColor::Union{String,Void} = nothing
    textStyle::Union{TextStyle,Void} = nothing
    animation::Union{Bool,Void} = nothing
    animationDuration::Union{Int,Void} = nothing
    animationEasing::Union{String,Void} = nothing
    animationDelay::Union{Int,Void} = nothing
    animationDurationUpdate::Union{Int,Void} = nothing
    animationEasingUpdate::Union{String,Void} = nothing
    animationDelayUpdate::Union{Int,Void} = nothing
end
