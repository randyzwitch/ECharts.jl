# radialbar

```@docs
radialbar
```

```@example
using ECharts
sports = ["Swimming", "Running", "Cycling", "Strength", "Flexibility"]
scores = [88, 92, 74, 81, 66]
ec = radialbar(sports, scores)
title!(ec, text = "Athlete Performance Profile", subtext = "Score out of 100")
ec
```
