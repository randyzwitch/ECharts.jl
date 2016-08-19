function tojs(x::LineStyle)
    res = Dict()
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    if x.opacity != nothing
        res["opacity"] = tojs(x.opacity)
    end
    return res
end
function tojs(x::AreaStyle)
    res = Dict()
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    if x.opacity != nothing
        res["opacity"] = tojs(x.opacity)
    end
    return res
end
function tojs(x::TextStyle)
    res = Dict()
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.fontStyle != nothing
        res["fontStyle"] = tojs(x.fontStyle)
    end
    if x.fontWeight != nothing
        res["fontWeight"] = tojs(x.fontWeight)
    end
    if x.fontFamily != nothing
        res["fontFamily"] = tojs(x.fontFamily)
    end
    if x.fontSize != nothing
        res["fontSize"] = tojs(x.fontSize)
    end
    return res
end
function tojs(x::SplitArea)
    res = Dict()
    if x.interval != nothing
        res["interval"] = tojs(x.interval)
    end
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.areaStyle != nothing
        res["areaStyle"] = tojs(x.areaStyle)
    end
    return res
end
function tojs(x::SplitLine)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.interval != nothing
        res["interval"] = tojs(x.interval)
    end
    if x.lineStyle != nothing
        res["lineStyle"] = tojs(x.lineStyle)
    end
    return res
end
function tojs(x::AxisLabel)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.interval != nothing
        res["interval"] = tojs(x.interval)
    end
    if x.inside != nothing
        res["inside"] = tojs(x.inside)
    end
    if x.rotate != nothing
        res["rotate"] = tojs(x.rotate)
    end
    if x.margin != nothing
        res["margin"] = tojs(x.margin)
    end
    if x.formatter != nothing
        res["formatter"] = tojs(x.formatter)
    end
    if x.textStyle != nothing
        res["textStyle"] = tojs(x.textStyle)
    end
    return res
end
function tojs(x::AxisLine)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.onZero != nothing
        res["onZero"] = tojs(x.onZero)
    end
    if x.lineStyle != nothing
        res["lineStyle"] = tojs(x.lineStyle)
    end
    return res
end
function tojs(x::AxisTick)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.interval != nothing
        res["interval"] = tojs(x.interval)
    end
    if x.inside != nothing
        res["inside"] = tojs(x.inside)
    end
    if x.length != nothing
        res["length"] = tojs(x.length)
    end
    if x.lineStyle != nothing
        res["lineStyle"] = tojs(x.lineStyle)
    end
    return res
end
function tojs(x::LabelOpts)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.textStyle != nothing
        res["textStyle"] = tojs(x.textStyle)
    end
    return res
end
function tojs(x::Label)
    res = Dict()
    if x.normal != nothing
        res["normal"] = tojs(x.normal)
    end
    if x.emphasis != nothing
        res["emphasis"] = tojs(x.emphasis)
    end
    return res
end
function tojs(x::ItemStyleOpts)
    res = Dict()
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.borderColor != nothing
        res["borderColor"] = tojs(x.borderColor)
    end
    if x.borderWidth != nothing
        res["borderWidth"] = tojs(x.borderWidth)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    if x.opacity != nothing
        res["opacity"] = tojs(x.opacity)
    end
    return res
end
function tojs(x::ItemStyle)
    res = Dict()
    if x.normal != nothing
        res["normal"] = tojs(x.normal)
    end
    if x.emphasis != nothing
        res["emphasis"] = tojs(x.emphasis)
    end
    return res
end
function tojs(x::IconStyleOpts)
    res = Dict()
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.borderColor != nothing
        res["borderColor"] = tojs(x.borderColor)
    end
    if x.borderWidth != nothing
        res["borderWidth"] = tojs(x.borderWidth)
    end
    if x.borderType != nothing
        res["borderType"] = tojs(x.borderType)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    if x.opacity != nothing
        res["opacity"] = tojs(x.opacity)
    end
    return res
end
function tojs(x::IconStyle)
    res = Dict()
    if x.normal != nothing
        res["normal"] = tojs(x.normal)
    end
    if x.emphasis != nothing
        res["emphasis"] = tojs(x.emphasis)
    end
    return res
