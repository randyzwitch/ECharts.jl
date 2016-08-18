---

layout: minimal
title: ECharts.jl - A Julia package for generating visualizations using ECharts

---

## Scatter Plot

### Function Keywords
{% highlight julia %}
x::AbstractVector = []
y::AbstractVector = []
{% endhighlight %}

### Code
{% highlight julia %}
using ECharts
scatterplot(x = 1:30, y = rand(30))
{% endhighlight %}

<div id="scatter" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("scatter"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"show":true,"data":[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,27.0,28.0,29.0,30.0],"type":"category"}],"yAxis":[{"show":true,"type":"value"}],"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[0.28349037481431383,0.7779501781342211,0.5034440179017441,0.025535025772706055,0.6183463419067843,0.4288179088209456,0.2634386479202955,0.05255994192478419,0.3957871564877886,0.1980999405728805,0.21219556161459274,0.39069746174715525,0.1331723440449284,0.31737347363879564,0.9733990953658405,0.6857222361850577,0.5501104994151236,0.8740011821737608,0.21468315301631802,0.8186274264041322,0.9676316667608766,0.5812029667394709,0.8919983593065945,0.29503481636592777,0.6710642075732647,0.04064753977127866,0.20677311746585803,0.11074273794658196,0.5734841870800895,0.607140501804825],"smooth":false,"type":"scatter"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>
