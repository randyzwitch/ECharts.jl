abstract AbstractEChartType

@with_kw type Theme <: AbstractEChartType
    color::Union{AbstractVector, Void} = [
        "#e01f54",
        "#001852",
        "#f5e8c8",
        "#b8d2c7",
        "#c6b38e",
        "#a4d8c2",
        "#f3d999",
        "#d3758f",
        "#dcc392",
        "#2e4783",
        "#82b6e9",
        "#ff6347",
        "#a092f1",
        "#0a915d",
        "#eaf889",
        "#6699FF",
        "#ff6666",
        "#3cb371",
        "#d5b158",
        "#38b6b6"
    ]
    backgroundColor::Union{String, Void} = "rgba(0,0,0,0)"
    textStyle::Union{Dict, Void} = Dict()
    title::Union{Dict, Void} = Dict(
        "textStyle" => Dict("color" => "#333333"),
        "subtextStyle" => Dict("color" => "#aaaaaa")
    )
    line::Union{Dict, Void} = Dict(
        "itemStyle" => Dict("normal" => Dict("borderWidth" => 1)),
        "lineStyle" => Dict("normal" => Dict("width" => 2)),
        "symbolSize" => 4,
        "symbol" => "emptyCircle",
        "smooth" => false
    )
    radar::Union{Dict, Void} = Dict(
        "itemStyle" => Dict("normal" => Dict("borderWidth" => 1)),
        "lineStyle" => Dict("normal"=> Dict("width" => 2)),
        "symbolSize" => 4,
        "symbol" => "emptyCircle",
        "smooth" => false
    )
    bar::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("barBorderWidth" => 0, "barBorderColor" => "#ccc"),
            "emphasis" => Dict("barBorderWidth" => 0,"barBorderColor" => "#ccc")
        )
    )
    pie::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc"),
            "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
        )
    )
    scatter::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc"),
            "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
        )
    )
    boxplot::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("borderWidth" => 1),
            "emphasis" => Dict("borderWidth" => 2)
        )
    )
    parallel::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("borderWidth" => 0, "borderColor" => "#ccc"),
            "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
        )
    )
    sankey::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("borderWidth" => 0, "borderColor" => "#ccc"),
            "emphasis" => Dict("borderWidth" => 0, "borderColor" => "#ccc")
        )
    )
    funnel::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc"),
            "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
        )
    )
    gauge::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc"),
            "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
        )
    )
    candlestick::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict(
                "color" => "#e01f54",
                "color0" => "#001852",
                "borderColor" => "#f5e8c8",
                "borderColor0" => "#b8d2c7",
                "borderWidth" => 1
            )
        )
    )
    graph::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
        ),
        "lineStyle" => Dict(
            "normal" => Dict("width" => 1, "color" => "#aaaaaa")
        ),
        "symbolSize" => 4,
        "symbol" => "emptyCircle",
        "smooth" => false,
        "color" => [
            "#e01f54",
            "#001852",
            "#f5e8c8",
            "#b8d2c7",
            "#c6b38e",
            "#a4d8c2",
            "#f3d999",
            "#d3758f",
            "#dcc392",
            "#2e4783",
            "#82b6e9",
            "#ff6347",
            "#a092f1",
            "#0a915d",
            "#eaf889",
            "#6699FF",
            "#ff6666",
            "#3cb371",
            "#d5b158",
            "#38b6b6"
        ],
        "label" => Dict(
            "normal" => Dict("textStyle" => Dict("color" => "#eeeeee"))
        )
    )
    map::Union{Dict, Void} = Dict(
        "itemStyle" => Dict(
            "normal" => Dict(
                "areaColor" => "#eeeeee",
                "borderColor" => "#444444",
                "borderWidth" => 0.5
            ),
            "emphasis" => Dict(
                "areaColor" => "rgba(255,215,0,0.8)",
                "borderColor" => "#444444",
                "borderWidth" => 1
            )
        ),
        "label" => Dict(
            "normal" => Dict(
                "textStyle" => Dict(
                    "color" => "#000000"
                )
            ),
            "emphasis" => Dict(
                "textStyle" => Dict(
                    "color" => "rgb(100,0,0)"
                )
            )
        )
    )
    geo::Union{Dict, Void} = Dict(
        "itemStyle" =>  Dict(
            "normal" =>  Dict(
                "areaColor" =>  "#eeeeee",
                "borderColor" =>  "#444444",
                "borderWidth" =>  0.5
            ),
            "emphasis" =>  Dict(
                "areaColor" =>  "rgba(255,215,0,0.8)",
                "borderColor" =>  "#444444",
                "borderWidth" =>  1
            )
        ),
        "label" =>  Dict(
            "normal" =>  Dict(
                "textStyle" =>  Dict(
                    "color" =>  "#000000"
                )
            ),
            "emphasis" =>  Dict(
                "textStyle" =>  Dict(
                    "color" =>  "rgb(100,0,0)"
                )
            )
        )
    )
    categoryAxis::Union{Dict, Void} = Dict(
        "axisLine" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => "#333"
            )
        ),
        "axisTick" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => "#333"
            )
        ),
        "axisLabel" => Dict(
            "show" => true,
            "textStyle" => Dict(
                "color" => "#333"
            )
        ),
        "splitLine" => Dict(
            "show" => false,
            "lineStyle" => Dict(
                "color" => [
                    "#ccc"
                ]
            )
        ),
        "splitArea" => Dict(
            "show" => false,
            "areaStyle" => Dict(
                "color" => [
                    "rgba(250,250,250,0.3)",
                    "rgba(200,200,200,0.3)"
                ]
            )
        )
    )
    valueAxis::Union{Dict, Void} = Dict(
        "axisLine" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => "#333"
            )
        ),
        "axisTick" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => "#333"
            )
        ),
        "axisLabel" => Dict(
            "show" => true,
            "textStyle" => Dict(
                "color" => "#333"
            )
        ),
        "splitLine" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => [
                    "#ccc"
                ]
            )
        ),
        "splitArea" => Dict(
            "show" => false,
            "areaStyle" => Dict(
                "color" => [
                    "rgba(250,250,250,0.3)",
                    "rgba(200,200,200,0.3)"
                ]
            )
        )
    )
    logAxis::Union{Dict, Void} = Dict(
        "axisLine" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => "#333"
            )
        ),
        "axisTick" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => "#333"
            )
        ),
        "axisLabel" => Dict(
            "show" => true,
            "textStyle" => Dict(
                "color" => "#333"
            )
        ),
        "splitLine" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => [
                    "#ccc"
                ]
            )
        ),
        "splitArea" => Dict(
            "show" => false,
            "areaStyle" => Dict(
                "color" => [
                    "rgba(250,250,250,0.3)",
                    "rgba(200,200,200,0.3)"
                ]
            )
        )
    )
    timeAxis::Union{Dict, Void} = Dict(
        "axisLine" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => "#333"
            )
        ),
        "axisTick" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => "#333"
            )
        ),
        "axisLabel" => Dict(
            "show" => true,
            "textStyle" => Dict(
                "color" => "#333"
            )
        ),
        "splitLine" => Dict(
            "show" => true,
            "lineStyle" => Dict(
                "color" => [
                    "#ccc"
                ]
            )
        ),
        "splitArea" => Dict(
            "show" => false,
            "areaStyle" => Dict(
                "color" => [
                    "rgba(250,250,250,0.3)",
                    "rgba(200,200,200,0.3)"
                ]
            )
        )
    )
    toolbox::Union{Dict, Void} = Dict(
        "iconStyle" => Dict(
            "normal" => Dict(
                "borderColor" => "#999999"
            ),
            "emphasis" => Dict(
                "borderColor" => "#666666"
            )
        )
    )
    legend = Dict(
        "textStyle" => Dict(
            "color" => "#333333"
        )
    )
    tooltip::Union{Dict, Void} = Dict(
        "axisPointer" => Dict(
            "lineStyle" => Dict(
                "color" => "#cccccc",
                "width" => 1
            ),
            "crossStyle" => Dict(
                "color" => "#cccccc",
                "width" => 1
            )
        )
    )
    timeline::Union{Dict, Void} = Dict(
        "lineStyle" => Dict(
            "color" => "#293c55",
            "width" => 1
        ),
        "itemStyle" => Dict(
            "normal" => Dict(
                "color" => "#293c55",
                "borderWidth" => 1
            ),
            "emphasis" => Dict(
                "color" => "#a9334c"
            )
        ),
        "controlStyle" => Dict(
            "normal" => Dict(
                "color" => "#293c55",
                "borderColor" => "#293c55",
                "borderWidth" => 0.5
            ),
            "emphasis" => Dict(
                "color" => "#293c55",
                "borderColor" => "#293c55",
                "borderWidth" => 0.5
            )
        ),
        "checkpointStyle" => Dict(
            "color" => "#e43c59",
            "borderColor" => "rgba(194,53,49,0.5)"
        ),
        "label" => Dict(
            "normal" => Dict(
                "textStyle" => Dict(
                    "color" => "#293c55"
                )
            ),
            "emphasis" => Dict(
                "textStyle" => Dict(
                    "color" => "#293c55"
                )
            )
        )
    )
    visualMap::Union{Dict, Void} = Dict(
        "color" => [
            "#e01f54",
            "#e7dbc3"
        ]
    )
    dataZoom::Union{Dict, Void} = Dict(
        "backgroundColor" => "rgba(47,69,84,0)",
        "dataBackgroundColor" => "rgba(47,69,84,0.3)",
        "fillerColor" => "rgba(167,183,204,0.4)",
        "handleColor" => "#a7b7cc",
        "handleSize" => "100%",
        "textStyle" => Dict(
            "color" => "#333333"
        )
    )
    markPoint::Union{Dict, Void} = Dict(
        "label" => Dict(
            "normal" => Dict(
                "textStyle" => Dict(
                    "color" => "#eeeeee"
                )
            ),
            "emphasis" => Dict(
                "textStyle" => Dict(
                    "color" => "#eeeeee"
                )
            )
        )
    )
