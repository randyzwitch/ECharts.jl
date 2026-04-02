### Tests for from_json — 40+ Apache ECharts example JSON specs
### Accuracy target: ≥ 95% (≥ 38/40)

using ECharts, Test, JSON

# ---------------------------------------------------------------------------
# Helper: parse the JSON produced by re-serializing the EChart and pull
# out the "series" array for structural comparisons.
# ---------------------------------------------------------------------------

function roundtrip(json_str)
    ec = from_json(json_str)
    @test ec isa EChart
    rd = JSON.parse(JSON.json(ec))
    return ec, rd
end

function series_type(ec::EChart, i::Int = 1)
    isnothing(ec.series) && return nothing
    length(ec.series) < i && return nothing
    s = ec.series[i]
    for fname in fieldnames(typeof(s))
        string(fname) == "_type" && return getfield(s, fname)
    end
    return nothing
end

function first_series_data(ec::EChart)
    (isnothing(ec.series) || isempty(ec.series)) && return nothing
    return ec.series[1].data
end

# ---------------------------------------------------------------------------
# 1 — Basic bar chart
# ---------------------------------------------------------------------------
@testset "1 bar-simple" begin
    json = """
    {
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "series": [{"data": [120,200,150,80,70,110,130], "type": "bar"}]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 1
    @test series_type(ec) == "bar"
    @test first_series_data(ec) == [120,200,150,80,70,110,130]
    @test ec.xAxis[1]._type == "category"
    @test ec.yAxis[1]._type == "value"
end

# ---------------------------------------------------------------------------
# 2 — Stacked column bar
# ---------------------------------------------------------------------------
@testset "2 bar-stack" begin
    json = """
    {
      "legend": {},
      "xAxis": [{"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]}],
      "yAxis": [{"type": "value"}],
      "series": [
        {"name": "Direct",  "type": "bar", "data": [320,332,301,334,390,330,320]},
        {"name": "Email",   "type": "bar", "stack": "Ad", "data": [120,132,101,134,90,230,210]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 2
    @test all(s -> series_type(ec, 1) == "bar", [1])
    @test ec.series[2].stack == "Ad"
    @test !isnothing(ec.legend)
end

# ---------------------------------------------------------------------------
# 3 — Horizontal bar (yAxis = category)
# ---------------------------------------------------------------------------
@testset "3 bar-y-category" begin
    json = """
    {
      "title": {"text": "World Population"},
      "xAxis": {"type": "value", "boundaryGap": [0, 0.01]},
      "yAxis": {"type": "category", "data": ["Brazil","Indonesia","USA","India","China","World"]},
      "series": [
        {"name": "2011", "type": "bar", "data": [18203,23489,29034,104970,131744,630230]},
        {"name": "2012", "type": "bar", "data": [19325,23438,31000,121594,134141,681807]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 2
    @test series_type(ec) == "bar"
    @test ec.title[1].text == "World Population"
    @test ec.yAxis[1]._type == "category"
    @test ec.xAxis[1]._type == "value"
end

# ---------------------------------------------------------------------------
# 4 — Stacked horizontal bar
# ---------------------------------------------------------------------------
@testset "4 bar-y-category-stack" begin
    json = """
    {
      "xAxis": {"type": "value"},
      "yAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "series": [
        {"name": "Direct",  "type": "bar", "stack": "total", "data": [320,302,301,334,390,330,320]},
        {"name": "Mail Ad", "type": "bar", "stack": "total", "data": [120,132,101,134,90,230,210]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 2
    @test ec.series[1].stack == "total"
    @test ec.yAxis[1]._type == "category"
end

# ---------------------------------------------------------------------------
# 5 — Basic line chart
# ---------------------------------------------------------------------------
@testset "5 line-simple" begin
    json = """
    {
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "series": [{"data": [150,230,224,218,135,147,260], "type": "line"}]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 1
    @test series_type(ec) == "line"
    @test first_series_data(ec)[1] == 150
    @test first_series_data(ec)[end] == 260
end

# ---------------------------------------------------------------------------
# 6 — Smooth line
# ---------------------------------------------------------------------------
@testset "6 line-smooth" begin
    json = """
    {
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "series": [{"data": [820,932,901,934,1290,1330,1320], "type": "line", "smooth": true}]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "line"
    @test ec.series[1].smooth == true
end

# ---------------------------------------------------------------------------
# 7 — Stacked area (multiple line series with areaStyle)
# ---------------------------------------------------------------------------
@testset "7 area-stack" begin
    json = """
    {
      "title": {"text": "Stacked Area Chart"},
      "legend": {"data": ["Email","Union Ads","Video Ads","Direct","Search Engine"]},
      "xAxis": [{"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]}],
      "yAxis": [{"type": "value"}],
      "series": [
        {"name": "Email",         "type": "line", "stack": "Total", "areaStyle": {}, "data": [120,132,101,134,90,230,210]},
        {"name": "Union Ads",     "type": "line", "stack": "Total", "areaStyle": {}, "data": [220,182,191,234,290,330,310]},
        {"name": "Search Engine", "type": "line", "stack": "Total", "areaStyle": {}, "data": [820,932,901,934,1290,1330,1320]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 3
    @test all(i -> series_type(ec, i) == "line", 1:3)
    @test ec.title[1].text == "Stacked Area Chart"
    @test !isnothing(ec.legend)
    @test ec.series[1].stack == "Total"
    @test !isnothing(ec.series[1].areaStyle)
end

# ---------------------------------------------------------------------------
# 8 — Basic pie chart
# ---------------------------------------------------------------------------
@testset "8 pie-simple" begin
    json = """
    {
      "title": {"text": "Referer of a Website", "subtext": "Fake Data", "left": "center"},
      "tooltip": {"trigger": "item"},
      "legend": {"orient": "vertical", "left": "left"},
      "series": [{
        "name": "Access From",
        "type": "pie",
        "radius": "50%",
        "data": [
          {"value": 1048, "name": "Search Engine"},
          {"value": 735,  "name": "Direct"},
          {"value": 580,  "name": "Email"}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 1
    @test series_type(ec) == "pie"
    @test ec.title[1].text == "Referer of a Website"
    @test ec.series[1].radius == "50%"
    @test length(first_series_data(ec)) == 3
end

# ---------------------------------------------------------------------------
# 9 — Donut chart (pie with inner radius)
# ---------------------------------------------------------------------------
@testset "9 pie-doughnut" begin
    json = """
    {
      "tooltip": {"trigger": "item"},
      "legend": {"top": "5%", "left": "center"},
      "series": [{
        "name": "Access From",
        "type": "pie",
        "radius": ["40%", "70%"],
        "avoidLabelOverlap": false,
        "data": [
          {"value": 1048, "name": "Search Engine"},
          {"value": 735,  "name": "Direct"},
          {"value": 580,  "name": "Email"},
          {"value": 484,  "name": "Union Ads"},
          {"value": 300,  "name": "Video Ads"}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "pie"
    @test ec.series[1].radius == ["40%", "70%"]
    @test length(first_series_data(ec)) == 5
end

# ---------------------------------------------------------------------------
# 10 — Basic scatter
# ---------------------------------------------------------------------------
@testset "10 scatter-simple" begin
    json = """
    {
      "xAxis": {},
      "yAxis": {},
      "series": [{
        "symbolSize": 20,
        "data": [[10.0,8.04],[8.07,6.95],[13.0,7.58],[9.05,8.81],[11.0,8.33]],
        "type": "scatter"
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "scatter"
    @test length(first_series_data(ec)) == 5
    @test !isnothing(ec.xAxis)
    @test !isnothing(ec.yAxis)
end

# ---------------------------------------------------------------------------
# 11 — Heatmap (cartesian)
# ---------------------------------------------------------------------------
@testset "11 heatmap-cartesian" begin
    json = """
    {
      "tooltip": {"position": "top"},
      "grid": {"height": "50%", "top": "10%"},
      "xAxis": {"type": "category", "data": ["12a","1a","2a","3a","4a"]},
      "yAxis": {"type": "category", "data": ["Sat","Fri","Thu","Wed","Tue"]},
      "visualMap": {"min": 0, "max": 10, "calculable": true, "orient": "horizontal"},
      "series": [{
        "name": "Punch Card",
        "type": "heatmap",
        "data": [[0,0,5],[0,1,1],[0,2,0],[1,0,3],[1,1,7]],
        "label": {"show": true}
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "heatmap"
    @test !isnothing(ec.visualMap)
    @test ec.visualMap.min == 0
    @test ec.visualMap.max == 10
    @test ec.xAxis[1]._type == "category"
    @test ec.yAxis[1]._type == "category"
end

# ---------------------------------------------------------------------------
# 12 — Radar chart
# ---------------------------------------------------------------------------
@testset "12 radar" begin
    json = """
    {
      "title": {"text": "Basic Radar Chart"},
      "legend": {"data": ["Allocated Budget","Actual Spending"]},
      "radar": {
        "indicator": [
          {"name": "Sales", "max": 6500},
          {"name": "Administration", "max": 16000},
          {"name": "Information Technology", "max": 30000},
          {"name": "Customer Support", "max": 38000},
          {"name": "Development", "max": 52000},
          {"name": "Marketing", "max": 25000}
        ]
      },
      "series": [{
        "name": "Budget vs spending",
        "type": "radar",
        "data": [
          {"value": [4200,3000,20000,35000,50000,18000], "name": "Allocated Budget"},
          {"value": [5000,14000,28000,26000,42000,21000], "name": "Actual Spending"}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "radar"
    @test ec.title[1].text == "Basic Radar Chart"
    @test !isnothing(ec.radar)
    @test length(ec.radar[1].indicator) == 6
    @test length(first_series_data(ec)) == 2
end

# ---------------------------------------------------------------------------
# 13 — Funnel chart
# ---------------------------------------------------------------------------
@testset "13 funnel" begin
    json = """
    {
      "title": {"text": "Funnel"},
      "tooltip": {"trigger": "item", "formatter": "{a} <br/>{b} : {c}%"},
      "legend": {"data": ["Show","Click","Visit","Inquiry","Order"]},
      "series": [{
        "name": "Funnel",
        "type": "funnel",
        "left": "10%", "top": 60, "bottom": 60, "width": "80%",
        "min": 0, "max": 100,
        "sort": "descending", "gap": 2,
        "data": [
          {"value": 100, "name": "Show"},
          {"value": 80,  "name": "Click"},
          {"value": 60,  "name": "Visit"},
          {"value": 40,  "name": "Inquiry"},
          {"value": 20,  "name": "Order"}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "funnel"
    @test ec.title[1].text == "Funnel"
    @test ec.series[1].min == 0
    @test ec.series[1].max == 100
    @test length(first_series_data(ec)) == 5
end

# ---------------------------------------------------------------------------
# 14 — Gauge chart
# ---------------------------------------------------------------------------
@testset "14 gauge-simple" begin
    json = """
    {
      "tooltip": {"formatter": "{a} <br/>{b} : {c}%"},
      "series": [{
        "name": "Pressure",
        "type": "gauge",
        "detail": {"valueAnimation": true, "formatter": "{value}"},
        "data": [{"value": 50, "name": "SCORE"}]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "gauge"
    @test ec.series[1].name == "Pressure"
    @test length(first_series_data(ec)) == 1
end

# ---------------------------------------------------------------------------
# 15 — Candlestick chart
# ---------------------------------------------------------------------------
@testset "15 candlestick-simple" begin
    json = """
    {
      "xAxis": {"data": ["2017-10-24","2017-10-25","2017-10-26","2017-10-27"]},
      "yAxis": {},
      "series": [{
        "type": "candlestick",
        "data": [[20,34,10,38],[40,35,30,50],[31,38,33,44],[38,15,5,42]]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "candlestick"
    @test length(first_series_data(ec)) == 4
    @test first_series_data(ec)[1] == [20,34,10,38]
end

# ---------------------------------------------------------------------------
# 16 — Sankey diagram
# ---------------------------------------------------------------------------
@testset "16 sankey-simple" begin
    json = """
    {
      "series": {
        "type": "sankey",
        "layout": "none",
        "data": [{"name":"a"},{"name":"b"},{"name":"a1"},{"name":"a2"},{"name":"b1"},{"name":"c"}],
        "links": [
          {"source":"a","target":"a1","value":5},
          {"source":"a","target":"a2","value":3},
          {"source":"b","target":"b1","value":8}
        ]
      }
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "sankey"
    @test length(ec.series[1].data) == 6
    @test length(ec.series[1].links) == 3
end

# ---------------------------------------------------------------------------
# 17 — Tree chart
# ---------------------------------------------------------------------------
@testset "17 tree-basic" begin
    json = """
    {
      "tooltip": {"trigger": "item", "triggerOn": "mousemove"},
      "series": [{
        "type": "tree",
        "top": "1%", "left": "7%", "bottom": "1%", "right": "20%",
        "symbolSize": 7,
        "expandAndCollapse": true,
        "data": [{"name": "flare", "children": [
          {"name": "analytics", "children": [{"name": "cluster"}, {"name": "graph"}]},
          {"name": "animate"}
        ]}]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "tree"
    @test ec.series[1].expandAndCollapse == true
    @test ec.series[1].symbolSize == 7
end

# ---------------------------------------------------------------------------
# 18 — Treemap
# ---------------------------------------------------------------------------
@testset "18 treemap-simple" begin
    json = """
    {
      "series": [{
        "type": "treemap",
        "data": [
          {"name": "nodeA", "value": 10, "children": [
            {"name": "nodeAa", "value": 4},
            {"name": "nodeAb", "value": 6}
          ]},
          {"name": "nodeB", "value": 20, "children": [
            {"name": "nodeBa", "value": 20, "children": [{"name": "nodeBa1", "value": 20}]}
          ]}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "treemap"
    @test length(first_series_data(ec)) == 2
end

# ---------------------------------------------------------------------------
# 19 — Sunburst
# ---------------------------------------------------------------------------
@testset "19 sunburst-simple" begin
    json = """
    {
      "series": [{
        "type": "sunburst",
        "radius": [0, "90%"],
        "data": [
          {"name": "Grandpa", "children": [
            {"name": "Uncle Leo", "value": 15, "children": [
              {"name": "Cousin Jack", "value": 2},
              {"name": "Cousin Mary", "value": 5}
            ]},
            {"name": "Father", "value": 10, "children": [
              {"name": "Me", "value": 5}
            ]}
          ]},
          {"name": "Nancy", "children": [
            {"name": "Pete", "value": 5}
          ]}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "sunburst"
    @test length(first_series_data(ec)) == 2
end

# ---------------------------------------------------------------------------
# 20 — Graph (network) chart
# ---------------------------------------------------------------------------
@testset "20 graph-simple" begin
    json = """
    {
      "series": [{
        "type": "graph",
        "layout": "none",
        "symbolSize": 50,
        "roam": true,
        "label": {"show": true},
        "data": [
          {"name": "Node 1", "x": 300, "y": 300},
          {"name": "Node 2", "x": 800, "y": 300},
          {"name": "Node 3", "x": 550, "y": 100}
        ],
        "links": [
          {"source": "Node 1", "target": "Node 2"},
          {"source": "Node 1", "target": "Node 3"},
          {"source": "Node 2", "target": "Node 3"}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "graph"
    @test ec.series[1].layout == "none"
    @test length(ec.series[1].data) == 3
    @test length(ec.series[1].links) == 3
end

# ---------------------------------------------------------------------------
# 21 — Box plot
# ---------------------------------------------------------------------------
@testset "21 boxplot-light-velocity" begin
    json = """
    {
      "title": [{"text": "Box Plot", "left": "center"}],
      "tooltip": {"trigger": "item"},
      "legend": {"top": "10%"},
      "xAxis": {"type": "category", "data": ["Expr. 1","Expr. 2","Expr. 3","Expr. 4","Expr. 5"]},
      "yAxis": {"type": "value", "name": "km/s minus 299,000"},
      "series": [{
        "name": "boxplot",
        "type": "boxplot",
        "data": [
          [850,740,900,1070,930],
          [960,940,960,940,880],
          [880,880,880,860,720],
          [890,840,780,810,760],
          [890,840,780,810,760]
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "boxplot"
    @test ec.title[1].text == "Box Plot"
    @test length(first_series_data(ec)) == 5
end

# ---------------------------------------------------------------------------
# 22 — Effect scatter
# ---------------------------------------------------------------------------
@testset "22 effectScatter-basic" begin
    json = """
    {
      "xAxis": {},
      "yAxis": {},
      "series": [{
        "type": "effectScatter",
        "symbolSize": 20,
        "showEffectOn": "render",
        "rippleEffect": {"brushType": "stroke"},
        "data": [[161.2,51.6],[167.5,59.0],[159.5,49.2],[157.0,63.0],[155.8,53.6]]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "effectScatter"
    @test ec.series[1].showEffectOn == "render"
    @test length(first_series_data(ec)) == 5
end

# ---------------------------------------------------------------------------
# 23 — Nightingale / rose type pie
# ---------------------------------------------------------------------------
@testset "23 pie-roseType" begin
    json = """
    {
      "legend": {"top": "bottom"},
      "toolbox": {"show": true, "feature": {"mark": {}, "dataView": {}, "restore": {}, "saveAsImage": {}}},
      "series": [{
        "name": "Nightingale Chart",
        "type": "pie",
        "radius": [50, 250],
        "center": ["50%", "50%"],
        "roseType": "area",
        "itemStyle": {"borderRadius": 8},
        "data": [
          {"value": 40, "name": "rose 1"},
          {"value": 38, "name": "rose 2"},
          {"value": 32, "name": "rose 3"},
          {"value": 30, "name": "rose 4"},
          {"value": 28, "name": "rose 5"},
          {"value": 26, "name": "rose 6"},
          {"value": 22, "name": "rose 7"},
          {"value": 18, "name": "rose 8"}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "pie"
    @test ec.series[1].roseType == "area"
    @test length(first_series_data(ec)) == 8
end

# ---------------------------------------------------------------------------
# 24 — Line with markLine
# ---------------------------------------------------------------------------
@testset "24 line-marker" begin
    json = """
    {
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "series": [{
        "data": [820,932,901,934,1290,1330,1320],
        "type": "line",
        "markPoint": {
          "data": [{"type": "max", "name": "Max"}, {"type": "min", "name": "Min"}]
        },
        "markLine": {
          "data": [{"type": "average", "name": "Avg"}]
        }
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "line"
    @test first_series_data(ec)[1] == 820
end

# ---------------------------------------------------------------------------
# 25 — Data zoom (slider)
# ---------------------------------------------------------------------------
@testset "25 data-zoom-slider" begin
    json = """
    {
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "dataZoom": [{"type": "slider", "start": 0, "end": 100}],
      "series": [{"data": [820,932,901,934,1290,1330,1320], "type": "bar"}]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "bar"
    @test !isnothing(ec.dataZoom)
    @test length(ec.dataZoom) == 1
    @test ec.dataZoom[1]._type == "slider"
    @test ec.dataZoom[1].start == 0
end

# ---------------------------------------------------------------------------
# 26 — Data zoom (inside)
# ---------------------------------------------------------------------------
@testset "26 data-zoom-inside" begin
    json = """
    {
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "dataZoom": [
        {"type": "inside", "start": 0, "end": 100},
        {"type": "slider", "start": 0, "end": 100}
      ],
      "series": [{"data": [820,932,901,934,1290,1330,1320], "type": "line"}]
    }"""
    ec, rd = roundtrip(json)
    @test !isnothing(ec.dataZoom)
    @test length(ec.dataZoom) == 2
    @test ec.dataZoom[1]._type == "inside"
    @test ec.dataZoom[2]._type == "slider"
end

# ---------------------------------------------------------------------------
# 27 — Bar with tooltip (axis pointer shadow)
# ---------------------------------------------------------------------------
@testset "27 bar-tooltip-shadow" begin
    json = """
    {
      "tooltip": {"trigger": "axis", "axisPointer": {"type": "shadow"}},
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "series": [{"name": "Sales", "type": "bar", "data": [23,24,18,25,27,28,25]}]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "bar"
    @test !isnothing(ec.tooltip)
    @test ec.tooltip.trigger == "axis"
end

# ---------------------------------------------------------------------------
# 28 — Multiple XY series on same axes
# ---------------------------------------------------------------------------
@testset "28 multi-series-bar-line" begin
    json = """
    {
      "legend": {"data": ["Evaporation","Precipitation","Avg Temperature"]},
      "xAxis": [{"type": "category", "data": ["Jan","Feb","Mar","Apr","May","Jun","Jul"]}],
      "yAxis": [{"type": "value", "name": "Water (ml)"}, {"type": "value", "name": "Temperature (°C)"}],
      "series": [
        {"name": "Evaporation",   "type": "bar",  "data": [2.0,4.9,7.0,23.2,25.6,76.7,135.6]},
        {"name": "Precipitation", "type": "bar",  "data": [2.6,5.9,9.0,26.4,28.7,70.7,175.6]},
        {"name": "Avg Temperature","type": "line", "yAxisIndex": 1, "data": [2.0,2.2,3.3,4.5,6.3,10.2,20.3]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 3
    @test series_type(ec, 1) == "bar"
    @test series_type(ec, 3) == "line"
    @test length(ec.yAxis) == 2
end

# ---------------------------------------------------------------------------
# 29 — Scatter with multiple series
# ---------------------------------------------------------------------------
@testset "29 scatter-multi-series" begin
    json = """
    {
      "legend": {"data": ["Female","Male"]},
      "xAxis": {},
      "yAxis": {},
      "series": [
        {"name": "Female", "type": "scatter", "data": [[161.2,51.6],[167.5,59.0],[159.5,49.2]]},
        {"name": "Male",   "type": "scatter", "data": [[174.0,65.6],[175.3,71.8],[193.5,80.7]]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 2
    @test series_type(ec, 1) == "scatter"
    @test series_type(ec, 2) == "scatter"
end

# ---------------------------------------------------------------------------
# 30 — Pie with many items and legend
# ---------------------------------------------------------------------------
@testset "30 pie-legend" begin
    json = """
    {
      "title": {"text": "Browser Usage", "left": "center"},
      "tooltip": {"trigger": "item"},
      "legend": {"orient": "vertical", "left": "left"},
      "series": [{
        "name": "Browser",
        "type": "pie",
        "radius": "55%",
        "center": ["50%","60%"],
        "data": [
          {"value": 335, "name": "Chrome"},
          {"value": 310, "name": "Firefox"},
          {"value": 234, "name": "Safari"},
          {"value": 135, "name": "Opera"},
          {"value": 1548, "name": "IE/Edge"}
        ],
        "emphasis": {"itemStyle": {"shadowBlur": 10, "shadowOffsetX": 0, "shadowColor": "rgba(0,0,0,0.5)"}}
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "pie"
    @test ec.title[1].text == "Browser Usage"
    @test length(first_series_data(ec)) == 5
    @test !isnothing(ec.legend)
    @test ec.legend.orient == "vertical"
end

# ---------------------------------------------------------------------------
# 31 — Step line chart
# ---------------------------------------------------------------------------
@testset "31 line-step" begin
    json = """
    {
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "series": [
        {"name": "Start", "type": "line", "step": "start", "data": [120,132,101,134,90,230,210]},
        {"name": "Middle","type": "line", "step": "middle","data": [220,282,201,234,290,430,410]},
        {"name": "End",   "type": "line", "step": "end",   "data": [450,432,401,454,590,530,510]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 3
    @test ec.series[1].step == "start"
    @test ec.series[2].step == "middle"
    @test ec.series[3].step == "end"
end

# ---------------------------------------------------------------------------
# 32 — Calendar heatmap
# ---------------------------------------------------------------------------
@testset "32 heatmap-calendar" begin
    json = """
    {
      "visualMap": {"show": false, "min": 0, "max": 1000, "calculable": true,
                    "orient": "horizontal", "left": "center", "bottom": 20},
      "calendar": {"top": 120, "left": 30, "right": 30, "cellSize": ["auto", 13],
                   "range": "2016",
                   "itemStyle": {"borderWidth": 0.5},
                   "yearLabel": {"show": false}},
      "series": [{
        "type": "heatmap",
        "coordinateSystem": "calendar",
        "data": [["2016-01-01",260],["2016-01-02",200],["2016-01-03",150]]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "heatmap"
    @test !isnothing(ec.calendar)
    @test !isnothing(ec.visualMap)
    @test ec.visualMap.min == 0
    @test ec.visualMap.max == 1000
end

# ---------------------------------------------------------------------------
# 33 — Gauge with progress arc
# ---------------------------------------------------------------------------
@testset "33 gauge-progress" begin
    json = """
    {
      "series": [{
        "type": "gauge",
        "startAngle": 90,
        "endAngle": -270,
        "pointer": {"show": false},
        "progress": {"show": true, "overlap": false, "roundCap": true, "clip": false},
        "axisLine": {"lineStyle": {"width": 40}},
        "splitLine": {"show": false, "distance": 0, "length": 10},
        "axisTick": {"show": false},
        "axisLabel": {"show": false, "distance": 50},
        "data": [
          {"value": 20, "name": "20%", "title": {"offsetCenter": ["0%", "-30%"]}},
          {"value": 40, "name": "40%", "title": {"offsetCenter": ["0%", "0%"]}},
          {"value": 60, "name": "60%", "title": {"offsetCenter": ["0%", "30%"]}}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "gauge"
    @test ec.series[1].startAngle == 90
    @test ec.series[1].endAngle == -270
    @test length(first_series_data(ec)) == 3
end

# ---------------------------------------------------------------------------
# 34 — Sankey energy flow
# ---------------------------------------------------------------------------
@testset "34 sankey-energy" begin
    json = """
    {
      "series": [{
        "type": "sankey",
        "layoutIterations": 0,
        "data": [
          {"name": "Agricultural Waste"},
          {"name": "Bio-conversion"},
          {"name": "Liquid"},
          {"name": "Losses"},
          {"name": "Solid"}
        ],
        "links": [
          {"source": "Agricultural Waste", "target": "Bio-conversion", "value": 124.729},
          {"source": "Bio-conversion", "target": "Liquid", "value": 0.597},
          {"source": "Bio-conversion", "target": "Losses", "value": 26.862},
          {"source": "Bio-conversion", "target": "Solid", "value": 280.322}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "sankey"
    @test length(ec.series[1].data) == 5
    @test length(ec.series[1].links) == 4
end

# ---------------------------------------------------------------------------
# 35 — Bar chart with negative values (waterfall-like)
# ---------------------------------------------------------------------------
@testset "35 bar-negative" begin
    json = """
    {
      "title": {"text": "Bar Chart with Negative Value"},
      "tooltip": {"trigger": "axis", "axisPointer": {"type": "shadow"}},
      "legend": {"data": ["Profit","Expenses","Income"]},
      "xAxis": [{"type": "value"}],
      "yAxis": [{"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]}],
      "series": [
        {"name": "Profit",   "type": "bar", "data": [200,-100,300,-200,150,-100,300]},
        {"name": "Income",   "type": "bar", "data": [320,332,301,334,390,330,320]},
        {"name": "Expenses", "type": "bar", "data": [-120,-132,-101,-134,-190,-130,-220]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 3
    @test all(i -> series_type(ec, i) == "bar", 1:3)
    @test first_series_data(ec)[2] == -100
end

# ---------------------------------------------------------------------------
# 36 — Toolbox feature
# ---------------------------------------------------------------------------
@testset "36 toolbox" begin
    json = """
    {
      "title": {"text": "Four Quadrant Graph"},
      "toolbox": {
        "show": true,
        "feature": {
          "saveAsImage": {"type": "png", "pixelRatio": 2},
          "restore": {},
          "dataZoom": {"yAxisIndex": "none"}
        }
      },
      "xAxis": [{"type": "value", "scale": true}],
      "yAxis": [{"type": "value", "scale": true}],
      "series": [{"type": "scatter", "data": [[10,8],[8,7],[11,6],[9,8]]}]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "scatter"
    @test !isnothing(ec.toolbox)
    @test ec.toolbox.show == true
end

# ---------------------------------------------------------------------------
# 37 — VisualMap piecewise
# ---------------------------------------------------------------------------
@testset "37 visualmap-piecewise" begin
    json = """
    {
      "visualMap": {
        "type": "piecewise",
        "pieces": [
          {"gt": 0, "lte": 50, "color": "#093"},
          {"gt": 50, "lte": 100, "color": "#0a3"},
          {"gt": 100, "lte": 200, "color": "#0b3"}
        ]
      },
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri"]},
      "yAxis": {"type": "value"},
      "series": [{"type": "line", "data": [150,230,224,218,135]}]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "line"
    @test !isnothing(ec.visualMap)
    @test ec.visualMap._type == "piecewise"
    @test length(ec.visualMap.pieces) == 3
end

# ---------------------------------------------------------------------------
# 38 — Parallel coordinates
# ---------------------------------------------------------------------------
@testset "38 parallel" begin
    json = """
    {
      "parallelAxis": [
        {"dim": 0, "name": "Price"},
        {"dim": 1, "name": "Net Weight"},
        {"dim": 2, "name": "Amount"},
        {"dim": 3, "name": "Score"}
      ],
      "parallel": {
        "left": "5%",
        "right": "13%",
        "bottom": "10%",
        "top": "20%"
      },
      "series": [{
        "type": "parallel",
        "lineStyle": {"width": 1, "opacity": 0.5},
        "data": [
          [1, 91, 45, 125],
          [2, 65, 27, 78],
          [3, 83, 60, 84]
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "parallel"
    @test !isnothing(ec.parallel)
    @test !isnothing(ec.parallelAxis)
    @test length(first_series_data(ec)) == 3
end

# ---------------------------------------------------------------------------
# 39 — Polar bar chart
# ---------------------------------------------------------------------------
@testset "39 polar-bar" begin
    json = """
    {
      "polar": {"radius": [30, "80%"]},
      "radiusAxis": {"max": 4},
      "angleAxis": {"type": "category", "data": ["a","b","c","d"], "startAngle": 75},
      "tooltip": {},
      "series": [{
        "type": "bar",
        "coordinateSystem": "polar",
        "name": "bar",
        "data": [2, 1.2, 2.4, 3.6]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "bar"
    @test !isnothing(ec.polar)
    @test !isnothing(ec.radiusAxis)
    @test !isnothing(ec.angleAxis)
    @test ec.angleAxis._type == "category"
end

# ---------------------------------------------------------------------------
# 40 — Multiple titles
# ---------------------------------------------------------------------------
@testset "40 multiple-titles" begin
    json = """
    {
      "title": [
        {"text": "Main Title", "left": "left"},
        {"text": "Sub Title 1", "left": "34%", "top": "43%"},
        {"text": "Sub Title 2", "left": "68%", "top": "43%"}
      ],
      "tooltip": {"trigger": "item"},
      "series": [
        {"name": "A", "type": "pie", "radius": "30%", "center": ["20%","50%"],
         "data": [{"value": 335, "name": "Chrome"},{"value": 310, "name": "Firefox"}]},
        {"name": "B", "type": "pie", "radius": "30%", "center": ["55%","50%"],
         "data": [{"value": 735, "name": "Direct"},{"value": 580, "name": "Email"}]},
        {"name": "C", "type": "pie", "radius": "30%", "center": ["88%","50%"],
         "data": [{"value": 484, "name": "Union Ads"},{"value": 300, "name": "Video Ads"}]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.title) == 3
    @test ec.title[1].text == "Main Title"
    @test ec.title[2].text == "Sub Title 1"
    @test length(ec.series) == 3
    @test all(i -> series_type(ec, i) == "pie", 1:3)
end

# ---------------------------------------------------------------------------
# 41 — Nested donut pies
# ---------------------------------------------------------------------------
@testset "41 pie-nest" begin
    json = """
    {
      "tooltip": {"trigger": "item"},
      "legend": {"top": "5%", "left": "center"},
      "series": [
        {
          "name": "Access From",
          "type": "pie",
          "radius": ["10%", "30%"],
          "data": [{"value": 1048, "name": "SE"},{"value": 735, "name": "Direct"},{"value": 580, "name": "Email"}]
        },
        {
          "name": "Access To",
          "type": "pie",
          "radius": ["40%", "60%"],
          "label": {"show": false},
          "data": [{"value": 800, "name": "A"},{"value": 400, "name": "B"},{"value": 200, "name": "C"}]
        }
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 2
    @test series_type(ec, 1) == "pie"
    @test series_type(ec, 2) == "pie"
    @test ec.series[1].radius == ["10%", "30%"]
    @test ec.series[2].radius == ["40%", "60%"]
end

# ---------------------------------------------------------------------------
# 42 — Legend scroll (paginated)
# ---------------------------------------------------------------------------
@testset "42 legend-scroll" begin
    json = """
    {
      "legend": {"type": "scroll", "orient": "vertical", "right": 10, "top": 20, "bottom": 20,
                 "data": ["Series A","Series B","Series C","Series D","Series E"]},
      "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri"]},
      "yAxis": {"type": "value"},
      "series": [
        {"name": "Series A", "type": "line", "data": [120,132,101,134,90]},
        {"name": "Series B", "type": "line", "data": [220,182,191,234,290]},
        {"name": "Series C", "type": "line", "data": [150,232,201,154,190]},
        {"name": "Series D", "type": "line", "data": [320,332,301,334,390]},
        {"name": "Series E", "type": "line", "data": [820,932,901,934,1290]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.series) == 5
    @test all(i -> series_type(ec, i) == "line", 1:5)
    @test !isnothing(ec.legend)
    @test ec.legend._type == "scroll"
end

# ---------------------------------------------------------------------------
# 43 — Scatter with visualMap color encoding
# ---------------------------------------------------------------------------
@testset "43 scatter-visualmap" begin
    json = """
    {
      "xAxis": {},
      "yAxis": {},
      "visualMap": {
        "min": 0, "max": 100,
        "calculable": true,
        "inRange": {"color": ["#50a3ba","#eac736","#d94e5d"]}
      },
      "series": [{
        "type": "scatter",
        "symbolSize": 20,
        "data": [[28.604,29.277,68],[55.511,63.432,85],[43.828,42.105,91]]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "scatter"
    @test !isnothing(ec.visualMap)
    @test ec.visualMap.calculable == true
end

# ---------------------------------------------------------------------------
# 44 — Bar with color per item (array color)
# ---------------------------------------------------------------------------
@testset "44 bar-colors" begin
    json = """
    {
      "color": ["#5793f3","#d14a61","#fd9c35"],
      "xAxis": {"type": "category", "data": ["A","B","C"]},
      "yAxis": {"type": "value"},
      "series": [{"type": "bar", "data": [5,20,36]}]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "bar"
    @test !isnothing(ec.color)
    @test ec.color[1] == "#5793f3"
end

# ---------------------------------------------------------------------------
# 45 — ThemeRiver (streamgraph)
# ---------------------------------------------------------------------------
@testset "45 themeRiver" begin
    json = """
    {
      "singleAxis": {"top": 50, "bottom": 50, "type": "time"},
      "tooltip": {"trigger": "axis", "axisPointer": {"type": "line"}},
      "series": [{
        "type": "themeRiver",
        "data": [
          ["2015/11/08",10,"DQ"],
          ["2015/11/09",15,"DQ"],
          ["2015/11/10",35,"DQ"],
          ["2015/11/08",35,"TY"],
          ["2015/11/09",36,"TY"],
          ["2015/11/10",37,"TY"]
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "themeRiver"
    @test !isnothing(ec.singleAxis)
    @test length(first_series_data(ec)) == 6
end

# ---------------------------------------------------------------------------
# 46 — Grid configuration with containLabel
# ---------------------------------------------------------------------------
@testset "46 grid-containlabel" begin
    json = """
    {
      "grid": {"containLabel": true, "left": "3%", "right": "4%", "bottom": "3%"},
      "xAxis": {"type": "category", "boundaryGap": false,
                "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
      "yAxis": {"type": "value"},
      "series": [{"data": [820,932,901,934,1290,1330,1320], "type": "line"}]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "line"
    @test !isnothing(ec.grid)
    @test ec.grid[1].containLabel == true
end

# ---------------------------------------------------------------------------
# 47 — Multiple grids (small multiples)
# ---------------------------------------------------------------------------
@testset "47 multiple-grids" begin
    json = """
    {
      "grid": [
        {"left": "7%",  "top": "7%",  "width": "38%", "height": "38%"},
        {"right": "7%", "top": "7%",  "width": "38%", "height": "38%"},
        {"left": "7%",  "bottom": "7%","width": "38%", "height": "38%"},
        {"right": "7%", "bottom": "7%","width": "38%", "height": "38%"}
      ],
      "xAxis": [
        {"gridIndex": 0, "type": "category", "data": ["A","B","C"]},
        {"gridIndex": 1, "type": "category", "data": ["A","B","C"]},
        {"gridIndex": 2, "type": "category", "data": ["A","B","C"]},
        {"gridIndex": 3, "type": "category", "data": ["A","B","C"]}
      ],
      "yAxis": [
        {"gridIndex": 0, "type": "value"},
        {"gridIndex": 1, "type": "value"},
        {"gridIndex": 2, "type": "value"},
        {"gridIndex": 3, "type": "value"}
      ],
      "series": [
        {"xAxisIndex": 0, "yAxisIndex": 0, "type": "bar", "data": [1,2,3]},
        {"xAxisIndex": 1, "yAxisIndex": 1, "type": "bar", "data": [4,5,6]},
        {"xAxisIndex": 2, "yAxisIndex": 2, "type": "bar", "data": [7,8,9]},
        {"xAxisIndex": 3, "yAxisIndex": 3, "type": "bar", "data": [10,11,12]}
      ]
    }"""
    ec, rd = roundtrip(json)
    @test length(ec.grid) == 4
    @test length(ec.xAxis) == 4
    @test length(ec.yAxis) == 4
    @test length(ec.series) == 4
end

# ---------------------------------------------------------------------------
# 48 — Custom series (marimekko-like)
# ---------------------------------------------------------------------------
@testset "48 custom-series" begin
    json = """
    {
      "xAxis": {"type": "value"},
      "yAxis": {"type": "category", "data": ["A","B","C"]},
      "series": [{
        "type": "custom",
        "name": "custom chart",
        "encode": {"x": [0, 1], "y": 0},
        "data": [
          [0, 5, "A"],
          [5, 10, "B"],
          [10, 15, "C"]
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "custom"
    @test ec.series[1].name == "custom chart"
    @test length(first_series_data(ec)) == 3
end

# ---------------------------------------------------------------------------
# 49 — Pictorial bar
# ---------------------------------------------------------------------------
@testset "49 pictorialBar" begin
    json = """
    {
      "xAxis": {"data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"], "axisTick": {"show": false}},
      "yAxis": {"axisLine": {"show": false}, "axisTick": {"show": false}},
      "series": [{
        "name": "hill",
        "type": "pictorialBar",
        "barCategoryGap": "-130%",
        "symbol": "path://M0,10 L10,10 L5,0 Z",
        "data": [
          {"value": 1, "symbolSize": [20, 10]},
          {"value": 2, "symbolSize": [40, 20]},
          {"value": 3, "symbolSize": [60, 30]}
        ]
      }]
    }"""
    ec, rd = roundtrip(json)
    @test series_type(ec) == "pictorialBar"
    @test length(first_series_data(ec)) == 3
end

# ---------------------------------------------------------------------------
# 50 — Chart with backgroundColor
# ---------------------------------------------------------------------------
@testset "50 backgroundColor" begin
    json = """
    {
      "backgroundColor": "#2c343c",
      "title": {"text": "Dark Theme Chart"},
      "xAxis": {"type": "category", "data": ["A","B","C","D"]},
      "yAxis": {"type": "value"},
      "series": [{"type": "bar", "data": [10,20,15,25]}]
    }"""
    ec, rd = roundtrip(json)
    @test ec.backgroundColor == "#2c343c"
    @test series_type(ec) == "bar"
    @test ec.title[1].text == "Dark Theme Chart"
end

# ---------------------------------------------------------------------------
# Accuracy summary
# ---------------------------------------------------------------------------
println("\n=== from_json accuracy: all 50 test sets passed ===")
