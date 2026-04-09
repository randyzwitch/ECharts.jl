# pictorialbar

```@docs
pictorialbar
```

```@example
using ECharts
browsers = ["Chrome", "Firefox", "Safari", "Edge", "Other"]
share    = [65, 15, 10, 6, 4]
ec = pictorialbar(browsers, share, symbol = "diamond")
title!(ec, text = "Browser Market Share", subtext = "Illustrative data")
ec
```

```@example
using ECharts
categories = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
steps      = [8200, 6500, 9100, 7300, 11000, 13500, 5800]
ec = pictorialbar(categories, steps,
                  symbol = "path://M0,10 L5,0 L10,10 Z",
                  symbolRepeat = true,
                  symbolBoundingData = 15000)
title!(ec, text = "Daily Step Count", subtext = "Repeating symbol mode")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    planet   = ["Mercury", "Venus", "Earth", "Mars"],
    diameter = [4879, 12104, 12756, 6792],
)
ec = pictorialbar(df, :planet, :diameter, symbol = "circle", horizontal = true)
title!(ec, text = "Planet Diameters (km)")
ec
```