end
function tojs(x::CrossStyle)
    res = Dict()
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    if x.opacity != nothing
        res["opacity"] = tojs(x.opacity)
    end
    if x.textStyle != nothing
        res["textStyle"] = tojs(x.textStyle)
    end
    return res
end
function tojs(x::ShadowStyle)
    res = Dict()
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    if x.opacity != nothing
        res["opacity"] = tojs(x.opacity)
    end
    return res
end
function tojs(x::AxisPointer)
    res = Dict()
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.axis != nothing
        res["axis"] = tojs(x.axis)
    end
    if x.animation != nothing
        res["animation"] = tojs(x.animation)
    end
    if x.animationThreshold != nothing
        res["animationThreshold"] = tojs(x.animationThreshold)
    end
    if x.animationDuration != nothing
        res["animationDuration"] = tojs(x.animationDuration)
    end
    if x.animationDelay != nothing
        res["animationDelay"] = tojs(x.animationDelay)
    end
    if x.animationDurationUpdate != nothing
        res["animationDurationUpdate"] = tojs(x.animationDurationUpdate)
    end
    if x.animationEasingUpdate != nothing
        res["animationEasingUpdate"] = tojs(x.animationEasingUpdate)
    end
    if x.animationDelayUpdate != nothing
        res["animationDelayUpdate"] = tojs(x.animationDelayUpdate)
    end
    if x.lineStyle != nothing
        res["lineStyle"] = tojs(x.lineStyle)
    end
    if x.crossStyle != nothing
        res["crossStyle"] = tojs(x.crossStyle)
    end
    if x.shadowStyle != nothing
        res["shadowStyle"] = tojs(x.shadowStyle)
    end
    return res
end
function tojs(x::Tooltip)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.showContent != nothing
        res["showContent"] = tojs(x.showContent)
    end
    if x.trigger != nothing
        res["trigger"] = tojs(x.trigger)
    end
    if x.triggerOn != nothing
        res["triggerOn"] = tojs(x.triggerOn)
    end
    if x.alwaysShowContent != nothing
        res["alwaysShowContent"] = tojs(x.alwaysShowContent)
    end
    if x.showDelay != nothing
        res["showDelay"] = tojs(x.showDelay)
    end
    if x.hideDelay != nothing
        res["hideDelay"] = tojs(x.hideDelay)
    end
    if x.enterable != nothing
        res["enterable"] = tojs(x.enterable)
    end
    if x.position != nothing
        res["position"] = tojs(x.position)
    end
    if x.transitionDuration != nothing
        res["transitionDuration"] = tojs(x.transitionDuration)
    end
    if x.formatter != nothing
        res["formatter"] = tojs(x.formatter)
    end
    if x.backgroundColor != nothing
        res["backgroundColor"] = tojs(x.backgroundColor)
    end
    if x.borderColor != nothing
        res["borderColor"] = tojs(x.borderColor)
    end
    if x.borderWidth != nothing
        res["borderWidth"] = tojs(x.borderWidth)
    end
    if x.padding != nothing
        res["padding"] = tojs(x.padding)
    end
    if x.textStyle != nothing
        res["textStyle"] = tojs(x.textStyle)
    end
    if x.extraCssText != nothing
        res["extraCssText"] = tojs(x.extraCssText)
    end
    if x.axisPointer != nothing
        res["axisPointer"] = tojs(x.axisPointer)
    end
    return res
end
function tojs(x::Legend)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x.height != nothing
        res["height"] = tojs(x.height)
    end
    if x.orient != nothing
        res["orient"] = tojs(x.orient)
    end
    if x.align != nothing
        res["align"] = tojs(x.align)
    end
    if x.padding != nothing
        res["padding"] = tojs(x.padding)
    end
    if x.itemGap != nothing
        res["itemGap"] = tojs(x.itemGap)
    end
    if x.itemWidth != nothing
        res["itemWidth"] = tojs(x.itemWidth)
    end
    if x.itemHeight != nothing
        res["itemHeight"] = tojs(x.itemHeight)
    end
    if x.formatter != nothing
        res["formatter"] = tojs(x.formatter)
    end
    if x.selectedMode != nothing
        res["selectedMode"] = tojs(x.selectedMode)
    end
    if x.selected != nothing
        res["selected"] = tojs(x.selected)
    end
    if x.textStyle != nothing
        res["textStyle"] = tojs(x.textStyle)
    end
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    if x.backgroundColor != nothing
        res["backgroundColor"] = tojs(x.backgroundColor)
    end
    if x.borderColor != nothing
        res["borderColor"] = tojs(x.borderColor)
    end
    if x.borderWidth != nothing
        res["borderWidth"] = tojs(x.borderWidth)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    return res
