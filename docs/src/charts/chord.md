# chord

```@docs
chord
```

```@example
using ECharts
regions = ["Asia", "Europe", "N. America", "S. America", "Africa"]
source  = ["Asia",      "Asia",      "Europe",    "N. America", "Africa",    "Europe",    "S. America"]
target  = ["Europe",    "N. America","N. America","Asia",       "Europe",    "Africa",    "Europe"]
value   = [1.4,         0.8,         0.5,         0.3,          0.9,         0.4,         0.6]
ec = chord(regions, source, target, value)
title!(ec, text = "International Migration Flows", subtext = "Annual, millions of people")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    names  = ["USA", "China", "Germany", "Japan", "Brazil", "Mexico", "India"],
    source = ["USA",     "China",   "Germany", "Japan",   "Brazil",  "USA",     "China"],
    target = ["China",   "USA",     "USA",     "Germany", "USA",     "Germany", "Germany"],
    value  = [450.0,     450.0,     180.0,     130.0,     90.0,      120.0,     110.0],
)
ec = chord(df, :names, :source, :target, :value)
title!(ec, text = "Bilateral Trade Flows", subtext = "USD billions")
ec
```
