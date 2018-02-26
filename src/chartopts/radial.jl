#Convert xyplots to radial, only works with plots having values for xAxis.data
function radial!(ec::EChart)
    ec.polar = ECharts.Polar()
    ec.angleAxis = ECharts.AngleAxis()
    ec.radiusAxis = ECharts.RadiusAxis(_type = "category", data = ec.xAxis[1].data, z = 10)
    [x.coordinateSystem = "polar" for x in ec.series]
    ec.yAxis = nothing
    ec.xAxis = nothing
    return ec
end
