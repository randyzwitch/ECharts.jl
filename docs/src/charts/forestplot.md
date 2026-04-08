# forestplot

```@docs
forestplot
```

```@example
using ECharts
# Classic meta-analysis forest plot
studies = ["Smith et al. (2018)", "Jones et al. (2019)",
           "Lee et al. (2020)", "Patel et al. (2021)", "Overall"]
est     = [ 0.32, -0.15,  0.45,  0.28,  0.24]
lo      = [ 0.10, -0.42,  0.18,  0.05,  0.10]
hi      = [ 0.54,  0.12,  0.72,  0.51,  0.38]
ec = forestplot(studies, est, lo, hi; ref = 0)
title!(ec, text = "Meta-Analysis Forest Plot",
           subtext = "Effect size with 95% CI  |  vertical line at null (0)")
xaxis!(ec, name = "Effect Size")
ec
```

```@example
using ECharts
# Odds-ratio scale — reference line at 1
labels = ["RCT A", "RCT B", "Cohort C", "Cohort D", "Pooled"]
or  = [1.45, 0.82, 1.31, 1.68, 1.28]
lo  = [1.10, 0.60, 0.95, 1.20, 1.05]
hi  = [1.92, 1.12, 1.81, 2.34, 1.56]
ec = forestplot(labels, or, lo, hi; ref = 1, dot_size = 12,
               ci_color = "#5470c6")
title!(ec, text = "Odds Ratios with 95% CI",
           subtext = "Reference line at OR = 1")
xaxis!(ec, name = "Odds Ratio")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    study    = ["Alpha", "Beta", "Gamma", "Delta"],
    estimate = [0.20, 0.55, -0.10, 0.38],
    lower    = [0.02, 0.30, -0.35, 0.15],
    upper    = [0.38, 0.80,  0.15, 0.61],
)
ec = forestplot(df, :study, :estimate, :lower, :upper)
title!(ec, text = "Forest Plot — DataFrame method")
ec
```
