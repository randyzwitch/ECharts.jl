"""
    radial!(ec)

Converts an XY plot to a radial (polar) coordinate system. Only works with charts that
have categorical values in `xAxis.data`.

## Methods
```julia
radial!(ec::EChart)
```

## Examples
```julia
x = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
y = [11, 11, 15, 13, 12, 13, 10]
b = bar(x, y)
radial!(b)
```
"""
function radial!(ec::EChart)
    #Convert xyplots to radial, only works with plots having values for xAxis.data
    ec.polar = ECharts.Polar()
    ec.angleAxis = ECharts.AngleAxis()
    ec.radiusAxis = ECharts.RadiusAxis(_type = "category", data = ec.xAxis[1].data, z = 10)
    [x.coordinateSystem = "polar" for x in ec.series]
    ec.yAxis = nothing
    ec.xAxis = nothing
    return ec
end
