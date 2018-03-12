---
title: Waterfall
sidebar: mydoc_sidebar
permalink: /waterfall
---
This function is just a convenience function around the `bar` function with `stacked = true` and the offset series color set as `transparent` in order to give the waterfall chart effect.

Pass in your values as you expect to see them on the chart, positive or negative and in order. The function will do the offset calculations and the total calculation and automatically add them to the chart.

## Method Signatures
{% highlight julia %}
waterfall(x::AbstractVector, y::AbstractVector{<:Real}})
{% endhighlight %}

## Optional Arguments
{% highlight julia %}
legend::Bool = false
scale::Bool = false
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Missing Value Support

Missing values are not supported in `waterfall()`; if there is no change in values between steps, use a value of `0` instead of `missing`.

## Examples

### Single Series
{% highlight julia %}
using ECharts
x = 1:5
y = [2900, -1200, -300, -200, -900]
w = waterfall(x, y)
{% endhighlight %}

<div id="waterf" style="height:400px;width:800px;"></div>
<script type="text/javascript">

    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("waterf"), JSON.parse(roma()));

    // Load data into the ECharts instance
    myChart.setOption(
{"xAxis":[{"splitNumber":5,"axisLabel":{"show":true,"interval":"auto","rotate":0,"inside":false,"formatter":"{value}","margin":8},"data":["1","2","3","4","5","total"],"scale":false,"gridIndex":0,"minInterval":0,"zlevel":0,"triggerEvent":false,"z":0,"inverse":false,"nameLocation":"middle","nameGap":30,"silent":true,"type":"category"}],"ec_charttype":"xy plot","series":[{"name":"Series 1","yAxisIndex":0,"itemStyle":{"barBorderColor":"transparent","color":"transparent"},"xAxisIndex":0,"stack":1,"smooth":false,"data":[0,1700,1400,1200,300,0],"markLine":{"data":[],"lineStyle":{}},"type":"bar"},{"name":"Series 2","yAxisIndex":0,"xAxisIndex":0,"stack":1,"smooth":false,"data":[2900,1200,300,200,900,300],"markLine":{"data":[],"lineStyle":{}},"type":"bar"}],"theme":{"geo":{"label":{"normal":{"textStyle":{"color":"#000000"}},"emphasis":{"textStyle":{"color":"rgb(100,0,0)"}}},"itemStyle":{"normal":{"borderColor":"#444444","borderWidth":0.5,"areaColor":"#eeeeee"},"emphasis":{"borderColor":"#444444","borderWidth":1,"areaColor":"rgba(255,215,0,0.8)"}}},"parallel":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"markPoint":{"label":{"normal":{"textStyle":{"color":"#eeeeee"}},"emphasis":{"textStyle":{"color":"#eeeeee"}}}},"visualMap":{"color":["#e01f54","#e7dbc3"]},"funnel":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"bar":{"itemStyle":{"normal":{"barBorderColor":"#ccc","barBorderWidth":0},"emphasis":{"barBorderColor":"#ccc","barBorderWidth":0}}},"map":{"label":{"normal":{"textStyle":{"color":"#000000"}},"emphasis":{"textStyle":{"color":"rgb(100,0,0)"}}},"itemStyle":{"normal":{"borderColor":"#444444","borderWidth":0.5,"areaColor":"#eeeeee"},"emphasis":{"borderColor":"#444444","borderWidth":1,"areaColor":"rgba(255,215,0,0.8)"}}},"scatter":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"pie":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"graph":{"label":{"normal":{"textStyle":{"color":"#eeeeee"}}},"symbolSize":4,"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"}},"smooth":false,"symbol":"emptyCircle","color":["#e01f54","#001852","#f5e8c8","#b8d2c7","#c6b38e","#a4d8c2","#f3d999","#d3758f","#dcc392","#2e4783","#82b6e9","#ff6347","#a092f1","#0a915d","#eaf889","#6699FF","#ff6666","#3cb371","#d5b158","#38b6b6"],"lineStyle":{"normal":{"color":"#aaaaaa","width":1}}},"backgroundColor":"rgba(0,0,0,0)","line":{"symbolSize":4,"itemStyle":{"normal":{"borderWidth":1}},"smooth":false,"symbol":"emptyCircle","lineStyle":{"normal":{"width":2}}},"candlestick":{"itemStyle":{"normal":{"borderColor0":"#b8d2c7","color":"#e01f54","borderColor":"#f5e8c8","borderWidth":1,"color0":"#001852"}}},"sankey":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"valueAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"toolbox":{"iconStyle":{"normal":{"borderColor":"#999999"},"emphasis":{"borderColor":"#666666"}}},"categoryAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":false,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"tooltip":{"axisPointer":{"crossStyle":{"color":"#cccccc","width":1},"lineStyle":{"color":"#cccccc","width":1}}},"timeline":{"label":{"normal":{"textStyle":{"color":"#293c55"}},"emphasis":{"textStyle":{"color":"#293c55"}}},"controlStyle":{"normal":{"color":"#293c55","borderColor":"#293c55","borderWidth":0.5},"emphasis":{"color":"#293c55","borderColor":"#293c55","borderWidth":0.5}},"checkpointStyle":{"color":"#e43c59","borderColor":"rgba(194,53,49,0.5)"},"itemStyle":{"normal":{"color":"#293c55","borderWidth":1},"emphasis":{"color":"#a9334c"}},"lineStyle":{"color":"#293c55","width":1}},"radar":{"symbolSize":4,"itemStyle":{"normal":{"borderWidth":1}},"smooth":false,"symbol":"emptyCircle","lineStyle":{"normal":{"width":2}}},"logAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"textStyle":{},"gauge":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"boxplot":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"color":["#e01f54","#001852","#f5e8c8","#b8d2c7","#c6b38e","#a4d8c2","#f3d999","#d3758f","#dcc392","#2e4783","#82b6e9","#ff6347","#a092f1","#0a915d","#eaf889","#6699FF","#ff6666","#3cb371","#d5b158","#38b6b6"],"title":{"textStyle":{"color":"#333333"},"subtextStyle":{"color":"#aaaaaa"}},"dataZoom":{"dataBackgroundColor":"rgba(47,69,84,0.3)","textStyle":{"color":"#333333"},"handleSize":"100%","handleColor":"#a7b7cc","fillerColor":"rgba(167,183,204,0.4)","backgroundColor":"rgba(47,69,84,0)"},"timeAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"legend":{"textStyle":{"color":"#333333"}}},"yAxis":[{"splitNumber":5,"axisLabel":{"show":true,"interval":"auto","rotate":0,"inside":false,"formatter":"{value}","margin":8},"scale":false,"gridIndex":0,"minInterval":0,"zlevel":0,"triggerEvent":false,"z":0,"inverse":false,"nameLocation":"middle","nameGap":50,"silent":true,"type":"value"}],"toolbox":{"feature":{},"orient":"vertical","itemSize":15,"height":"auto","zlevel":0,"z":2,"itemGap":20,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"ec_width":800,"ec_height":400,"tooltip":{"triggerOn":"mousemove","enterable":true,"borderColor":"#333","transitionDuration":0.4,"hideDelay":100,"padding":5,"showDelay":0,"borderWidth":0,"showContent":true,"backgroundColor":"rgba(50,50,50,0.7)","trigger":"item","alwaysShowContent":false,"confine":false,"show":true},"grid":[{"height":"auto","show":false,"width":"auto","backgroundColor":"transparent"}],"title":[{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true}],"ec_renderer":"canvas"}        );
</script>
