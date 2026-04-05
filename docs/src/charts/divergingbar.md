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
    policy     = ["Climate Bill", "Infrastructure Plan", "Tax Reform", "Healthcare Act", "Education Budget"],
    disapprove = [38, 22, 45, 31, 19],
    approve    = [52, 67, 43, 58, 71],
)
ec = divergingbar(df, :policy, :disapprove, :approve;
                  left_name = "Disapprove", right_name = "Approve")
title!(ec, text = "Public Approval of Policy Proposals", subtext = "Likely voters, n = 1,200")
ec
```
