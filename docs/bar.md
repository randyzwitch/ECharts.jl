---

layout: minimal
title: bar

---

## Bar Plot

### Function Keywords
{% highlight julia %}
x::AbstractVector
y::AbstractArray
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bar(x, y)
{% endhighlight %}

<div id="barplot" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("barplot"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"show":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"type":"category"}],"yAxis":[{"show":true,"type":"value"}],"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[11,11,15,13,12,13,10],"smooth":false,"type":"bar"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>

## Single Series - kwargs...
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bar(x, y, color = ["green"])
{% endhighlight %}

<div id="barplotc" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("barplotc"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"color":["green"],"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[11,11,15,13,12,13,10],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"}]});
</script>

## Multiple Series
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bar(x, hcat(y,y,y))
{% endhighlight %}

<div id="barplot2" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("barplot2"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"backgroundColor":"transparent","shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[11,11,15,13,12,13,10],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"data":[11,11,15,13,12,13,10],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"data":[11,11,15,13,12,13,10],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"}]});
</script>
