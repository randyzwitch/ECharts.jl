# lollipop

```@docs
lollipop
```

```@example
using ECharts
languages = ["Python", "JavaScript", "Java", "C#", "C++", "TypeScript", "PHP", "Go", "Rust", "Swift"]
usage     = [28.2, 19.1, 17.8, 12.6, 11.1, 9.3, 7.7, 5.0, 4.8, 3.9]
ec = lollipop(languages, usage)
title!(ec, text = "Most Popular Programming Languages", subtext = "Stack Overflow Developer Survey 2024 (% usage)")
ec
```

With multiple series:

```@example multi
using ECharts
quarters = ["Q1", "Q2", "Q3", "Q4"]
online   = [320, 415, 390, 480]
instore  = [210, 245, 270, 295]
ec = lollipop(quarters, hcat(online, instore), legend = true, stem_width = 3)
title!(ec, text = "Quarterly Sales by Channel", subtext = "Units sold")
ec
```
