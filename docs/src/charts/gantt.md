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
    task  = ["Demo & Clearance", "Plumbing Rough-in", "Electrical Work", "Framing & Drywall",
             "Flooring", "Cabinet Install", "Painting", "Fixtures & Finish"],
    start = [Date(2024,3,4),  Date(2024,3,11), Date(2024,3,11), Date(2024,3,25),
             Date(2024,4,8),  Date(2024,4,15), Date(2024,4,22), Date(2024,5,6)],
    end_  = [Date(2024,3,10), Date(2024,3,24), Date(2024,3,28), Date(2024,4,7),
             Date(2024,4,21), Date(2024,5,5),  Date(2024,5,5),  Date(2024,5,17)],
)
ec = gantt(df, :task, :start, :end_)
title!(ec, text = "Kitchen Renovation Schedule", subtext = "March–May 2024")
ec
```
