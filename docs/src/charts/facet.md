# facet / facet!

```@docs
facet!
facet
```

## Bar chart — pipeline style

Build a grouped bar chart, then call `facet!` to split each series into its own panel.
This is the recommended workflow: configure the chart first, then facet.

```@example
using ECharts
months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
nt = (
    month  = repeat(months, 3),
    sales  = [120,132,101,134,90,230,210,182,191,234,290,330,
               220,182,191,234,290,330,310,213,180,199,250,180,
               150,232,201,154,190,330,410,382,391,234,290,330],
    region = repeat(["North","Central","South"], inner=12),
)
bar(nt, :month, :sales, :region) |> facet!
```

## Line chart — compose modifiers before faceting

Apply `smooth!` and `colorscheme!` before `facet!` — all styling carries forward
into the individual panels.

```@example
using ECharts
quarters = ["Q1","Q2","Q3","Q4"]
nt = (
    quarter = repeat(quarters, 4),
    revenue = [450,520,610,580, 310,380,420,390, 620,700,750,810, 280,310,290,340],
    product = repeat(["Widgets","Gadgets","Gizmos","Doohickeys"], inner=4),
)
ec = line(nt, :quarter, :revenue, :product)
smooth!(ec)
colorscheme!(ec, ("Paired", 12))
title!(ec, text = "Quarterly Revenue by Product")
facet!(ec; ncols = 2)
```

## Scatter chart — numeric x handled automatically

When the x column is numeric, `facet` uses value-type axes and packages each
point as `[x, y]` — the same format `scatter` uses natively. No special casing needed.

```@example
using ECharts
nt = (
    height = [174,180,177,183,170,188,175,172,178,185,
              160,165,158,170,155,168,162,157,164,172],
    weight = [75,85,78,90,68,95,76,72,80,88,
              52,58,50,62,48,60,54,51,57,65],
    sex    = vcat(fill("Male",10), fill("Female",10)),
)
facet(nt, :height, :weight, :sex; mark = "scatter")
```

## Raw arrays — groups with independent x values

Pass arrays directly when each group has its own set of x categories,
or when you are not working with a table.

```@example
using ECharts
days    = vcat(["Mon","Tue","Wed","Thu","Fri"],
               ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],
               ["Sat","Sun"])
steps   = vcat([8200,7500,9100,8800,10200],
               [6000,5800,7200,6900,8100,12000,11500],
               [13000,14500])
cohort  = vcat(fill("Weekday commuters",5),
               fill("Flexible workers",7),
               fill("Weekend walkers",2))
facet(days, steps, cohort; mark = "bar", ncols = 2)
```
