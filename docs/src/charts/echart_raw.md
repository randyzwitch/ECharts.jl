# EChartRaw / echart / @echart

```@docs
EChartRaw
echart
@echart
```

`echart` and `@echart` accept a raw Apache ECharts JSON option string and render it directly.
This is useful for charts that go beyond the ECharts.jl Julia API — custom renderers,
dataset transforms, or any option not yet exposed as a Julia type.

```@example
using ECharts
echart("""
{
  "title": {"text": "World Population by Region", "subtext": "Billions, 2024"},
  "tooltip": {"trigger": "axis", "axisPointer": {"type": "shadow"}},
  "xAxis": {"type": "value", "name": "Population (billions)"},
  "yAxis": {
    "type": "category",
    "data": ["Oceania", "N. America", "Europe", "S. America", "Africa", "Asia"]
  },
  "series": [{
    "name": "Population",
    "type": "bar",
    "data": [0.04, 0.38, 0.74, 0.44, 1.46, 4.78],
    "label": {"show": true, "position": "right"}
  }]
}
""")
```

The macro form `@echart` works identically with a string literal:

```@example macro
using ECharts
@echart """
{
  "title": {"text": "Renewable Energy Mix", "subtext": "Global capacity, 2023 (GW)"},
  "tooltip": {},
  "legend": {"orient": "vertical", "left": "left"},
  "series": [{
    "type": "pie",
    "radius": "60%",
    "data": [
      {"value": 1418, "name": "Solar"},
      {"value": 899,  "name": "Wind"},
      {"value": 1392, "name": "Hydro"},
      {"value": 153,  "name": "Bioenergy"},
      {"value": 61,   "name": "Other"}
    ]
  }]
}
"""
```
