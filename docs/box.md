---

layout: minimal
title: box

---

## Box Plot

### Function Keywords
{% highlight julia %}
data::Vector{T <: Real}{Union{T, Vector{T}}}
names::Union{AbstractVector, Void} = nothing
legend::Bool = false
horizontal::Bool = false
scale::Bool = false
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
data = [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960]
box(data)
{% endhighlight %}

<div id="boxp" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("boxp"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"splitNumber":5,"boundaryGap":true,"data":["1"],"scale":false,"gridIndex":0,"minInterval":0,"inverse":false,"nameLocation":"start","nameGap":15,"silent":true,"type":"category"}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"name":"boxplot","data":[[655.0,850.0,940.0,980.0,1175.0]],"smooth":false,"minSize":"0%","type":"boxplot","maxSize":"100%"},{"name":"outliers","data":[["1",650.0]],"smooth":false,"minSize":"0%","type":"scatter","maxSize":"100%"}]});
</script>

## Multiple Series
{% highlight julia %}
using ECharts
data = [
    [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960],
    [960, 940, 960, 940, 880, 800, 850, 880, 900, 840, 830, 790, 810, 880, 880, 830, 800, 790, 760, 800],
    [880, 880, 880, 860, 720, 720, 620, 860, 970, 950, 880, 910, 850, 870, 840, 840, 850, 840, 840, 840],
    [890, 810, 810, 820, 800, 770, 760, 740, 750, 760, 910, 920, 890, 860, 880, 720, 840, 850, 850, 780],
    [890, 840, 780, 810, 760, 810, 790, 810, 820, 850, 870, 870, 810, 740, 810, 940, 950, 800, 810, 870]
]

box(data)
{% endhighlight %}

<div id="box2p" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("box2p"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"splitNumber":5,"boundaryGap":true,"data":["1","2","3","4","5"],"scale":false,"gridIndex":0,"minInterval":0,"inverse":false,"nameLocation":"start","nameGap":15,"silent":true,"type":"category"}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"name":"boxplot","data":[[655.0,850.0,940.0,980.0,1175.0],[672.5,800.0,845.0,885.0,1012.5],[780.0,840.0,855.0,880.0,940.0],[621.25,767.5,815.0,865.0,1011.25],[713.75,807.5,810.0,870.0,963.75]],"smooth":false,"minSize":"0%","type":"boxplot","maxSize":"100%"},{"name":"outliers","data":[["1",650.0],["3",720.0],["3",720.0],["3",620.0],["3",970.0],["3",950.0]],"smooth":false,"minSize":"0%","type":"scatter","maxSize":"100%"}]});
</script>
