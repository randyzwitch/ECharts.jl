# chord

```@docs
chord
```

```@example
using ECharts
names  = ["China", "Japan", "USA", "Germany", "Brazil"]
source = ["China",   "China",   "Japan",   "USA",     "Germany", "Brazil",  "Japan"]
target = ["Japan",   "USA",     "USA",     "Germany", "Brazil",  "China",   "Germany"]
value  = [10.0,      20.0,      15.0,      8.0,       5.0,       12.0,      7.0]
chord(names, source, target, value)
```

```@example
using ECharts, DataFrames
df = DataFrame(
    names  = ["A", "A", "A", "B", "B", "C"],
    source = ["A", "A", "B", "B", "C", "C"],
    target = ["B", "C", "C", "A", "A", "B"],
    value  = [5.0, 3.0, 2.0, 5.0, 3.0, 2.0],
)
chord(df, :names, :source, :target, :value)
```
