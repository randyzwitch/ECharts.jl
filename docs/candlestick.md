---
title: Candlestick
sidebar: mydoc_sidebar
permalink: /candlestick
---
Candlestick plots are financial plots showing the relationship between the open, close, low and high prices for a security on a given day. For a more thorough description of the uses and subtleties of candlestick plots, see: [http://www.datavizcatalogue.com/methods/candlestick_chart.html](http://www.datavizcatalogue.com/methods/candlestick_chart.html)

## Method Signatures
{% highlight julia %}
#Array methods
candlestick(dt::AbstractVector{String},
    open::AbstractVector{<:Union{Missing, Real}},
    close::AbstractVector{<:Union{Missing, Real}},
    low::AbstractVector{<:Union{Missing, Real}},
    high::AbstractVector{<:Union{Missing, Real}})

candlestick(dt::AbstractVector{<:Dates.TimeType},
    open::AbstractVector{<:Union{Missing, Real}},
    close::AbstractVector{<:Union{Missing, Real}},
    low::AbstractVector{<:Union{Missing, Real}},
    high::AbstractVector{<:Union{Missing, Real}})
{% endhighlight %}

## Optional Arguments
{% highlight julia %}
legend::Bool = false
scale::Bool = true
kwargs... #modifies top-level `EChart` fields
{% endhighlight %}

## Examples

### Single Series
{% highlight julia %}
using ECharts
dt = ["2016/08/26", "2016/08/29", "2016/08/30", "2016/08/31", "2016/09/01", "2016/09/02",
"2016/09/06", "2016/09/07", "2016/09/08", "2016/09/09", "2016/09/12", "2016/09/13",
"2016/09/14", "2016/09/15", "2016/09/16", "2016/09/19", "2016/09/20", "2016/09/21",
"2016/09/22", "2016/09/23", "2016/09/26"]

close_ = [12.38, 12.47, 12.55, 12.60, 12.44, 12.50, 12.67, 12.70, 12.73,
12.38, 12.70, 12.38, 12.14, 12.11, 12.11, 12.11, 12.00, 12.09, 12.18,
12.17, 12.01]

open_ = [12.47, 12.38, 12.46, 12.48, 12.66, 12.53, 12.49, 12.62, 12.50,
12.61, 12.32, 12.53, 12.18, 12.14, 12.05, 12.12, 12.09, 12.08, 12.17,
12.12, 12.12]

high_ = [12.55, 12.50, 12.56, 12.61, 12.72, 12.57, 12.67, 12.75, 12.75,
12.6850, 12.77, 12.68, 12.31, 12.18, 12.13, 12.33, 12.19, 12.11, 12.29,
12.22, 12.12]

low_ = [12.34, 12.38, 12.43, 12.48, 12.35, 12.46, 12.43, 12.62, 12.50,
12.38, 12.28, 12.33,12.11, 12.06, 12.01, 12.0586, 11.96, 12.01, 12.16,
12.12, 12.00]

c = candlestick(dt, open_, close_, low_, high_)
{% endhighlight %}

<div id="candle" style="height:400px;width:800px;"></div>
<script type="text/javascript">

    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("candle"), JSON.parse(roma()));

    // Load data into the ECharts instance
    myChart.setOption(
{"xAxis":[{"splitNumber":5,"boundaryGap":true,"axisLabel":{"show":true,"interval":"auto","rotate":0,"inside":false,"formatter":"{value}","margin":8},"data":["2016/08/26","2016/08/29","2016/08/30","2016/08/31","2016/09/01","2016/09/02","2016/09/06","2016/09/07","2016/09/08","2016/09/09","2016/09/12","2016/09/13","2016/09/14","2016/09/15","2016/09/16","2016/09/19","2016/09/20","2016/09/21","2016/09/22","2016/09/23","2016/09/26"],"scale":true,"gridIndex":0,"minInterval":0,"zlevel":0,"triggerEvent":false,"z":0,"inverse":false,"nameLocation":"middle","nameGap":30,"silent":true,"type":"category"}],"ec_charttype":"candlestick","series":[{"name":"Series 1","data":[[12.47,12.38,12.34,12.55],[12.38,12.47,12.38,12.5],[12.46,12.55,12.43,12.56],[12.48,12.6,12.48,12.61],[12.66,12.44,12.35,12.72],[12.53,12.5,12.46,12.57],[12.49,12.67,12.43,12.67],[12.62,12.7,12.62,12.75],[12.5,12.73,12.5,12.75],[12.61,12.38,12.38,12.685],[12.32,12.7,12.28,12.77],[12.53,12.38,12.33,12.68],[12.18,12.14,12.11,12.31],[12.14,12.11,12.06,12.18],[12.05,12.11,12.01,12.13],[12.12,12.11,12.0586,12.33],[12.09,12.0,11.96,12.19],[12.08,12.09,12.01,12.11],[12.17,12.18,12.16,12.29],[12.12,12.17,12.12,12.22],[12.12,12.01,12.0,12.12]],"type":"candlestick"}],"theme":{"geo":{"label":{"normal":{"textStyle":{"color":"#000000"}},"emphasis":{"textStyle":{"color":"rgb(1,0,0)"}}},"itemStyle":{"normal":{"borderColor":"#444444","borderWidth":0.5,"areaColor":"#eeeeee"},"emphasis":{"borderColor":"#444444","borderWidth":1,"areaColor":"rgba(255,215,0,0.8)"}}},"parallel":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"markPoint":{"label":{"normal":{"textStyle":{"color":"#eeeeee"}},"emphasis":{"textStyle":{"color":"#eeeeee"}}}},"visualMap":{"color":["#e01f54","#e7dbc3"]},"funnel":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"bar":{"itemStyle":{"normal":{"barBorderColor":"#ccc","barBorderWidth":0},"emphasis":{"barBorderColor":"#ccc","barBorderWidth":0}}},"map":{"label":{"normal":{"textStyle":{"color":"#000000"}},"emphasis":{"textStyle":{"color":"rgb(1,0,0)"}}},"itemStyle":{"normal":{"borderColor":"#444444","borderWidth":0.5,"areaColor":"#eeeeee"},"emphasis":{"borderColor":"#444444","borderWidth":1,"areaColor":"rgba(255,215,0,0.8)"}}},"scatter":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"pie":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"graph":{"label":{"normal":{"textStyle":{"color":"#eeeeee"}}},"symbolSize":4,"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"}},"smooth":false,"symbol":"emptyCircle","color":["#e01f54","#001852","#f5e8c8","#b8d2c7","#c6b38e","#a4d8c2","#f3d999","#d3758f","#dcc392","#2e4783","#82b6e9","#ff6347","#a092f1","#0a915d","#eaf889","#6699FF","#ff6666","#3cb371","#d5b158","#38b6b6"],"lineStyle":{"normal":{"color":"#aaaaaa","width":1}}},"backgroundColor":"rgba(0,0,0,0)","line":{"symbolSize":4,"itemStyle":{"normal":{"borderWidth":1}},"smooth":false,"symbol":"emptyCircle","lineStyle":{"normal":{"width":2}}},"candlestick":{"itemStyle":{"normal":{"borderColor0":"#b8d2c7","color":"#e01f54","borderColor":"#f5e8c8","borderWidth":1,"color0":"#001852"}}},"sankey":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"valueAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(2,2,2,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"toolbox":{"iconStyle":{"normal":{"borderColor":"#999999"},"emphasis":{"borderColor":"#666666"}}},"categoryAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":false,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(2,2,2,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"tooltip":{"axisPointer":{"crossStyle":{"color":"#cccccc","width":1},"lineStyle":{"color":"#cccccc","width":1}}},"timeline":{"label":{"normal":{"textStyle":{"color":"#293c55"}},"emphasis":{"textStyle":{"color":"#293c55"}}},"controlStyle":{"normal":{"color":"#293c55","borderColor":"#293c55","borderWidth":0.5},"emphasis":{"color":"#293c55","borderColor":"#293c55","borderWidth":0.5}},"checkpointStyle":{"color":"#e43c59","borderColor":"rgba(194,53,49,0.5)"},"itemStyle":{"normal":{"color":"#293c55","borderWidth":1},"emphasis":{"color":"#a9334c"}},"lineStyle":{"color":"#293c55","width":1}},"radar":{"symbolSize":4,"itemStyle":{"normal":{"borderWidth":1}},"smooth":false,"symbol":"emptyCircle","lineStyle":{"normal":{"width":2}}},"logAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(2,2,2,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"textStyle":{},"gauge":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"boxplot":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"color":["#e01f54","#001852","#f5e8c8","#b8d2c7","#c6b38e","#a4d8c2","#f3d999","#d3758f","#dcc392","#2e4783","#82b6e9","#ff6347","#a092f1","#0a915d","#eaf889","#6699FF","#ff6666","#3cb371","#d5b158","#38b6b6"],"title":{"textStyle":{"color":"#333333"},"subtextStyle":{"color":"#aaaaaa"}},"dataZoom":{"dataBackgroundColor":"rgba(47,69,84,0.3)","textStyle":{"color":"#333333"},"handleSize":"100%","handleColor":"#a7b7cc","fillerColor":"rgba(167,183,204,0.4)","backgroundColor":"rgba(47,69,84,0)"},"timeAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(2,2,2,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"legend":{"textStyle":{"color":"#333333"}}},"yAxis":[{"splitNumber":5,"axisLabel":{"show":true,"interval":"auto","rotate":0,"inside":false,"formatter":"{value}","margin":8},"scale":true,"gridIndex":0,"minInterval":0,"zlevel":0,"triggerEvent":false,"z":0,"inverse":false,"nameLocation":"middle","nameGap":30,"silent":true}],"toolbox":{"feature":{},"orient":"vertical","itemSize":15,"height":"auto","zlevel":0,"z":2,"itemGap":20,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"ec_width":8,"ec_height":4,"tooltip":{"triggerOn":"mousemove","enterable":true,"borderColor":"#333","transitionDuration":0.4,"hideDelay":1,"padding":5,"showDelay":0,"borderWidth":0,"showContent":true,"backgroundColor":"rgba(50,50,50,0.7)","trigger":"item","alwaysShowContent":false,"confine":false,"show":true},"grid":[{"height":"auto","show":false,"width":"auto","backgroundColor":"transparent"}],"title":[{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true}],"ec_renderer":"canvas"}        );
</script>