end
@with_kw type LineStyle <: AbstractEChartType
    color::Union{AbstractVector,String,Void} = "#333"
    width::Union{Int,Void} = 1
    _type::Union{String,Void} = "solid"
    shadowBlur::Union{Int,Void} = 1
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
    opacity::Union{Int,Void} = nothing
    curveness::Union{AbstractFloat,Void} = nothing
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
    formatter::Union{String,Void, JSFunction} = nothing
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
@with_kw type AxisPointerLabel <: AbstractEChartType
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
@with_kw type AxisPointer <: AbstractEChartType
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
@with_kw type Tooltip <: AbstractEChartType
    show::Union{Bool,Void} = false
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
    textStyle::Union{TextStyle,Void} = "#fff"
    extraCssText::Union{String,Void} = nothing
end
@with_kw type Legend <: AbstractEChartType
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
end
@with_kw type Toolbox <: AbstractEChartType
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
@with_kw type Brush <: AbstractEChartType
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
@with_kw type Axis <: AbstractEChartType
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
    axisLabel::Union{AxisLabel,Void} = nothing
    splitLine::Union{SplitLine,Void} = nothing
    splitArea::Union{SplitArea,Void} = nothing
    data::Union{AbstractVector,Void} = nothing
    axisPointer::Union{AxisPointer, Void} = nothing
    zlevel::Union{Int,Void} = 0
    z::Union{Int,Void} = 0
