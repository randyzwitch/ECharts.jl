# pie

```@docs
pie
```

```@example
using ECharts
browsers = ["Chrome", "Safari", "Edge", "Firefox", "Samsung Internet", "Other"]
share    = [65.8, 18.7, 5.3, 4.1, 2.6, 3.5]
ec = pie(browsers, share)
title!(ec, text = "Browser Market Share", subtext = "Global, Q4 2024")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    browser = ["Chrome", "Safari", "Edge", "Firefox", "Samsung Internet", "Other"],
    share   = [65.8, 18.7, 5.3, 4.1, 2.6, 3.5],
)
pie(df, :browser, :share)
```
