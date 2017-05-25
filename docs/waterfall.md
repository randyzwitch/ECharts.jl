---
title: Waterfall
sidebar: mydoc_sidebar
permalink: /waterfall
---

This function is just a convenience function around the `bar` function with `stacked = true` and the offset series set as transparent in order to give the waterfall chart effect.

Pass in your values as you expect to see them on the chart, positive or negative and in order. The function will do the offset calculations and the total calculation and automatically add them to the chart.

### Function Keywords
{% highlight julia %}
x::AbstractVector
y::AbstractArray
legend::Bool = false
scale::Bool = false
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
x = 1:5
y = [2900, -1200, -300, -200, -900]
w = waterfall(x, y)
{% endhighlight %}

<div id="waterf" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("waterf"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["1","2","3","4","5","total"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"itemStyle":{"normal":{"shadowOffsetY":0,"shadowOffsetX":0,"barBorderColor":"transparent","color":"transparent","borderColor":"#000","borderWidth":0},"emphasis":{"shadowOffsetY":0,"shadowOffsetX":0,"barBorderColor":"transparent","color":"transparent","borderColor":"#000","borderWidth":0}},"stack":1,"data":[0,1700,1400,1200,300,0],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"stack":1,"data":[2900,1200,300,200,900,300],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"}]});
</script>
