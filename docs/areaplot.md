---

layout: minimal
title: ECharts.jl - A Julia package for generating visualizations using ECharts

---
## Area Plot

### Function Keywords
{% highlight julia %}
x::AbstractVector = []
y::AbstractVector = []
{% endhighlight %}

### Code
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
