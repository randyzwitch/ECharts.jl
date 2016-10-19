---

layout: minimal
title: XY Combination Plots

---

## XY Combination Plots
The functions `area`, `bar`, `line`, and `scatter` are convenience wrappers
around a generic `xy_plot` function (not currently exported). Each function takes additional keyword
arguments such `mark` which can take an array of mark types. As such, to make a combination of a bar plot and line plot,
you can either specify `line`, `bar`, etc., then set the appropriate mark option to get the desired output.

### Function Keywords
{% highlight julia %}
x::AbstractVector
y::AbstractArray
mark::Union{String, AbstractVector} = "bar"
horizontal::Bool = false
legend::Bool = false
scale::Bool = false
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Bar Chart, Multiple Series
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bar(x, hcat(0.95 .* y, 1.25 .* y, y))
{% endhighlight %}

<div id="barchartm" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("barchartm"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[10.45,10.45,14.25,12.35,11.399999999999999,12.35,9.5],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"data":[13.75,13.75,18.75,16.25,15.0,16.25,12.5],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"data":[11.0,11.0,15.0,13.0,12.0,13.0,10.0],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"}]});
</script>

## Bar Chart and Line Chart Combination
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bar(x, hcat(0.95 .* y, 1.25 .* y, y), mark = ["line", "line", "bar"])
{% endhighlight %}

<div id="barchartm2" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("barchartm2"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[10.45,10.45,14.25,12.35,11.399999999999999,12.35,9.5],"smooth":false,"minSize":"0%","type":"line","maxSize":"100%"},{"data":[13.75,13.75,18.75,16.25,15.0,16.25,12.5],"smooth":false,"minSize":"0%","type":"line","maxSize":"100%"},{"data":[11.0,11.0,15.0,13.0,12.0,13.0,10.0],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"}]});
</script>