end
@with_kw type Title <: AbstractEChartType
    show::Union{Bool,Void} = true
    text::Union{String,Void} = nothing
    link::Union{String,Void} = nothing
    target::Union{String,Void} = "blank"
    textStyle::Union{TextStyle,Void} = nothing
    textAlign::Union{String,Void} = nothing
    textBaseline::Union{String,Void} = nothing
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
    shadowBlur::Union{Int,Void} = nothing
    shadowColor::Union{String,Void} = nothing
    shadowOffsetX::Union{Int,Void} = 0
    shadowOffsetY::Union{Int,Void} = 0
end
@with_kw type Grid <: AbstractEChartType
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
@with_kw type DataZoom <: AbstractEChartType
    _type::Union{String,Void} = nothing
    show::Bool = false
    start::Union{Number,Void} = nothing
    _end::Union{Number,Void} = nothing
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
    symbolSize::Union{Array{Int,1},Int,JSFunction,Void} = 10
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
    tooltip::Union{Tooltip, Void} = nothing
end
@with_kw type RadiusAxis <: AbstractEChartType
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
@with_kw type Radar <: AbstractEChartType
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
#Needs to be fleshed out
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
    aspectScale::Union{Number, Void} = nothing
    boundingCoords::Union{AbstractArray, Void} = nothing
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
    layoutCenter::Union{Array{Number,1},Void} = nothing
    layoutSize::Union{Number,String,Void} = nothing
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
    axisExpandable::Union{Bool, Void} = nothing
    axisExpandCenter::Union{Number, Void} = nothing
    axisExpandCount::Union{Number, Void} = nothing
    axisExpandWidth::Union{Number, Void} = nothing
    axisExpandTriggerOn::Union{String, Void} = nothing
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
    interval::Union{Int,Void} = nothing
    logBase::Union{Int,Void} = nothing
    silent::Union{Bool,Void} = true
    triggerEvent::Union{Bool,Void} = nothing
    axisLine::Union{AxisLine,Void} = nothing
    axisTick::Union{AxisTick,Void} = nothing
    axisLabel::Union{AxisLabel,Void} = nothing
    data::Union{Dict,Void} = nothing
