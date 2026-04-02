# radar

```@docs
radar
```

```@example
using ECharts
axes   = ["Attack", "Defense", "Speed", "Stamina", "Skill"]
maxval = [100, 100, 100, 100, 100]
teamA  = [85, 62, 73, 88, 91]
teamB  = [67, 89, 82, 71, 65]
ec = radar(axes, hcat(teamA, teamB), maxval, legend = true)
seriesnames!(ec, ["Team A", "Team B"])
title!(ec, text = "Player Attribute Comparison")
ec
```
