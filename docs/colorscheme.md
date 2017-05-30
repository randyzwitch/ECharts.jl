---
title: colorscheme!
sidebar: mydoc_sidebar
permalink: /colorscheme
---

## Method Signatures
{% highlight julia %}
ec::EChart
{% endhighlight %}

## Optional Arguments
{% highlight julia %}
palette::Union{Tuple{AbstractString,Any}, AbstractString, AbstractVector, JSFunction, Void} = nothing
reversePalette::Bool = false
{% endhighlight %}

## Examples

### `palette`
{% highlight julia %}
using ECharts
names = ["sales", "administration", "information technology", "customer support", "development",
"marketing"]
max = [6500, 16000, 30000, 38000, 52000, 25000]
values = [4300, 10000, 28000, 35000, 50000, 19000]
values2 = 0.7 .* values
r = radar(names, hcat(values, values2), max, fill = [false, true])
colorscheme!(r, palette = ("acw", "JapaneseGarden"))
{% endhighlight %}

<div id="color1" style="height:400px;width:800px;"></div>
<script type="text/javascript">

    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("color1"), JSON.parse(roma()));

    // Load data into the ECharts instance
    myChart.setOption(
{"ec_charttype":"radar","series":[{"name":"Series 1","yAxisIndex":0,"xAxisIndex":0,"smooth":false,"data":[{"value":[4300.0,10000.0,28000.0,35000.0,50000.0,19000.0]}],"type":"radar"},{"name":"Series 2","yAxisIndex":0,"areaStyle":{"normal":{"shadowOffsetY":0,"shadowOffsetX":0}},"xAxisIndex":0,"smooth":false,"data":[{"value":[3010.0,7000.0,19600.0,24500.0,35000.0,13300.0]}],"type":"radar"}],"theme":{"geo":{"label":{"normal":{"textStyle":{"color":"#000000"}},"emphasis":{"textStyle":{"color":"rgb(100,0,0)"}}},"itemStyle":{"normal":{"borderColor":"#444444","borderWidth":0.5,"areaColor":"#eeeeee"},"emphasis":{"borderColor":"#444444","borderWidth":1,"areaColor":"rgba(255,215,0,0.8)"}}},"parallel":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"markPoint":{"label":{"normal":{"textStyle":{"color":"#eeeeee"}},"emphasis":{"textStyle":{"color":"#eeeeee"}}}},"visualMap":{"color":["#e01f54","#e7dbc3"]},"funnel":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"bar":{"itemStyle":{"normal":{"barBorderColor":"#ccc","barBorderWidth":0},"emphasis":{"barBorderColor":"#ccc","barBorderWidth":0}}},"map":{"label":{"normal":{"textStyle":{"color":"#000000"}},"emphasis":{"textStyle":{"color":"rgb(100,0,0)"}}},"itemStyle":{"normal":{"borderColor":"#444444","borderWidth":0.5,"areaColor":"#eeeeee"},"emphasis":{"borderColor":"#444444","borderWidth":1,"areaColor":"rgba(255,215,0,0.8)"}}},"scatter":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"pie":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"graph":{"label":{"normal":{"textStyle":{"color":"#eeeeee"}}},"symbolSize":4,"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"}},"smooth":false,"symbol":"emptyCircle","color":["#e01f54","#001852","#f5e8c8","#b8d2c7","#c6b38e","#a4d8c2","#f3d999","#d3758f","#dcc392","#2e4783","#82b6e9","#ff6347","#a092f1","#0a915d","#eaf889","#6699FF","#ff6666","#3cb371","#d5b158","#38b6b6"],"lineStyle":{"normal":{"color":"#aaaaaa","width":1}}},"backgroundColor":"rgba(0,0,0,0)","line":{"symbolSize":4,"itemStyle":{"normal":{"borderWidth":1}},"smooth":false,"symbol":"emptyCircle","lineStyle":{"normal":{"width":2}}},"candlestick":{"itemStyle":{"normal":{"borderColor0":"#b8d2c7","color":"#e01f54","borderColor":"#f5e8c8","borderWidth":1,"color0":"#001852"}}},"sankey":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"valueAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"toolbox":{"iconStyle":{"normal":{"borderColor":"#999999"},"emphasis":{"borderColor":"#666666"}}},"categoryAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":false,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"tooltip":{"axisPointer":{"crossStyle":{"color":"#cccccc","width":1},"lineStyle":{"color":"#cccccc","width":1}}},"timeline":{"label":{"normal":{"textStyle":{"color":"#293c55"}},"emphasis":{"textStyle":{"color":"#293c55"}}},"controlStyle":{"normal":{"color":"#293c55","borderColor":"#293c55","borderWidth":0.5},"emphasis":{"color":"#293c55","borderColor":"#293c55","borderWidth":0.5}},"checkpointStyle":{"color":"#e43c59","borderColor":"rgba(194,53,49,0.5)"},"itemStyle":{"normal":{"color":"#293c55","borderWidth":1},"emphasis":{"color":"#a9334c"}},"lineStyle":{"color":"#293c55","width":1}},"radar":{"symbolSize":4,"itemStyle":{"normal":{"borderWidth":1}},"smooth":false,"symbol":"emptyCircle","lineStyle":{"normal":{"width":2}}},"logAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"textStyle":{},"gauge":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"boxplot":{"itemStyle":{"normal":{"borderWidth":1},"emphasis":{"borderWidth":2}}},"color":["#e01f54","#001852","#f5e8c8","#b8d2c7","#c6b38e","#a4d8c2","#f3d999","#d3758f","#dcc392","#2e4783","#82b6e9","#ff6347","#a092f1","#0a915d","#eaf889","#6699FF","#ff6666","#3cb371","#d5b158","#38b6b6"],"title":{"textStyle":{"color":"#333333"},"subtextStyle":{"color":"#aaaaaa"}},"dataZoom":{"backgroundColor":"rgba(47,69,84,0)","textStyle":{"color":"#333333"},"handleSize":"100%","handleColor":"#a7b7cc","fillerColor":"rgba(167,183,204,0.4)","dataBackgroundColor":"rgba(47,69,84,0.3)"},"timeAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"legend":{"textStyle":{"color":"#333333"}}},"toolbox":{"feature":{},"orient":"vertical","itemSize":15,"height":"auto","zlevel":0,"z":2,"itemGap":20,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"ec_width":800,"ec_height":400,"grid":[{"height":"auto","show":false,"width":"auto","backgroundColor":"transparent"}],"radar":[{"startAngle":90,"zlevel":0,"radius":"75%","indicator":[{"name":"sales","max":6500},{"name":"administration","max":16000},{"name":"information technology","max":30000},{"name":"customer support","max":38000},{"name":"development","max":52000},{"name":"marketing","max":25000}],"center":["50%","50%"],"z":2,"silent":true,"nameGap":15}],"color":["#D8CAA8","#5C832F","#284907","#382513","#363942"],"title":[{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true}],"legend":{"itemWidth":25,"data":["Series 1","Series 2"],"borderColor":"transparent","orient":"horizontal","bottom":"auto","height":"auto","zlevel":0,"padding":5,"borderWidth":1,"inactiveColor":"#ccc","z":2,"align":"auto","itemGap":10,"itemHeight":14,"backgroundColor":"transparent","shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","width":"auto","selectedMode":true,"show":true}}
        );
</script>

### `palette` and `reversePalette`

{% highlight julia %}
using ECharts
v = [100,60,80,70,50]
n = ["A", "B", "C", "D", "E"]
fn = funnel(n, v)
colorscheme!(fn,  palette = ("acw", "VitaminC"), reversePalette = true)
{% endhighlight %}


<div id="color2" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("color2"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"color":["#FD7400","#FFE11A","#BEDB39","#1F8A70","#004358"],"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[{"name":"A","value":100},{"name":"B","value":60},{"name":"C","value":80},{"name":"D","value":70},{"name":"E","value":50}],"smooth":false,"minSize":"0%","type":"funnel","maxSize":"100%"}]});
</script>
