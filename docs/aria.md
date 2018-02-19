---
title: aria!
sidebar: mydoc_sidebar
permalink: /aria
---
This method implements the [Web Accessibility Initiative – Accessible Rich Internet Applications](https://www.w3.org/WAI/intro/aria) (WAI-ARIA) functionality that is built into the echarts.js library. echarts.js attempts to [auto-generate valid accessibility tags](http://echarts.baidu.com/option.html#aria), descriptions, etc. based on `ECharts` data such as `Title`.

If you need finer-grained control, the `aria!()` method allows for overriding the auto-generated descriptions and tags.

## Method Signatures
{% highlight julia %}
aria!(ec::EChart; show::Bool = true, description::String = "", general::Dict = Dict(), series::Dict = Dict(), data::Dict = Dict())
{% endhighlight %}

## Optional Arguments
{% highlight julia %}
None currently
{% endhighlight %}

## Examples

### `palette`
{% highlight julia %}

{% endhighlight %}

<div id="color1" style="height:400px;width:800px;"></div>
<script type="text/javascript">

    // Initialize after dom ready
    var myChart = echarts.init(document.getElementById("color1"), JSON.parse(roma()));

    // Load data into the ECharts instance
    myChart.setOption(

        );
</script>
