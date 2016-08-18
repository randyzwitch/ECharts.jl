---

layout: minimal
title: ECharts.jl - A Julia package for generating visualizations using ECharts

---

## Pie/Donut/Rose Chart

### Function Keywords
{% highlight julia %}
names::AbstractVector = []
values::AbstractVector = []
selected::AbstractVector = []
radius::Union{AbstractVector, AbstractString, Void} = "90%",
center::Union{AbstractVector, AbstractString, Void} = ["50%", "50%"]
roseType::Union{AbstractString, Void} = nothing
{% endhighlight %}

### Code
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
piechart(values = y, names = x)
{% endhighlight %}

<div id="pie" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("pie"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[{"name":"Monday","selected":false,"value":11},{"name":"Tuesday","selected":false,"value":11},{"name":"Wednesday","selected":false,"value":15},{"name":"Thursday","selected":false,"value":13},{"name":"Friday","selected":false,"value":12},{"name":"Saturday","selected":false,"value":13},{"name":"Sunday","selected":false,"value":10}],"smooth":false,"radius":"90%","center":["50%","50%"],"type":"pie"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>

## Pie Chart - Exploded

### Code
{% highlight julia %}
using ECharts
values = [335, 310, 234, 135, 1548]
names = ["direct interview", "email marketing", "advertising alliance", "video ads", "search engine"]
explode = [true, false, false, false, false]
piechart(values = values, names = names, selected = explode)
{% endhighlight %}

<div id="piex" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("piex"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[{"name":"direct interview","selected":true,"value":335},{"name":"email marketing","selected":false,"value":310},{"name":"advertising alliance","selected":false,"value":234},{"name":"video ads","selected":false,"value":135},{"name":"search engine","selected":false,"value":1548}],"smooth":false,"radius":"90%","center":["50%","50%"],"type":"pie"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>

## Donut Chart

### Code
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
donutchart(values = y, names = x)
{% endhighlight %}

<div id="donut" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("donut"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[{"name":"Monday","selected":false,"value":11},{"name":"Tuesday","selected":false,"value":11},{"name":"Wednesday","selected":false,"value":15},{"name":"Thursday","selected":false,"value":13},{"name":"Friday","selected":false,"value":12},{"name":"Saturday","selected":false,"value":13},{"name":"Sunday","selected":false,"value":10}],"smooth":false,"radius":["50%","90%"],"type":"pie"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>

## Rose Chart - Angle

### Code
{% highlight julia %}
using ECharts
values = [335, 310, 234, 135, 1548]
names = ["direct interview", "email marketing", "advertising alliance", "video ads", "search engine"]
piechart(values = values, names = names, roseType = "angle")
{% endhighlight %}

<div id="roseangle" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("roseangle"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[{"name":"direct interview","selected":false,"value":335},{"name":"email marketing","selected":false,"value":310},{"name":"advertising alliance","selected":false,"value":234},{"name":"video ads","selected":false,"value":135},{"name":"search engine","selected":false,"value":1548}],"smooth":false,"radius":"90%","center":["50%","50%"],"type":"pie","roseType":"angle"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>

## Rose Chart - Radius

### Code
{% highlight julia %}
using ECharts
values = [335, 310, 234, 135, 1548]
names = ["direct interview", "email marketing", "advertising alliance", "video ads", "search engine"]
donutchart(values = values, names = names, roseType = "radius")
{% endhighlight %}

<div id="roseradius" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("roseradius"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[{"name":"direct interview","selected":false,"value":335},{"name":"email marketing","selected":false,"value":310},{"name":"advertising alliance","selected":false,"value":234},{"name":"video ads","selected":false,"value":135},{"name":"search engine","selected":false,"value":1548}],"smooth":false,"radius":["50%","90%"],"type":"pie","roseType":"radius"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>
