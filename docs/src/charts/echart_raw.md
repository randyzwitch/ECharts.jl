# EChartRaw / echart / @echart

```@docs
EChartRaw
echart
@echart
```

```@example
using ECharts
echart("""
{
  "xAxis": {"type": "category", "data": ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]},
  "yAxis": {"type": "value"},
  "series": [{"data": [820, 932, 901, 934, 1290, 1330, 1320], "type": "bar"}]
}
""")
```
