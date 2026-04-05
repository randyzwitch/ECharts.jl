# nightingale

```@docs
nightingale
```

The nightingale rose chart was invented by Florence Nightingale in 1858 to visualize causes of mortality among British soldiers during the Crimean War.

```@example
using ECharts
causes = ["Preventable diseases", "Wounds in battle", "Other causes"]
deaths = [2756, 1298, 632]
ec = nightingale(causes, deaths)
title!(ec, text = "Causes of Mortality — British Army", subtext = "Crimean War, April 1854–March 1855")
ec
```

```@example
using ECharts, DataFrames
# Wind rose: percentage of annual observations by compass direction
df = DataFrame(
    direction = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE",
                 "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"],
    frequency = [3.5, 2.8, 4.2, 5.6, 7.1, 6.3, 8.4, 9.2,
                 6.8, 5.4, 4.7, 3.9, 5.2, 4.1, 6.3, 5.8],
)
ec = nightingale(df, :direction, :frequency)
title!(ec, text = "Wind Rose — Annual Wind Frequency",
       subtext = "% of observations by compass direction, Chicago O'Hare 2023")
ec
```
