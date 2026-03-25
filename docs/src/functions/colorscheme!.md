# colorscheme!

```@docs
colorscheme!
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
colorscheme!(b, ("Tableau", 10))
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
colorscheme!(b, ["#ff0000", "#00ff00", "#0000ff"])
```
