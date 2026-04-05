# marimekko

```@docs
marimekko
```

```@example
using ECharts
regions       = ["North America", "Europe", "Asia Pacific", "Rest of World"]
segments      = ["Enterprise", "Mid-Market", "SMB"]
# Revenue in $M per segment per region
values = [420.0  310.0  580.0  140.0;
          280.0  195.0  210.0   85.0;
          150.0  120.0  175.0   60.0]
ec = marimekko(regions, segments, values)
title!(ec, text = "Revenue by Region and Customer Segment", subtext = "USD millions")
ec
```

From a DataFrame (long format):

```@example df
using ECharts, DataFrames
df = DataFrame(
    region = repeat(["North America", "Europe", "Asia Pacific", "Middle East"], inner = 4),
    source = repeat(["Fossil Fuels", "Nuclear", "Hydro", "Renewables"], outer = 4),
    output = [480, 90, 70, 130,
              320, 180, 95, 215,
              780, 60, 120, 180,
              360,  5, 10,  25],
)
ec = marimekko(df, :region, :source, :output)
title!(ec, text = "Electricity Generation by Region and Source", subtext = "Terawatt-hours")
ec
```
