abstract AbstractEChartType

@with_kw type Theme <: AbstractEChartType
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

function defaulttheme()
        Theme(
        color = [
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
        backgroundColor = "rgba(0,0,0,0)",
        textStyle = Dict(),
        title = Dict(
            "textStyle" => Dict("color" => "#333333"),
            "subtextStyle" => Dict("color" => "#aaaaaa")
        ),
        line = Dict(
            "itemStyle" => Dict("normal" => Dict("borderWidth" => 1)),
            "lineStyle" => Dict("normal" => Dict("width" => 2)),
            "symbolSize" => 4,
            "symbol" => "emptyCircle",
            "smooth" => false
        ),
        radar = Dict(
            "itemStyle" => Dict("normal" => Dict("borderWidth" => 1)),
            "lineStyle" => Dict("normal"=> Dict("width" => 2)),
            "symbolSize" => 4,
            "symbol" => "emptyCircle",
            "smooth" => false
        ),
        bar = Dict(
            "itemStyle" => Dict(
                "normal" => Dict("barBorderWidth" => 0, "barBorderColor" => "#ccc"),
                "emphasis" => Dict("barBorderWidth" => 0,"barBorderColor" => "#ccc")
            )
        ),
        pie = Dict(
            "itemStyle" => Dict(
                "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc"),
                "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
            )
        ),
        scatter = Dict(
            "itemStyle" => Dict(
                "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc"),
                "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
            )
        ),
        boxplot = Dict(
            "itemStyle" => Dict(
                "normal" => Dict("borderWidth" => 1),
                "emphasis" => Dict("borderWidth" => 2)
            )
        ),
        parallel = Dict(
            "itemStyle" => Dict(
                "normal" => Dict("borderWidth" => 0, "borderColor" => "#ccc"),
                "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
            )
        ),
        sankey = Dict(
            "itemStyle" => Dict(
                "normal" => Dict("borderWidth" => 0, "borderColor" => "#ccc"),
                "emphasis" => Dict("borderWidth" => 0, "borderColor" => "#ccc")
            )
        ),
        funnel = Dict(
            "itemStyle" => Dict(
                "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc"),
                "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
            )
        ),
        gauge = Dict(
            "itemStyle" => Dict(
                "normal" => Dict("borderWidth" => 0,"borderColor" => "#ccc"),
                "emphasis" => Dict("borderWidth" => 0,"borderColor" => "#ccc")
            )
        ),
        candlestick = Dict(
            "itemStyle" => Dict(
                "normal" => Dict(
                    "color" => "#e01f54",
                    "color0" => "#001852",
                    "borderColor" => "#f5e8c8",
                    "borderColor0" => "#b8d2c7",
                    "borderWidth" => 1
                )
            )
        ),
        graph = Dict(
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
        ),
        map = Dict(
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
        ),
        geo = Dict(
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
        ),
        categoryAxis = Dict(
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
        ),
        valueAxis = Dict(
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
        ),
        logAxis = Dict(
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
        ),
        timeAxis = Dict(
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
        ),
        toolbox = Dict(
            "iconStyle" => Dict(
                "normal" => Dict(
                    "borderColor" => "#999999"
                ),
                "emphasis" => Dict(
                    "borderColor" => "#666666"
                )
            )
        ),
        legend = Dict(
            "textStyle" => Dict(
                "color" => "#333333"
            )
        ),
        tooltip = Dict(
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
        ),
        timeline = Dict(
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
        ),
        visualMap = Dict(
            "color" => [
                "#e01f54",
                "#e7dbc3"
            ]
        ),
        dataZoom = Dict(
            "backgroundColor" => "rgba(47,69,84,0)",
            "dataBackgroundColor" => "rgba(47,69,84,0.3)",
            "fillerColor" => "rgba(167,183,204,0.4)",
            "handleColor" => "#a7b7cc",
            "handleSize" => "100%",
            "textStyle" => Dict(
                "color" => "#333333"
            )
        ),
        markPoint = Dict(
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
    )
end
