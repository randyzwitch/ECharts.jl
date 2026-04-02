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
df = DataFrame(
    cause  = ["Preventable diseases", "Wounds in battle", "Other causes"],
    deaths = [2756, 1298, 632],
)
nightingale(df, :cause, :deaths)
```
