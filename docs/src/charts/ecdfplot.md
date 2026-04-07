# ecdfplot

```@docs
ecdfplot
```

```@example
using ECharts, StatsBase, Random
Random.seed!(42)
# Simulate patient wait times (minutes) at two urgent care clinics
clinic_a = abs.(15 .+ 12 .* randn(300))
e = ecdf(clinic_a)
ec = ecdfplot(e)
title!(ec, text = "Patient Wait Time Distribution", subtext = "Urgent Care Clinic A — empirical CDF (n = 300)")
xaxis!(ec, name = "Wait time (minutes)")
yaxis!(ec, name = "Cumulative probability")
ec
```

```@example
using ECharts, StatsBase, Random
Random.seed!(7)
# Survey of household incomes — raw data vs. population-weighted estimate
n = 500
incomes = exp.(10.8 .+ 0.9 .* randn(n))   # log-normal income distribution

# Unweighted ECDF (treats each respondent equally)
e_raw = ecdf(incomes)
ec = ecdfplot(e_raw)

# Population-weighted ECDF (higher-income households under-sampled; upweight them)
sampling_weights = Weights(1.0 .+ 3.0 .* (incomes .> median(incomes)))
e_wtd = ecdf(incomes, weights = sampling_weights)
ec_wtd = ecdfplot(e_wtd)

# Overlay the weighted series onto the unweighted chart
push!(ec.series, ec_wtd.series[1])
seriesnames!(ec, ["Unweighted", "Population-weighted"])
legend!(ec)
title!(ec, text = "Household Income — Unweighted vs. Weighted ECDF",
           subtext = "Weighted estimate corrects for under-sampling of higher-income households")
xaxis!(ec, name = "Annual household income (\$)")
yaxis!(ec, name = "Cumulative probability")
ec
```
