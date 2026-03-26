"""
    shadow!(ec; kwargs...)

Adds drop shadow effects to series in an `EChart` to enhance visual depth.

## Methods
```julia
shadow!(ec::EChart, series::Int; shadowBlur, shadowColor, shadowOffsetX, shadowOffsetY)
shadow!(ec::EChart; shadowBlur, shadowColor, shadowOffsetX, shadowOffsetY)
```

## Arguments
* `series::Int` : index of the series to apply shadow to (single-series method only)
* `shadowBlur::Int = 10` : size of the shadow blur in pixels
* `shadowColor::String = "rgba(0,0,0,0.3)"` : CSS color string for the shadow
* `shadowOffsetX::Int = 0` : horizontal shadow offset in pixels
* `shadowOffsetY::Int = 0` : vertical shadow offset in pixels

## Notes

When called without a `series` argument, shadow is applied to all series.

## Examples
```julia
b = bubble([1,2,3], [4,5,6], [10,20,30])
shadow!(b)

# Custom shadow
shadow!(b, shadowBlur = 20, shadowColor = "rgba(100,100,200,0.5)", shadowOffsetY = 4)
```
"""
function shadow!(ec::EChart, series::Int;
    shadowBlur::Int = 10,
    shadowColor::String = "rgba(0,0,0,0.5)",
    shadowOffsetX::Int = 0,
    shadowOffsetY::Int = 5)

    isnothing(ec.series[series].itemStyle) && (ec.series[series].itemStyle = ItemStyle())
    ec.series[series].itemStyle.shadowBlur = shadowBlur
    ec.series[series].itemStyle.shadowColor = shadowColor
    ec.series[series].itemStyle.shadowOffsetX = shadowOffsetX
    ec.series[series].itemStyle.shadowOffsetY = shadowOffsetY

    return ec
end

"""
    shadow!(ec; kwargs...)

Applies drop shadow to all series in `ec`.
See the primary `shadow!` method for full argument documentation.
"""
function shadow!(ec::EChart;
    shadowBlur::Int = 10,
    shadowColor::String = "rgba(0,0,0,0.5)",
    shadowOffsetX::Int = 0,
    shadowOffsetY::Int = 5)

    for n in 1:length(ec.series)
        shadow!(ec, n,
            shadowBlur = shadowBlur,
            shadowColor = shadowColor,
            shadowOffsetX = shadowOffsetX,
            shadowOffsetY = shadowOffsetY)
    end

    return ec
end
