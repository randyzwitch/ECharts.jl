# singleaxis

```@docs
singleaxis
```

```@example
using ECharts
x = [0.1, 0.5, 1.2, 2.3, 3.8, 4.1, 5.0, 6.3, 7.7, 8.2, 9.5]
singleaxis(x)
```

```@example
using ECharts, DataFrames
df = DataFrame(score = [55, 62, 71, 80, 88, 91, 95, 42, 76, 83])
singleaxis(df, :score)
```
