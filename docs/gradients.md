---
title: Gradients
sidebar: mydoc_sidebar
permalink: /gradients
---

## Function Keywords
{% highlight julia %}
ec::EChart
{% endhighlight %}

### Examples
{% highlight julia %}
using ECharts
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bm = bar(x, hcat(0.95 .* y, 1.25 .* y,y), mark = "bar", color = ["red", "gray", "blue"], stack = true)
{% endhighlight %}

<div id="legend1" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("legend1"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"color":["red","gray","blue"],"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"stack":1,"data":[10.45,10.45,14.25,12.35,11.399999999999999,12.35,9.5],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"stack":1,"data":[13.75,13.75,18.75,16.25,15.0,16.25,12.5],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"stack":1,"data":[11.0,11.0,15.0,13.0,12.0,13.0,10.0],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"}]});
</script>


{% highlight julia %}
legend!(bm)
{% endhighlight %}

<div id="legend_ex" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("legend_ex"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"charttype":"xy plot","color":["red","gray","blue"],"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"name":"Series 1","stack":1,"data":[10.45,10.45,14.25,12.35,11.399999999999999,12.35,9.5],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"name":"Series 2","stack":1,"data":[13.75,13.75,18.75,16.25,15.0,16.25,12.5],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"},{"name":"Series 3","stack":1,"data":[11.0,11.0,15.0,13.0,12.0,13.0,10.0],"smooth":false,"minSize":"0%","type":"bar","maxSize":"100%"}],"legend":{"itemWidth":25,"data":["Series 1","Series 2","Series 3"],"borderColor":"transparent","orient":"horizontal","bottom":"auto","height":"auto","zlevel":0,"padding":5,"borderWidth":1,"z":2,"align":"auto","itemGap":10,"itemHeight":14,"backgroundColor":"transparent","shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","width":"auto","selectedMode":true,"show":true}});
</script>