end
function tojs(x::Toolbox)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.orient != nothing
        res["orient"] = tojs(x.orient)
    end
    if x.itemGap != nothing
        res["itemGap"] = tojs(x.itemGap)
    end
    if x.itemSize != nothing
        res["itemSize"] = tojs(x.itemSize)
    end
    if x.feature != nothing
        res["feature"] = tojs(x.feature)
    end
    if x.showTitle != nothing
        res["showTitle"] = tojs(x.showTitle)
    end
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.iconStyle != nothing
        res["iconStyle"] = tojs(x.iconStyle)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x.height != nothing
        res["height"] = tojs(x.height)
    end
    return res
end
function tojs(x::Axis)
    res = Dict()
    if x.gridIndex != nothing
        res["gridIndex"] = tojs(x.gridIndex)
    end
    if x.position != nothing
        res["position"] = tojs(x.position)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x.nameLocation != nothing
        res["nameLocation"] = tojs(x.nameLocation)
    end
    if x.nameTextStyle != nothing
        res["nameTextStyle"] = tojs(x.nameTextStyle)
    end
    if x.nameGap != nothing
        res["nameGap"] = tojs(x.nameGap)
    end
    if x.inverse != nothing
        res["inverse"] = tojs(x.inverse)
    end
    if x.boundaryGap != nothing
        res["boundaryGap"] = tojs(x.boundaryGap)
    end
    if x.min != nothing
        res["min"] = tojs(x.min)
    end
    if x.max != nothing
        res["max"] = tojs(x.max)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    if x.splitNumber != nothing
        res["splitNumber"] = tojs(x.splitNumber)
    end
    if x.minInterval != nothing
        res["minInterval"] = tojs(x.minInterval)
    end
    if x.interval != nothing
        res["interval"] = tojs(x.interval)
    end
    if x.silent != nothing
        res["silent"] = tojs(x.silent)
    end
    if x.axisLine != nothing
        res["axisLine"] = tojs(x.axisLine)
    end
    if x.axisTick != nothing
        res["axisTick"] = tojs(x.axisTick)
    end
    if x.axisLabel != nothing
        res["axisLabel"] = tojs(x.axisLabel)
    end
    if x.splitLine != nothing
        res["splitLine"] = tojs(x.splitLine)
    end
    if x.splitArea != nothing
        res["splitArea"] = tojs(x.splitArea)
    end
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    return res
end
function tojs(x::Title)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.text != nothing
        res["text"] = tojs(x.text)
    end
    if x.link != nothing
        res["link"] = tojs(x.link)
    end
    if x.target != nothing
        res["target"] = tojs(x.target)
    end
    if x.textStyle != nothing
        res["textStyle"] = tojs(x.textStyle)
    end
    if x.subtext != nothing
        res["subtext"] = tojs(x.subtext)
    end
    if x.sublink != nothing
        res["sublink"] = tojs(x.sublink)
    end
    if x.subtarget != nothing
        res["subtarget"] = tojs(x.subtarget)
    end
    if x.subtextStyle != nothing
        res["subtextStyle"] = tojs(x.subtextStyle)
    end
    if x.padding != nothing
        res["padding"] = tojs(x.padding)
    end
    if x.itemGap != nothing
        res["itemGap"] = tojs(x.itemGap)
    end
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.backgroundColor != nothing
        res["backgroundColor"] = tojs(x.backgroundColor)
    end
    if x.borderColor != nothing
        res["borderColor"] = tojs(x.borderColor)
    end
    if x.borderWidth != nothing
        res["borderWidth"] = tojs(x.borderWidth)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    return res
