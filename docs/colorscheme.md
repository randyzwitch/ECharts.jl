---

layout: minimal
title: ECharts.jl - A Julia package for generating visualizations using ECharts

---

## colorscheme!

### Function Keywords
{% highlight julia %}
ec::EChart
palette::Union{Tuple{AbstractString,Any}, AbstractString, Array, Void} = nothing
reversePalette::Bool = false
{% endhighlight %}

### Examples
{% highlight julia %}
using ECharts
names = ["sales", "administration", "information technology", "customer support", "development", "marketing"]
max = [6500, 16000, 30000, 38000, 52000, 25000]
values = [4300, 10000, 28000, 35000, 50000, 19000]
values2 = 0.7 .* values
r = radarchart(names, hcat(values, values2), max, fill = [false, true])
colorscheme!(r, palette = ("acw", "JapaneseGarden"))
{% endhighlight %}


<div id="color1" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("color1"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"color":["#D8CAA8","#5C832F","#284907","#382513","#363942"],"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[{"value":[4300.0,10000.0,28000.0,35000.0,50000.0,19000.0]}],"smooth":false,"minSize":"0%","type":"radar","maxSize":"100%"},{"areaStyle":{"normal":{"shadowOffsetY":0,"shadowOffsetX":0}},"data":[{"value":[3010.0,7000.0,19600.0,24500.0,35000.0,13300.0]}],"smooth":false,"minSize":"0%","type":"radar","maxSize":"100%"}],"radar":{"startAngle":90,"zlevel":0,"radius":"75%","indicator":[{"name":"sales","max":6500},{"name":"administration","max":16000},{"name":"information technology","max":30000},{"name":"customer support","max":38000},{"name":"development","max":52000},{"name":"marketing","max":25000}],"center":["50%","50%"],"z":2,"silent":true,"nameGap":15}});
</script>

{% highlight julia %}
using ECharts
v = [100,60,80,70,50]
n = ["A", "B", "C", "D", "E"]
fn = funnel(n, v)
colorscheme!(fn,  palette = ("acw", "VitaminC"), reversePalette = true)
{% endhighlight %}


<div id="color2" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("color2"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"color":["#FD7400","#FFE11A","#BEDB39","#1F8A70","#004358"],"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[{"name":"A","value":100},{"name":"B","value":60},{"name":"C","value":80},{"name":"D","value":70},{"name":"E","value":50}],"smooth":false,"minSize":"0%","type":"funnel","maxSize":"100%"}]});
</script>
