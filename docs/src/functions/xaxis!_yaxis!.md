# xaxis! / yaxis!

```@docs
xaxis!
yaxis!
```

```@example
using ECharts
b = bar(["A","B","C"], [1,2,3])
xaxis!(b, name = "Category")
```

```@example
using ECharts
b = bar(["A","B","C"], [1000, 2000, 3000])
yaxis!(b, name = "Revenue", formatter = "\${value}")
```

```@example
using ECharts, Random
Random.seed!(42)
# decimals controls tick label precision on numeric (value) axes
sc = scatter(rand(40) .* 100, rand(40))
xaxis!(sc, name = "Score", decimals = 1)
yaxis!(sc, name = "Rate",  decimals = 2)
title!(sc, text = "decimals kwarg: 1 decimal on x, 2 on y")
sc
```
