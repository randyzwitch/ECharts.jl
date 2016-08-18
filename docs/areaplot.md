---

layout: minimal
title: ECharts.jl - A Julia package for generating visualizations using ECharts

---
## Area Plot

### Function Keywords
{% highlight julia %}
x::AbstractVector = [ ]
y::AbstractArray = [ ]
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
areaplot(x = x, y = y)
{% endhighlight %}


<div id="areaplot" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("areaplot"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"boundaryGap":false,"show":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"type":"category"}],"yAxis":[{"show":true,"type":"value"}],"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"areaStyle":{"normal":{}},"data":[11,11,15,13,12,13,10],"smooth":false,"type":"line"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>

## Multiple Series
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
y2 = 3.7 .* y
areaplot(x = x, y = hcat(y, y2))
{% endhighlight %}

<div id="areaplot2" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("areaplot2"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"splitNumber":5,"boundaryGap":false,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"scale":false,"gridIndex":0,"minInterval":0,"inverse":false,"nameLocation":"start","nameGap":15,"silent":true,"type":"category"}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"backgroundColor":"transparent","shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"areaStyle":{"normal":{}},"data":[11.0,11.0,15.0,13.0,12.0,13.0,10.0],"smooth":false,"minSize":"0%","type":"line","maxSize":"100%"},{"areaStyle":{"normal":{}},"data":[40.7,40.7,55.5,48.1,44.400000000000006,48.1,37.0],"smooth":false,"minSize":"0%","type":"line","maxSize":"100%"}]});
</script>
