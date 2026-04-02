# area

```@docs
area
```

```@example
using ECharts
months   = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
search   = [820,  932,  901,  934, 1290, 1330, 1320, 1200, 1100,  900,  850,  780]
direct   = [120,  132,  101,  134,  190,  230,  210,  220,  180,  160,  150,  110]
email    = [220,  182,  191,  234,  290,  330,  310,  280,  250,  210,  200,  180]
ec = area(months, hcat(search, direct, email), legend = true)
seriesnames!(ec, ["Search Engine", "Direct", "Email"])
title!(ec, text = "Website Traffic by Source", subtext = "Monthly unique visits")
ec
```