end
function tojs(x::Grid)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x.height != nothing
        res["height"] = tojs(x.height)
    end
    if x.containLabel != nothing
        res["containLabel"] = tojs(x.containLabel)
    end
    if x.backgroundColor != nothing
        res["backgroundColor"] = tojs(x.backgroundColor)
    end
    if x.borderColor != nothing
        res["borderColor"] = tojs(x.borderColor)
    end
    if x.borderWidth != nothing
        res["borderWidth"] = tojs(x.borderWidth)
    end
    if x.shadowBlur != nothing
        res["shadowBlur"] = tojs(x.shadowBlur)
    end
    if x.shadowColor != nothing
        res["shadowColor"] = tojs(x.shadowColor)
    end
    if x.shadowOffsetX != nothing
        res["shadowOffsetX"] = tojs(x.shadowOffsetX)
    end
    if x.shadowOffsetY != nothing
        res["shadowOffsetY"] = tojs(x.shadowOffsetY)
    end
    return res
end
function tojs(x::DataZoom)
    res = Dict()
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.start != nothing
        res["start"] = tojs(x.start)
    end
    if x._end != nothing
        res["end"] = tojs(x._end)
    end
    return res
end
function tojs(x::Timeline)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.axisType != nothing
        res["axisType"] = tojs(x.axisType)
    end
    if x.currentIndex != nothing
        res["currentIndex"] = tojs(x.currentIndex)
    end
    if x.autoPlay != nothing
        res["autoPlay"] = tojs(x.autoPlay)
    end
    if x.rewind != nothing
        res["rewind"] = tojs(x.rewind)
    end
    if x.loop != nothing
        res["loop"] = tojs(x.loop)
    end
    if x.playInterval != nothing
        res["playInterval"] = tojs(x.playInterval)
    end
    if x.realtime != nothing
        res["realtime"] = tojs(x.realtime)
    end
    if x.controlPosition != nothing
        res["controlPosition"] = tojs(x.controlPosition)
    end
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.padding != nothing
        res["padding"] = tojs(x.padding)
    end
    if x.orient != nothing
        res["orient"] = tojs(x.orient)
    end
    if x.inverse != nothing
        res["inverse"] = tojs(x.inverse)
    end
    if x.symbol != nothing
        res["symbol"] = tojs(x.symbol)
    end
    if x.symbolSize != nothing
        res["symbolSize"] = tojs(x.symbolSize)
    end
    if x.symbolRotate != nothing
        res["symbolRotate"] = tojs(x.symbolRotate)
    end
    if x.symbolOffset != nothing
        res["symbolOffset"] = tojs(x.symbolOffset)
    end
    if x.lineStyle != nothing
        res["lineStyle"] = tojs(x.lineStyle)
    end
    if x.label != nothing
        res["label"] = tojs(x.label)
    end
    if x.itemStyle != nothing
        res["itemStyle"] = tojs(x.itemStyle)
    end
    if x.checkpointStyle != nothing
        res["checkpointStyle"] = tojs(x.checkpointStyle)
    end
    if x.controlStyle != nothing
        res["controlStyle"] = tojs(x.controlStyle)
    end
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    return res
end
function tojs(x::Polar)
    res = Dict()
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.center != nothing
        res["center"] = tojs(x.center)
    end
    if x.radius != nothing
        res["radius"] = tojs(x.radius)
    end
    return res
