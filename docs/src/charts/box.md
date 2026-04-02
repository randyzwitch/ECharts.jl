# box

```@docs
box
```

```@example
using ECharts
# API response times (ms) sampled from a web service over one hour
response_times = [112, 98, 134, 145, 118, 102, 156, 189, 121, 108,
                  99,  143, 167, 115, 103, 128, 142, 119, 97,  131,
                  188, 107, 122, 136, 114, 101, 159, 144, 126, 110]
ec = box(response_times)
title!(ec, text = "API Response Time Distribution", subtext = "Milliseconds — 30 sampled requests")
ec
```