end
@with_kw type SingleAxis <: AbstractEChartType
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
@with_kw type Graphic <: AbstractEChartType
    tbd::Any = nothing
end
@with_kw type Calendar <: AbstractEChartType
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
#Need to validate for all types
#Make individual series types like echarts.js?
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
    minSize::Union{String,Void} = nothing
    maxSize::Union{String,Void} = nothing
    sort::Union{String,Void} = nothing
    gap::Union{Int,Void} = nothing
    label::Union{Label,Void} = nothing
    labelLine::Union{Dict,Void} = nothing
    itemStyle::Union{ItemStyle,Void} = nothing
    lineStyle::Union{ItemStyle,Void} = nothing
    showSymbol::Union{Bool,Void} = nothing
    symbolSize::Union{Number, AbstractVector,JSFunction,Void} = nothing
    step::Union{String,Void} = nothing
    layout::Union{String,Void} = nothing
    links::Union{AbstractVector,Void} = nothing
    funnelAlign::Union{String,Void} = nothing
    xAxisIndex::Int = 0
    yAxisIndex::Int = 0
end
@with_kw type EChart <: AbstractEChartType
    ec_width::Int = 800  #ECharts.jl internal, no effect on echarts.js
    ec_height::Int = 400  #ECharts.jl internal, no effect on echarts.js
    ec_charttype::Union{String,Void} = nothing  #ECharts.jl internal, no effect on echarts.js
    theme::Theme = Theme() #required for chart to render
    title::Union{Vector{Title},Void} = [Title()]
    legend::Union{Legend,Void} = nothing   #Already has legend! defined, need to modify legend! if change default here
    grid::Union{Array{Grid},Void} = [Grid()]
    xAxis::Union{Array{Axis,1},Void} = nothing
    yAxis::Union{Array{Axis,1},Void} = nothing
    polar::Union{Vector{Polar},Void} = nothing
    radiusAxis::Union{RadiusAxis,Void} = nothing
    angleAxis::Union{AngleAxis,Void} = nothing
    radar::Union{Vector{Radar},Void} = nothing
    dataZoom::Union{Vector{DataZoom},Void} = nothing  #typedef needs to be filled out
    visualMap::Union{VisualMap,Void} = nothing  #typedef needs to be filled out
    tooltip::Union{Tooltip,Void} = nothing
    axisPointer::Union{AxisPointer, Void} = nothing
    toolbox::Union{Toolbox,Void} = Toolbox()
    geo::Union{Geo,Void} = nothing
    parallel::Union{Parallel,Void} = nothing
    parallelAxis::Union{ParallelAxis,Void} = nothing
    singleAxis::Union{SingleAxis,Void} = nothing
    timeline::Union{Timeline,Void} = nothing
    graphic::Union{Graphic,Void} = nothing
    calendar::Union{Calendar,Void} = nothing
    series::Union{Array{Series,1},Void} = nothing
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
    useUTC::Union{Bool, Void} = nothing
end
