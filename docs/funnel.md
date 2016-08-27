---

layout: minimal
title: ECharts.jl - A Julia package for generating visualizations using ECharts

---

## Funnel

### Function Keywords
{% highlight julia %}
names::AbstractVector
values::AbstractVector
varargs...
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
v = [100,60,80,70,50]
n = ["A", "B", "C", "D", "E"]
funnel(names, values)
{% endhighlight %}

<div id="funnelp" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("funnelp"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"backgroundColor":"transparent","shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[{"name":"A","selected":false,"value":100},{"name":"B","selected":false,"value":60},{"name":"C","selected":false,"value":80},{"name":"D","selected":false,"value":70},{"name":"E","selected":false,"value":50}],"smooth":false,"minSize":"0%","type":"funnel","maxSize":"100%"}]});
</script>
