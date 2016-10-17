---

layout: minimal
title: xAxis!/yAxis!

---

## xAxis!/yAxis!

The `xAxis!` and `yAxis!` functions are just convenience functions around the `Axis` type, so that end-users don't need to reference `ec.yAxis` or `ec.xAxis` directly (though, nothing prevents users modifying the `EChart` chart instance).

### Function Keywords
{% highlight julia %}
ec::EChart
_type::Union{AbstractString, Void} = nothing
data::Union{AbstractVector, Void} = []
boundaryGap::Union{Bool, Void} = nothing
min::Union{Number, Void} = nothing
max::Union{Number, Void} = nothing
show::Bool = true
gridIndex::Union{Int,Void} = 0
position::Union{String,Void} = nothing
name::Union{String,Void} = nothing
nameLocation::Union{String,Void} = "middle"
nameTextStyle::Union{TextStyle,Void} = nothing
nameGap::Union{Int,Void} = 30
inverse::Union{Bool,Void} = false
scale::Union{Bool,Void} = false
splitNumber::Union{Int,Void} = 5
minInterval::Union{Int,Void} = 0
interval::Union{Int,Void} = nothing
silent::Union{Bool,Void} = true
axisLine::Union{AxisLine,Void} = nothing
axisTick::Union{AxisTick,Void} = nothing
axisLabel::Union{AxisLabel,Void} = nothing
splitLine::Union{SplitLine,Void} = nothing
splitArea::Union{SplitArea,Void} = nothing
{% endhighlight %}
