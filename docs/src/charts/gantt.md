# gantt

```@docs
gantt
```

```@example
using ECharts, Dates
tasks  = ["Design", "Development", "Testing", "Deployment"]
starts = [Date(2024, 1, 1), Date(2024, 2, 1), Date(2024, 4, 1), Date(2024, 5, 1)]
ends   = [Date(2024, 2, 1), Date(2024, 4, 1), Date(2024, 5, 1), Date(2024, 5, 15)]
gantt(tasks, starts, ends)
```

```@example
using ECharts, DataFrames, Dates
df = DataFrame(task       = ["Design", "Development", "Testing", "Deployment"],
               start_date = [Date(2024, 1, 1), Date(2024, 2, 1), Date(2024, 4, 1), Date(2024, 5, 1)],
               end_date   = [Date(2024, 2, 1), Date(2024, 4, 1), Date(2024, 5, 1), Date(2024, 5, 15)])
gantt(df, :task, :start_date, :end_date)
```
