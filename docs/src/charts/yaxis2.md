# yaxis2!

```@docs
yaxis2!
```

```@example
using ECharts
# Bar chart for revenue (left axis) with a line chart for growth rate (right axis)
b = bar(["Q1","Q2","Q3","Q4"], [120_000, 145_000, 98_000, 162_000])
push!(b.series, ECharts.XYSeries(_type="line", name="Growth Rate",
    data=[nothing, 20.8, -32.4, 65.3]))
yaxis2!(b, series=2, name="Growth Rate (%)")
yaxis!(b, name="Revenue (\$)")
title!(b, text="Dual-Axis: Revenue and Growth Rate")
b
```

```@example
using ECharts
# Assign multiple series to the second axis
sc = line(["Jan","Feb","Mar","Apr"], [10, 40, 30, 50])
push!(sc.series, ECharts.XYSeries(_type="line", name="Temp (°C)",
    data=[22, 19, 24, 28]))
push!(sc.series, ECharts.XYSeries(_type="line", name="Humidity (%)",
    data=[60, 75, 55, 80]))
yaxis2!(sc, series=[2,3], name="Right Axis")
sc
```
