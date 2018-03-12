---
title: ECharts.jl
sidebar: mydoc_sidebar
permalink: /index.html
---

The [ECharts.jl](https://github.com/randyzwitch/ECharts.jl) package provides a Julia wrapper around the [ECharts 4 JavaScript library](http://echarts.baidu.com/download.html) from [Baidu](http://www.baidu.com/).

In particular, ECharts.jl provides:

* High-level functions for quickly creating visualizations such as bar charts, area charts, line charts and others
* Support for ColorBrewer color scales via the [ColorBrewer.jl](https://github.com/timothyrenner/ColorBrewer.jl) package and other fun colors via the [NoveltyColors.jl](https://github.com/randyzwitch/NoveltyColors.jl) package, for visually stunning color schemes
* Inline output via [IJulia (Jupyter Notebook)](https://github.com/JuliaLang/IJulia.jl) and [Juno](https://junolab.github.io/), and REPL support via [Blink.jl](https://github.com/JunoLab/Blink.jl)

## Motivation

The idea behind the API of ECharts.jl is _simplicity_; while it is possible to build complex graphics in ECharts.jl, the goal of this package is to provide a means of creating common visualizations with a minimum of configuration and syntax. This is achieved through:

* A minimum of required arguments to create a chart (i.e. usually, only data are required), with common optional arguments defined based on the chart type
* Sensible/opinionated defaults, such as a legend only being shown when two or more series plotted and tooltip-on-hover enabled automatically.
* Integrated [`missing`](https://github.com/JuliaData/Missings.jl) value support (see chart docs for implementation details)
* Tight integration with the [echarts4](https://ecomfe.github.io/echarts-doc/public/en/index.html) JavaScript library, which provides rich interactivity (i.e. sliders, hover, toolbox, themes) as default

## Workflow

1. Choose a base chart type
2. (Optional) Use one of more visualization mutating functions (the functions with a `!` on the end) to modify the base chart
3. (Optional) Set individual fields in the resulting `EChart` composite type for even more refinement

For example, to create an area chart with gradient shading (`lineargradient`), a smoothed line (`smooth!`) and label the axes (`xaxis!/yaxis!`):

{% highlight julia %}
#Define data
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]

#Step 1: Choose a base chart type
ar = area(x, y, color = lineargradient("purple", "cyan"))

#Step 2: Apply visualization mutating functions
smooth!(ar)
xaxis!(ar, name = "Day of Week")
yaxis!(ar, name = "Daily High Temperature °C")
{% endhighlight %}

<div id="areaex" style="height:400px;width:800px;"></div>
<script type="text/javascript">

    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("areaex"), JSON.parse(roma()));


    myChart.setOption({"xAxis":[{"splitNumber":5,"boundaryGap":false,"axisLabel":{"show":true,"interval":"auto","rotate":0,"inside":false,"formatter":"{value}","margin":8},"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"scale":false,"gridIndex":0,"name":"Day of Week","minInterval":0,"zlevel":0,"triggerEvent":false,"z":0,"inverse":false,"nameLocation":"middle","nameGap":30,"silent":true,"type":"category"}],"ec_charttype":"xy plot","series":[{"name":"Series 1","yAxisIndex":0,"areaStyle":{},"xAxisIndex":0,"smooth":true,"data":[11,11,15,13,12,13,10],"markLine":{"data":[],"lineStyle":{}},"type":"line"}],"theme":{"geo":{"label":{"normal":{"textStyle":{"color":"#000000"}},"emphasis":{"textStyle":{"color":"rgb(100,0,0)"}}},"itemStyle":{"normal":{"borderColor":"#444444","borderWidth":0.5,"areaColor":"#eeeeee"},"emphasis":{"borderColor":"#444444","borderWidth":1,"areaColor":"rgba(255,215,0,0.8)"}}},"parallel":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"markPoint":{"label":{"normal":{"textStyle":{"color":"#eeeeee"}},"emphasis":{"textStyle":{"color":"#eeeeee"}}}},"visualMap":{"color":["#e01f54","#e7dbc3"]},"funnel":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"bar":{"itemStyle":{"normal":{"barBorderColor":"#ccc","barBorderWidth":0},"emphasis":{"barBorderColor":"#ccc","barBorderWidth":0}}},"map":{"label":{"normal":{"textStyle":{"color":"#000000"}},"emphasis":{"textStyle":{"color":"rgb(100,0,0)"}}},"itemStyle":{"normal":{"borderColor":"#444444","borderWidth":0.5,"areaColor":"#eeeeee"},"emphasis":{"borderColor":"#444444","borderWidth":1,"areaColor":"rgba(255,215,0,0.8)"}}},"scatter":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"pie":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"graph":{"label":{"normal":{"textStyle":{"color":"#eeeeee"}}},"symbolSize":4,"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"}},"smooth":false,"symbol":"emptyCircle","color":["#e01f54","#001852","#f5e8c8","#b8d2c7","#c6b38e","#a4d8c2","#f3d999","#d3758f","#dcc392","#2e4783","#82b6e9","#ff6347","#a092f1","#0a915d","#eaf889","#6699FF","#ff6666","#3cb371","#d5b158","#38b6b6"],"lineStyle":{"normal":{"color":"#aaaaaa","width":1}}},"backgroundColor":"rgba(0,0,0,0)","line":{"symbolSize":4,"itemStyle":{"normal":{"borderWidth":1}},"smooth":false,"symbol":"emptyCircle","lineStyle":{"normal":{"width":2}}},"candlestick":{"itemStyle":{"normal":{"borderColor0":"#b8d2c7","color":"#e01f54","borderColor":"#f5e8c8","borderWidth":1,"color0":"#001852"}}},"sankey":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"valueAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"toolbox":{"iconStyle":{"normal":{"borderColor":"#999999"},"emphasis":{"borderColor":"#666666"}}},"categoryAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":false,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"tooltip":{"axisPointer":{"crossStyle":{"color":"#cccccc","width":1},"lineStyle":{"color":"#cccccc","width":1}}},"timeline":{"label":{"normal":{"textStyle":{"color":"#293c55"}},"emphasis":{"textStyle":{"color":"#293c55"}}},"controlStyle":{"normal":{"color":"#293c55","borderColor":"#293c55","borderWidth":0.5},"emphasis":{"color":"#293c55","borderColor":"#293c55","borderWidth":0.5}},"checkpointStyle":{"color":"#e43c59","borderColor":"rgba(194,53,49,0.5)"},"itemStyle":{"normal":{"color":"#293c55","borderWidth":1},"emphasis":{"color":"#a9334c"}},"lineStyle":{"color":"#293c55","width":1}},"radar":{"symbolSize":4,"itemStyle":{"normal":{"borderWidth":1}},"smooth":false,"symbol":"emptyCircle","lineStyle":{"normal":{"width":2}}},"logAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"textStyle":{},"gauge":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"boxplot":{"itemStyle":{"normal":{"borderWidth":0,"borderColor":"#ccc"},"emphasis":{"borderWidth":0,"borderColor":"#ccc"}}},"color":["#e01f54","#001852","#f5e8c8","#b8d2c7","#c6b38e","#a4d8c2","#f3d999","#d3758f","#dcc392","#2e4783","#82b6e9","#ff6347","#a092f1","#0a915d","#eaf889","#6699FF","#ff6666","#3cb371","#d5b158","#38b6b6"],"title":{"textStyle":{"color":"#333333"},"subtextStyle":{"color":"#aaaaaa"}},"dataZoom":{"dataBackgroundColor":"rgba(47,69,84,0.3)","textStyle":{"color":"#333333"},"handleSize":"100%","handleColor":"#a7b7cc","fillerColor":"rgba(167,183,204,0.4)","backgroundColor":"rgba(47,69,84,0)"},"timeAxis":{"axisLine":{"show":true,"lineStyle":{"color":"#333"}},"axisLabel":{"textStyle":{"color":"#333"},"show":true},"splitLine":{"show":true,"lineStyle":{"color":["#ccc"]}},"splitArea":{"areaStyle":{"color":["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"]},"show":false},"axisTick":{"show":true,"lineStyle":{"color":"#333"}}},"legend":{"textStyle":{"color":"#333333"}}},"yAxis":[{"splitNumber":5,"axisLabel":{"show":true,"interval":"auto","rotate":0,"inside":false,"formatter":"{value}","margin":8},"scale":false,"gridIndex":0,"name":"Daily High Temperature °C","minInterval":0,"zlevel":0,"triggerEvent":false,"z":0,"inverse":false,"nameLocation":"middle","nameGap":50,"silent":true,"type":"value"}],"toolbox":{"feature":{},"orient":"vertical","itemSize":15,"height":"auto","zlevel":0,"z":2,"itemGap":20,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"ec_width":800,"ec_height":400,"tooltip":{"triggerOn":"mousemove","enterable":true,"borderColor":"#333","transitionDuration":0.4,"hideDelay":100,"padding":5,"showDelay":0,"borderWidth":0,"showContent":true,"backgroundColor":"rgba(50,50,50,0.7)","trigger":"item","alwaysShowContent":false,"confine":false,"show":true},"grid":[{"height":"auto","show":false,"width":"auto","backgroundColor":"transparent"}],"color":[new echarts.graphic.LinearGradient(0, 0, 0, 1, [{offset: 0, color: 'purple'}, {offset: 1, color: 'cyan'}])],"title":[{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true}],"ec_renderer":"canvas"});

</script>

To learn more about specific features, see the Table of Contents on the left sidebar. For inspiration, see the Baidu [demos](https://ecomfe.github.io/echarts-examples/public/index.html) to see what is (likely) possible and the [user-submitted gallery](http://gallery.echartsjs.com/explore.html) (may require additional JS libraries not implemented in Julia).