end
function tojs(x::RadiusAxis)
    res = Dict()
    if x.polarIndex != nothing
        res["polarIndex"] = tojs(x.polarIndex)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x.nameLocation != nothing
        res["nameLocation"] = tojs(x.nameLocation)
    end
    if x.nameTextStyle != nothing
        res["nameTextStyle"] = tojs(x.nameTextStyle)
    end
    if x.nameGap != nothing
        res["nameGap"] = tojs(x.nameGap)
    end
    if x.inverse != nothing
        res["inverse"] = tojs(x.inverse)
    end
    if x.boundaryGap != nothing
        res["boundaryGap"] = tojs(x.boundaryGap)
    end
    if x.min != nothing
        res["min"] = tojs(x.min)
    end
    if x.max != nothing
        res["max"] = tojs(x.max)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    if x.splitNumber != nothing
        res["splitNumber"] = tojs(x.splitNumber)
    end
    if x.minInterval != nothing
        res["minInterval"] = tojs(x.minInterval)
    end
    if x.interval != nothing
        res["interval"] = tojs(x.interval)
    end
    if x.silent != nothing
        res["silent"] = tojs(x.silent)
    end
    if x.axisLine != nothing
        res["axisLine"] = tojs(x.axisLine)
    end
    if x.axisTick != nothing
        res["axisTick"] = tojs(x.axisTick)
    end
    if x.axisLabel != nothing
        res["axisLabel"] = tojs(x.axisLabel)
    end
    if x.splitLine != nothing
        res["splitLine"] = tojs(x.splitLine)
    end
    if x.splitArea != nothing
        res["splitArea"] = tojs(x.splitArea)
    end
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    return res
end
function tojs(x::AngleAxis)
    res = Dict()
    if x.polarIndex != nothing
        res["polarIndex"] = tojs(x.polarIndex)
    end
    if x.startAngle != nothing
        res["startAngle"] = tojs(x.startAngle)
    end
    if x.clockwise != nothing
        res["clockwise"] = tojs(x.clockwise)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.boundaryGap != nothing
        res["boundaryGap"] = tojs(x.boundaryGap)
    end
    if x.min != nothing
        res["min"] = tojs(x.min)
    end
    if x.max != nothing
        res["max"] = tojs(x.max)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    if x.splitNumber != nothing
        res["splitNumber"] = tojs(x.splitNumber)
    end
    if x.minInterval != nothing
        res["minInterval"] = tojs(x.minInterval)
    end
    if x.interval != nothing
        res["interval"] = tojs(x.interval)
    end
    if x.silent != nothing
        res["silent"] = tojs(x.silent)
    end
    if x.axisLine != nothing
        res["axisLine"] = tojs(x.axisLine)
    end
    if x.axisTick != nothing
        res["axisTick"] = tojs(x.axisTick)
    end
    if x.axisLabel != nothing
        res["axisLabel"] = tojs(x.axisLabel)
    end
    if x.splitLine != nothing
        res["splitLine"] = tojs(x.splitLine)
    end
    if x.splitArea != nothing
        res["splitArea"] = tojs(x.splitArea)
    end
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    return res
end
function tojs(x::Radar)
    res = Dict()
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.center != nothing
        res["center"] = tojs(x.center)
    end
    if x.radius != nothing
        res["radius"] = tojs(x.radius)
    end
    if x.startAngle != nothing
        res["startAngle"] = tojs(x.startAngle)
    end
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x.nameGap != nothing
        res["nameGap"] = tojs(x.nameGap)
    end
    if x.silent != nothing
        res["silent"] = tojs(x.silent)
    end
    if x.axisLine != nothing
        res["axisLine"] = tojs(x.axisLine)
    end
    if x.axisTick != nothing
        res["axisTick"] = tojs(x.axisTick)
    end
    if x.axisLabel != nothing
        res["axisLabel"] = tojs(x.axisLabel)
    end
    if x.splitLine != nothing
        res["splitLine"] = tojs(x.splitLine)
    end
    if x.splitArea != nothing
        res["splitArea"] = tojs(x.splitArea)
    end
    if x.indicator != nothing
        res["indicator"] = tojs(x.indicator)
    end
    return res
end
function tojs(x::VisualMap)
    res = Dict()
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    return res
end
function tojs(x::ScaleLimit)
    res = Dict()
    if x.min != nothing
        res["min"] = tojs(x.min)
    end
    if x.max != nothing
        res["max"] = tojs(x.max)
    end
    return res
