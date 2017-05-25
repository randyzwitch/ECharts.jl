---
title: Scatter
sidebar: mydoc_sidebar
permalink: /scatter
---

## Function Keywords
{% highlight julia %}
x::AbstractVector
y::AbstractArray
legend::Bool = false
scale::Bool = false
kwargs...(modifies top-level `EChart` fields)
{% endhighlight %}

## Single Series
{% highlight julia %}
using ECharts
scatter(1:30, rand(30))
{% endhighlight %}

<div id="scatter" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("scatter"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"show":true,"data":[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,27.0,28.0,29.0,30.0],"type":"category"}],"yAxis":[{"show":true,"type":"value"}],"toolbox":{"itemGap":15,"show":false,"x":"right","feature":{},"orient":"vertical","y":"center"},"title":{},"series":[{"data":[0.28349037481431383,0.7779501781342211,0.5034440179017441,0.025535025772706055,0.6183463419067843,0.4288179088209456,0.2634386479202955,0.05255994192478419,0.3957871564877886,0.1980999405728805,0.21219556161459274,0.39069746174715525,0.1331723440449284,0.31737347363879564,0.9733990953658405,0.6857222361850577,0.5501104994151236,0.8740011821737608,0.21468315301631802,0.8186274264041322,0.9676316667608766,0.5812029667394709,0.8919983593065945,0.29503481636592777,0.6710642075732647,0.04064753977127866,0.20677311746585803,0.11074273794658196,0.5734841870800895,0.607140501804825],"smooth":false,"type":"scatter"}],"backgroundColor":"rgba(0,0,0,0)"});
</script>

## Multiple Series
{% highlight julia %}
using ECharts
scatter(1:30, hcat(rand(30), rand(30)))
{% endhighlight %}

<div id="scatter2" style="height:400px;width:800px;"></div>
<script type="text/javascript">
    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("scatter2"));

    // Load data into the ECharts instance
    myChart.setOption({"xAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"data":[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,27.0,28.0,29.0,30.0],"inverse":false,"type":"category","nameLocation":"start","nameGap":15}],"yAxis":[{"scale":false,"gridIndex":0,"splitNumber":5,"minInterval":0,"silent":true,"inverse":false,"type":"value","nameLocation":"start","nameGap":15}],"toolbox":{"feature":{},"itemSize":15,"orient":"vertical","height":"auto","zlevel":0,"z":2,"itemGap":10,"right":"auto","top":"center","width":"auto","show":false,"showTitle":true},"title":{"left":"left","borderColor":"transparent","bottom":"auto","padding":5,"zlevel":0,"borderWidth":1,"target":"blank","z":2,"itemGap":5,"backgroundColor":"transparent","shadowOffsetY":0,"shadowOffsetX":0,"right":"auto","top":"auto","subtarget":"blank","show":true},"series":[{"data":[0.831929310055439,0.20374375237877862,0.7241458029892622,0.1972815906720189,0.12044779018604945,0.8529780874298847,0.8608079645373481,0.7630863988865804,0.37134216913736706,0.8023217369238693,0.9685009471268444,0.35537617864769677,0.37772792322453275,0.8502510792630622,0.09374123998751704,0.1281184852243218,0.6199180634427666,0.3465624264910867,0.7293354715626428,0.9238290811073668,0.3827833584700764,0.8185218616268428,0.5692684874941278,0.44275903495953495,0.7520685535142144,0.566043715748707,0.5519294020944534,0.9691034230681932,0.15706340768670835,0.9824328942454952],"smooth":false,"minSize":"0%","type":"scatter","maxSize":"100%"},{"data":[0.852042139277805,0.675518995374687,0.027944033432996562,0.10274354967890753,0.7248091617167529,0.2596626726458453,0.3826649120929533,0.583999545927876,0.03352710561158423,0.8396410489028099,0.9787210813108083,0.597684444266882,0.9395943909497955,0.8936281717514674,0.4035533650846965,0.3210975756164751,0.5607413198378635,0.5767104197118142,0.3149626146374429,0.008423418778473968,0.4053930992682191,0.6565869466830263,0.6094257860831427,0.2199094469706393,0.9537813594874036,0.32818895788370694,0.11973092272093933,0.27525240392552996,0.1952695354423779,0.9575831119455962],"smooth":false,"minSize":"0%","type":"scatter","maxSize":"100%"}]});
</script>
