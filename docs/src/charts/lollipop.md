# lollipop

```@docs
lollipop
```

```@example
using ECharts
categories = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
values = [120, 200, 150, 80, 70, 110, 130]
lollipop(categories, values)
```

With multiple series and a title:

```@example multi
using ECharts
categories = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
online  = [120, 200, 150, 80, 70, 110, 130]
instore = [80,  120, 100, 60, 50, 90,  80]
ec = lollipop(categories, hcat(online, instore), legend = true)
title!(ec, text = "Weekly Sales by Channel")
ec
```
