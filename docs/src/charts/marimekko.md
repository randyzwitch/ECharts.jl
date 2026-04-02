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
    region  = repeat(["North America","Europe","Asia Pacific","Rest of World"], inner = 3),
    segment = repeat(["Enterprise","Mid-Market","SMB"], outer = 4),
    revenue = [420, 280, 150, 310, 195, 120, 580, 210, 175, 140, 85, 60],
)
ec = marimekko(df, :region, :segment, :revenue)
title!(ec, text = "Revenue by Region and Customer Segment", subtext = "USD millions")
ec
```