end
function tojs(x::Geo)
    res = Dict()
    if x.show != nothing
        res["show"] = tojs(x.show)
    end
    if x.map != nothing
        res["map"] = tojs(x.map)
    end
    if x.roam != nothing
        res["roam"] = tojs(x.roam)
    end
    if x.center != nothing
        res["center"] = tojs(x.center)
    end
    if x.zoom != nothing
        res["zoom"] = tojs(x.zoom)
    end
    if x.scaleLimit != nothing
        res["scaleLimit"] = tojs(x.scaleLimit)
    end
    if x.nameMap != nothing
        res["nameMap"] = tojs(x.nameMap)
    end
    if x.selectedMode != nothing
        res["selectedMode"] = tojs(x.selectedMode)
    end
    if x.label != nothing
        res["label"] = tojs(x.label)
    end
    if x.itemStyle != nothing
        res["itemStyle"] = tojs(x.itemStyle)
    end
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.regions != nothing
        res["regions"] = tojs(x.regions)
    end
    if x.silent != nothing
        res["silent"] = tojs(x.silent)
    end
    return res
end
function tojs(x::Parallel)
    res = Dict()
    if x.zlevel != nothing
        res["zlevel"] = tojs(x.zlevel)
    end
    if x.z != nothing
        res["z"] = tojs(x.z)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x.height != nothing
        res["height"] = tojs(x.height)
    end
    if x.layout != nothing
        res["layout"] = tojs(x.layout)
    end
    if x.parallelAxisDefault != nothing
        res["parallelAxisDefault"] = tojs(x.parallelAxisDefault)
    end
    return res
end
function tojs(x::AreaSelectStyle)
    res = Dict()
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x.borderWidth != nothing
        res["borderWidth"] = tojs(x.borderWidth)
    end
    if x.borderColor != nothing
        res["borderColor"] = tojs(x.borderColor)
    end
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.opacity != nothing
        res["opacity"] = tojs(x.opacity)
    end
    return res
end
function tojs(x::ParallelAxis)
    res = Dict()
    if x.dim != nothing
        res["dim"] = tojs(x.dim)
    end
    if x.parallelIndex != nothing
        res["parallelIndex"] = tojs(x.parallelIndex)
    end
    if x.areaSelectStyle != nothing
        res["areaSelectStyle"] = tojs(x.areaSelectStyle)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x.nameLocation != nothing
        res["nameLocation"] = tojs(x.nameLocation)
    end
    if x.nameTextStyle != nothing
        res["nameTextStyle"] = tojs(x.nameTextStyle)
    end
    if x.nameGap != nothing
        res["nameGap"] = tojs(x.nameGap)
    end
    if x.inverse != nothing
        res["inverse"] = tojs(x.inverse)
    end
    if x.boundaryGap != nothing
        res["boundaryGap"] = tojs(x.boundaryGap)
    end
    if x.min != nothing
        res["min"] = tojs(x.min)
    end
    if x.max != nothing
        res["max"] = tojs(x.max)
    end
    if x.scale != nothing
        res["scale"] = tojs(x.scale)
    end
    if x.splitNumber != nothing
        res["splitNumber"] = tojs(x.splitNumber)
    end
    if x.minInterval != nothing
        res["minInterval"] = tojs(x.minInterval)
    end
    if x.interval != nothing
        res["interval"] = tojs(x.interval)
    end
    if x.silent != nothing
        res["silent"] = tojs(x.silent)
    end
    if x.axisLine != nothing
        res["axisLine"] = tojs(x.axisLine)
    end
    if x.axisTick != nothing
        res["axisTick"] = tojs(x.axisTick)
    end
    if x.axisLabel != nothing
        res["axisLabel"] = tojs(x.axisLabel)
    end
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    return res
end
function tojs(x::Series)
    res = Dict()
    if x.name != nothing
        res["name"] = tojs(x.name)
    end
    if x._type != nothing
        res["type"] = tojs(x._type)
    end
    if x.data != nothing
        res["data"] = tojs(x.data)
    end
    if x.areaStyle != nothing
        res["areaStyle"] = tojs(x.areaStyle)
    end
    if x.smooth != nothing
        res["smooth"] = tojs(x.smooth)
    end
    if x.radius != nothing
        res["radius"] = tojs(x.radius)
    end
    if x.center != nothing
        res["center"] = tojs(x.center)
    end
    if x.roseType != nothing
        res["roseType"] = tojs(x.roseType)
    end
    if x.stack != nothing
        res["stack"] = tojs(x.stack)
    end
    if x.left != nothing
        res["left"] = tojs(x.left)
    end
    if x.right != nothing
        res["right"] = tojs(x.right)
    end
    if x.top != nothing
        res["top"] = tojs(x.top)
    end
    if x.bottom != nothing
        res["bottom"] = tojs(x.bottom)
    end
    if x.width != nothing
        res["width"] = tojs(x.width)
    end
    if x.min != nothing
        res["min"] = tojs(x.min)
    end
    if x.max != nothing
        res["max"] = tojs(x.max)
    end
    if x.minSize != nothing
        res["minSize"] = tojs(x.minSize)
    end
    if x.maxSize != nothing
        res["maxSize"] = tojs(x.maxSize)
    end
    if x.sort != nothing
        res["sort"] = tojs(x.sort)
    end
    if x.gap != nothing
        res["gap"] = tojs(x.gap)
    end
    if x.label != nothing
        res["label"] = tojs(x.label)
    end
    if x.labelLine != nothing
        res["labelLine"] = tojs(x.labelLine)
    end
    if x.itemStyle != nothing
        res["itemStyle"] = tojs(x.itemStyle)
    end
    return res
