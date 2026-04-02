# effectscatter

```@docs
effectscatter
```

```@example
using ECharts, DataFrames
df = DataFrame(
    country  = ["USA","China","Japan","Germany","India","UK","France","Brazil","Canada","S.Korea"],
    gdp      = [25.5, 17.9,  4.2,    4.1,      3.4,   3.1,  2.9,    2.1,    2.1,     1.7],
    life_exp = [79.1, 77.4, 84.3,   81.1,     70.8,  81.3, 82.5,   75.9,   82.3,    83.3],
)
ec = effectscatter(df, :gdp, :life_exp)
title!(ec, text = "GDP vs Life Expectancy", subtext = "Top 10 economies — GDP in USD trillions")
ec
```

With grouped series:

```@example grouped
using ECharts, DataFrames
df = DataFrame(
    height = [174.0, 180.0, 177.0, 183.0, 170.0, 160.0, 165.0, 158.0, 170.0, 155.0],
    weight = [ 75.0,  85.0,  78.0,  90.0,  68.0,  52.0,  58.0,  50.0,  62.0,  48.0],
    sex    = ["Male","Male","Male","Male","Male","Female","Female","Female","Female","Female"],
)
ec = effectscatter(df, :height, :weight, :sex)
title!(ec, text = "Height vs Weight by Sex")
ec
```
