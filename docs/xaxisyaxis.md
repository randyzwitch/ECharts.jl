---

layout: minimal
title: xAxis!/yAxis!

---

## xAxis!/yAxis!

The `xAxis!` and `yAxis!` functions are just convenience functions around the `Axis` type, so that end-users don't need to reference `ec.yAxis` or `ec.xAxis` directly (though, nothing prevents users modifying the `EChart` chart instance).

### Function Keywords
{% highlight julia %}
ec::EChart
_type::Union{AbstractString, Void} = nothing
data::Union{AbstractVector, Void} = []
boundaryGap::Union{Bool, Void} = nothing
min::Union{Number, Void} = nothing
max::Union{Number, Void} = nothing
show::Bool = true
gridIndex::Union{Int,Void} = 0
position::Union{String,Void} = nothing
name::Union{String,Void} = nothing
nameLocation::Union{String,Void} = "middle"
nameTextStyle::Union{TextStyle,Void} = nothing
nameGap::Union{Int,Void} = 30
inverse::Union{Bool,Void} = false
scale::Union{Bool,Void} = false
splitNumber::Union{Int,Void} = 5
minInterval::Union{Int,Void} = 0
interval::Union{Int,Void} = nothing
silent::Union{Bool,Void} = true
axisLine::Union{AxisLine,Void} = nothing
axisTick::Union{AxisTick,Void} = nothing
axisLabel::Union{AxisLabel,Void} = nothing
splitLine::Union{SplitLine,Void} = nothing
splitArea::Union{SplitArea,Void} = nothing
{% endhighlight %}

## Log Scale on Axis
{% highlight julia %}
using ECharts
x = 1:10
y = [2^x for x in x]
l = line(x, y)
yAxis!(l, _type = "log", scale = true)
{% endhighlight %}

<div id="logscale" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("logscale"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":[1,2,3,4,5,6,7,8,9,10],"inverse":false,"type":"category","nameLocation":"middle","nameGap":30}],"yAxis":[{"scale":true,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"log","nameLocation":"middle","nameGap":50}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":20,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"ec_width":800,"ec_height":400,"ec_charttype":"xy plot","title":[{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true}],"series":[{"name":"Series 1","data":[2,4,8,16,32,64,128,256,512,1024],"smooth":false,"minSize":"0%","type":"line","maxSize":"100%"}]});
</script>

## (Re-)Scale axis to not include zero
{% highlight julia %}
using ECharts
data = [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960]
b = box(data, horizontal = true)
xAxis!(b, scale = true)
{% endhighlight %}

<div id="hbp" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("hbp"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":true,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"middle","nameGap":30}],"yAxis":[{"splitNumber":5,"boundaryGap":true,"data":["1"],"scale":false,"gridIndex":0,"minInterval":0,"inverse":false,"nameLocation":"middle","nameGap":30,"silent":true,"type":"category"}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":20,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"ec_width":800,"ec_height":400,"ec_charttype":"box","title":[{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true}],"series":[{"name":"boxplot","data":[[655.0,850.0,940.0,980.0,1175.0]],"smooth":false,"minSize":"0%","type":"boxplot","maxSize":"100%"},{"name":"outliers","data":[[650.0,"1"]],"smooth":false,"minSize":"0%","type":"scatter","maxSize":"100%"}]});
</script>