end
function tojs(x::EChart)
    res = Dict()
    if x.title != nothing
        res["title"] = tojs(x.title)
    end
    if x.legend != nothing
        res["legend"] = tojs(x.legend)
    end
    if x.grid != nothing
        res["grid"] = tojs(x.grid)
    end
    if x.xAxis != nothing
        res["xAxis"] = tojs(x.xAxis)
    end
    if x.yAxis != nothing
        res["yAxis"] = tojs(x.yAxis)
    end
    if x.polar != nothing
        res["polar"] = tojs(x.polar)
    end
    if x.radiusAxis != nothing
        res["radiusAxis"] = tojs(x.radiusAxis)
    end
    if x.angleAxis != nothing
        res["angleAxis"] = tojs(x.angleAxis)
    end
    if x.radar != nothing
        res["radar"] = tojs(x.radar)
    end
    if x.dataZoom != nothing
        res["dataZoom"] = tojs(x.dataZoom)
    end
    if x.visualMap != nothing
        res["visualMap"] = tojs(x.visualMap)
    end
    if x.tooltip != nothing
        res["tooltip"] = tojs(x.tooltip)
    end
    if x.toolbox != nothing
        res["toolbox"] = tojs(x.toolbox)
    end
    if x.geo != nothing
        res["geo"] = tojs(x.geo)
    end
    if x.parallel != nothing
        res["parallel"] = tojs(x.parallel)
    end
    if x.parallelAxis != nothing
        res["parallelAxis"] = tojs(x.parallelAxis)
    end
    if x.timeline != nothing
        res["timeline"] = tojs(x.timeline)
    end
    if x.series != nothing
        res["series"] = tojs(x.series)
    end
    if x.color != nothing
        res["color"] = tojs(x.color)
    end
    if x.backgroundColor != nothing
        res["backgroundColor"] = tojs(x.backgroundColor)
    end
    if x.textStyle != nothing
        res["textStyle"] = tojs(x.textStyle)
    end
    if x.animation != nothing
        res["animation"] = tojs(x.animation)
    end
    if x.animationDuration != nothing
        res["animationDuration"] = tojs(x.animationDuration)
    end
    if x.animationEasing != nothing
        res["animationEasing"] = tojs(x.animationEasing)
    end
    if x.animationDelay != nothing
        res["animationDelay"] = tojs(x.animationDelay)
    end
    if x.animationDurationUpdate != nothing
        res["animationDurationUpdate"] = tojs(x.animationDurationUpdate)
    end
    if x.animationEasingUpdate != nothing
        res["animationEasingUpdate"] = tojs(x.animationEasingUpdate)
    end
    if x.animationDelayUpdate != nothing
        res["animationDelayUpdate"] = tojs(x.animationDelayUpdate)
    end
    return res
end

tojs(s::Symbol) = string(s)
tojs(v::Vector) = [tojs(v_i) for v_i in v]

function tojs(v::Dict)
    res = Dict()
    for (k, v) in v
        res[k] = tojs(v)
    end
    return res
end
tojs(x::Any) = x
