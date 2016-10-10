---

layout: minimal
title: line

---

## Line Plot

### Function Keywords
{% highlight julia %}
x::AbstractVector
y::AbstractArray
step::Union{String, Void} = nothing #{"start", "middle", "end"}
legend::Bool = false
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
line(x, y)
{% endhighlight %}

<div id="lineplot" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("lineplot"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"show":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"type":"category"}],"yAxis":[{"show":true,"type":"value"}],"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[11,11,15,13,12,13,10],"smooth":false,"type":"line"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>

## Single Series (step = "end")
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
line(x, y, step = "end")
{% endhighlight %}

<div id="lineplot_end" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("lineplot_end"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"step":"end","data":[11,11,15,13,12,13,10],"smooth":false,"minSize":"0%","type":"line","maxSize":"100%"}]});
</script>

## Multiple Series
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
y2 = 0.6 .* y
line(x, hcat(y, y2))
{% endhighlight %}

<div id="lineplot2" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("lineplot2"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"backgroundColor":"transparent","shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[11.0,11.0,15.0,13.0,12.0,13.0,10.0],"smooth":false,"minSize":"0%","type":"line","maxSize":"100%"},{"data":[6.6,6.6,9.0,7.8,7.199999999999999,7.8,6.0],"smooth":false,"minSize":"0%","type":"line","maxSize":"100%"}]});
</script>
