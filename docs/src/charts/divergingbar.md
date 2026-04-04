# divergingbar

```@docs
divergingbar
```

```@example
using ECharts
categories = ["Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"]
oppose     = [12, 28, 15, 34, 11]   # bars extend left
support    = [18, 35, 20, 20,  7]   # bars extend right
ec = divergingbar(categories, oppose, support;
                  left_name = "Oppose", right_name = "Support")
title!(ec, text = "Survey Results", subtext = "Sample size: 200")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    category = ["Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"],
    oppose   = [12, 28, 15, 34, 11],
    support  = [18, 35, 20, 20,  7],
)
divergingbar(df, :category, :oppose, :support;
             left_name = "Oppose", right_name = "Support")
```
