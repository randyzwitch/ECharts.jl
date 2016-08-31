---

layout: minimal
title: toolbox!

---

## toolbox!

### Function Keywords
{% highlight julia %}
ec::EChart
show::Bool = true
restore::Bool = true
dataView::Bool = true
saveAsImage::Bool = true
chartTypes::AbstractVector = []
{% endhighlight %}

### Examples
{% highlight julia %}
using ECharts
x = 1:20
y = 3 .+ 5x
a = bar(x = x, y = y)
title!(a, text = "Bar Plot Title", subtext = "Secondary Title")
toolbox!(a, chartTypes = ["bar", "line"])
{% endhighlight %}


<div id="title_ex" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("title_ex"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"show":true,"data":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],"type":"category"}],"yAxis":[{"show":true,"type":"value"}],"toolbox":{"itemGap":15,"show":true,"x":"right","feature":{"dataView":{"show":true,"title":"Data View","lang":["Data View","Cancel","Refresh"]},"restore":{"show":true,"title":"Restore"},"saveAsImage":{"show":true,"title":"Save As PNG"},"magicType":{"show":true,"title":{"line":"Line","bar":"Bar","tiled":"Tiled","chord":"Chord","stack":"Stack","pie":"Pie","force":"Force","funnel":"Funnel"},"type":["bar","line"]}},"orient":"vertical","y":"center"},"title":{"subtext":"Secondary Title","text":"Bar Plot Title"},"series":[{"data":[8,13,18,23,28,33,38,43,48,53,58,63,68,73,78,83,88,93,98,103],"smooth":false,"type":"bar"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>
