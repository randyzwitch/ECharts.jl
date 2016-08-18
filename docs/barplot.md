---

layout: minimal
title: ECharts.jl - A Julia package for generating visualizations using ECharts

---

## Bar Plot

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
barplot(x = x, y = y)
{% endhighlight %}

<div id="barplot" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("barplot"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"show":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"type":"category"}],"yAxis":[{"show":true,"type":"value"}],"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[11,11,15,13,12,13,10],"smooth":false,"type":"bar"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>
