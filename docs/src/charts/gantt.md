# gantt

```@docs
gantt
```

```@example
using ECharts, Dates
tasks  = ["Research", "Design", "Prototype", "User Testing",
          "Development", "QA & Testing", "Documentation", "Deployment"]
starts = [Date(2024,1,2),  Date(2024,1,15), Date(2024,2,1),  Date(2024,2,20),
          Date(2024,2,5),  Date(2024,4,15), Date(2024,1,2),  Date(2024,5,1)]
ends   = [Date(2024,1,19), Date(2024,2,5),  Date(2024,2,28), Date(2024,3,8),
          Date(2024,4,26), Date(2024,5,3),  Date(2024,5,15), Date(2024,5,15)]
ec = gantt(tasks, starts, ends)
title!(ec, text = "Product Launch — Project Timeline", subtext = "Q1–Q2 2024")
ec
```

```@example
using ECharts, DataFrames, Dates
df = DataFrame(
    task  = ["Research", "Design", "Prototype", "User Testing",
             "Development", "QA & Testing", "Documentation", "Deployment"],
    start = [Date(2024,1,2),  Date(2024,1,15), Date(2024,2,1),  Date(2024,2,20),
             Date(2024,2,5),  Date(2024,4,15), Date(2024,1,2),  Date(2024,5,1)],
    end_  = [Date(2024,1,19), Date(2024,2,5),  Date(2024,2,28), Date(2024,3,8),
             Date(2024,4,26), Date(2024,5,3),  Date(2024,5,15), Date(2024,5,15)],
)
gantt(df, :task, :start, :end_)
```
