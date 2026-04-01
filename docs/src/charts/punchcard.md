# punchcard

```@docs
punchcard
```

```@example
using ECharts
days  = repeat(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], 24)
hours = repeat(string.(0:23), inner = 7)
counts = rand(1:500, length(days))
punchcard(days, hours, counts)
```

```@example
using ECharts, DataFrames, Random
Random.seed!(42)
df = DataFrame(day   = repeat(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], 24),
               hour  = repeat(string.(0:23), inner = 7),
               count = rand(1:500, 168))
punchcard(df, :day, :hour, :count)
```
