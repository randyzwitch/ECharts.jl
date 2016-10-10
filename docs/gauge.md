---

layout: minimal
title: gauge

---

## Gauge

### Function Keywords
{% highlight julia %}
x::Number
legend::Bool = false
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
gauge(27.64)
{% endhighlight %}

<div id="gaugep" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("gaugep"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[{"value":27.64}],"smooth":false,"type":"gauge"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>
