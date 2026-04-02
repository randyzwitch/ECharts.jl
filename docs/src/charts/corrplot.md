# corrplot

```@docs
corrplot
```

Default corrplot from a DataFrame — lower triangle with correlation labels:

```@example
using ECharts, RDatasets
df = dataset("datasets", "mtcars")
ec = corrplot(df)
title!(ec, text = "Motor Trend Car Road Tests", subtext = "Pearson correlation — mtcars dataset")
ec
```

Full matrix (both triangles) with the diagonal hidden:

```@example full_nodiag
using ECharts, RDatasets
df = dataset("datasets", "mtcars")
corrplot(df, layout = "full", diag = false)
```

Upper triangle only, with labels turned off:

```@example upper_nolabels
using ECharts, RDatasets
df = dataset("datasets", "mtcars")
corrplot(df, layout = "upper", labels = false)
```

Alphabetical column ordering with four decimal places:

```@example alpha_digits
using ECharts, RDatasets
df = dataset("datasets", "mtcars")
corrplot(df, order = "alphabet", number_digits = 4)
```

Customised label style — white text on a larger bubble to improve contrast:

```@example label_style
using ECharts, RDatasets
df = dataset("datasets", "mtcars")
corrplot(df, bubblesize = 60, label_color = "white", label_fontsize = 12)
```

Passing a pre-computed correlation matrix directly:

```@example matrix_input
using ECharts, RDatasets, StatsBase
df = dataset("datasets", "iris")
num_cols = [:SepalLength, :SepalWidth, :PetalLength, :PetalWidth]
m = cor(Matrix(df[!, num_cols]))
ec = corrplot(m)
title!(ec, text = "Iris Dataset", subtext = "Pearson correlation — numeric columns")
ec
```
