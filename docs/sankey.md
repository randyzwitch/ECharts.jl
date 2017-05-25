---
title: Sankey
sidebar: mydoc_sidebar
permalink: /sankey
---

## Function Keywords
{% highlight julia %}
name::AbstractVector{String}
source::AbstractVector{Int}
target::AbstractVector{Int}
value::AbstractVector{T}
legend::Bool = false
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Sankey
{% highlight julia %}
using ECharts
name = ["Agricultural waste", "Bio-conversion", "Liquid", "Losses", "Solid", "Gas", "Biofuel imports",
    "Biomass imports", "Coal imports", "Coal"]

source = [0, 1, 1, 1, 1, 6, 7, 8, 10]
target = [1, 2, 3, 4, 5, 2, 4, 9, 9]
value = [124.729, 0.597, 26.862, 280.322, 81.144, 35, 35, 11.606, 63.965]

sankey(name, source, target, value)
{% endhighlight %}

<div id="candle" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("candle"));

    // Load data into the ECharts instance
    myChart.setOption({"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"links":[{"source":0,"target":1,"value":124.729},{"source":1,"target":2,"value":0.597},{"source":1,"target":3,"value":26.862},{"source":1,"target":4,"value":280.322},{"source":1,"target":5,"value":81.144},{"source":6,"target":2,"value":35.0},{"source":7,"target":4,"value":35.0},{"source":8,"target":9,"value":11.606},{"source":10,"target":9,"value":63.965}],"data":[{"name":"Agricultural waste"},{"name":"Bio-conversion"},{"name":"Liquid"},{"name":"Losses"},{"name":"Solid"},{"name":"Gas"},{"name":"Biofuel imports"},{"name":"Biomass imports"},{"name":"Coal imports"},{"name":"Coal"}],"smooth":false,"minSize":"0%","layout":"none","type":"sankey","maxSize":"100%"}]});
</script>
