---

layout: minimal
title: candlestick

---

## Candlestick

### Function Keywords
{% highlight julia %}
dt::AbstractVector{String}
open::AbstractVector{T}
close::AbstractVector{T}
low::AbstractVector{T}
high::AbstractVector{T}
legend::Bool = false
scale::Bool = true
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
dt = ["2016/08/26", "2016/08/29", "2016/08/30", "2016/08/31", "2016/09/01", "2016/09/02", "2016/09/06", "2016/09/07",
"2016/09/08", "2016/09/09", "2016/09/12", "2016/09/13", "2016/09/14", "2016/09/15", "2016/09/16", "2016/09/19",
"2016/09/20", "2016/09/21", "2016/09/22", "2016/09/23", "2016/09/26"]

close_ = [12.3800, 12.4700, 12.5500, 12.6000, 12.4400, 12.5000, 12.6700, 12.7000, 12.7300, 12.3800, 12.7000, 12.3800,
12.1400, 12.1100, 12.1100, 12.1100, 12.0000, 12.0900, 12.1800, 12.1700, 12.0100]

open_ = [12.4700, 12.3800, 12.4600, 12.4800, 12.6600, 12.5300, 12.4900, 12.6200, 12.5000, 12.6100, 12.3200, 12.5300,
12.1800, 12.1400, 12.0500, 12.1200, 12.0900, 12.0800, 12.1700, 12.1200, 12.1200]

high_ = [12.5500, 12.5000, 12.5600, 12.6100, 12.7200, 12.5700, 12.6700, 12.7500, 12.7500, 12.6850, 12.7700, 12.6800,
12.3100, 12.1800, 12.1300, 12.3300, 12.1900, 12.1100, 12.2900, 12.2200, 12.1200]

low_ = [12.3400, 12.3800, 12.4300, 12.4800, 12.3500, 12.4600, 12.4300, 12.6200, 12.5000, 12.3800, 12.2800, 12.3300,
12.1100, 12.0600, 12.0100, 12.0586, 11.9600, 12.0100, 12.1600, 12.1200, 12.0000]

candlestick(dt, open_, close_, low_, high_)
{% endhighlight %}

<div id="candle" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("candle"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"splitNumber":5,"boundaryGap":true,"data":["2016/08/26","2016/08/29","2016/08/30","2016/08/31","2016/09/01","2016/09/02","2016/09/06","2016/09/07","2016/09/08","2016/09/09","2016/09/12","2016/09/13","2016/09/14","2016/09/15","2016/09/16","2016/09/19","2016/09/20","2016/09/21","2016/09/22","2016/09/23","2016/09/26"],"scale":true,"gridIndex":0,"minInterval":0,"inverse":false,"nameLocation":"start","nameGap":15,"silent":true,"type":"category"}],"yAxis":[{"splitNumber":5,"gridIndex":0,"minInterval":0,"silent":true,"inverse":false,"scale":true,"nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[[12.47,12.38,12.34,12.55],[12.38,12.47,12.38,12.5],[12.46,12.55,12.43,12.56],[12.48,12.6,12.48,12.61],[12.66,12.44,12.35,12.72],[12.53,12.5,12.46,12.57],[12.49,12.67,12.43,12.67],[12.62,12.7,12.62,12.75],[12.5,12.73,12.5,12.75],[12.61,12.38,12.38,12.685],[12.32,12.7,12.28,12.77],[12.53,12.38,12.33,12.68],[12.18,12.14,12.11,12.31],[12.14,12.11,12.06,12.18],[12.05,12.11,12.01,12.13],[12.12,12.11,12.0586,12.33],[12.09,12.0,11.96,12.19],[12.08,12.09,12.01,12.11],[12.17,12.18,12.16,12.29],[12.12,12.17,12.12,12.22],[12.12,12.01,12.0,12.12]],"smooth":false,"minSize":"0%","type":"candlestick","maxSize":"100%"}]});
</script>