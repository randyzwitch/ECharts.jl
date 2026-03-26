"""
    radial!(ec)

Converts an XY plot to a radial (polar) coordinate system. Only works with charts that
have categorical values in `xAxis.data`.

## Methods
```julia
radial!(ec::EChart)
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
