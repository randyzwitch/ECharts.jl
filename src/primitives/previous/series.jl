series_spec =
[
    (:zlevel, Int, 0),
    (:z, Int, 2),
    (:_type, AbstractString, nothing),
    (:name, AbstractString, nothing),
    (:tooltip, Tooltip, nothing),
    (:clickable, Bool, true),
    (:itemStyle, ItemStyle, nothing),
    (:data, AbstractVector, nothing),
    (:markPoint, MarkPoint, nothing),
    (:markLine, MarkLine, nothing),

    ## Cartesian
    (:stack, AbstractString, nothing),
    (:xAxisIndex, Number, nothing),
    (:yAxisIndex, Number, nothing),
    (:barGap, Union{AbstractString, Number}, nothing),
    (:barCategoryGap, Union{AbstractString, Number}, nothing),
    (:barMinHeight, Number, nothing),
    (:barWidth, Number, nothing),
    (:barMaxWidth, Number, nothing),
    (:_symbol, AbstractString, "none"),
    (:symbolSize, Union{Number, AbstractVector}, nothing),
    (:symbolRotate, Number, nothing),
    (:showAllSymbol, Bool, nothing),
    (:smooth, Bool, nothing),
    (:dataFilter,  AbstractString, nothing),
    (:large, Bool, nothing),
    (:largeThreshold, Number, nothing),
    (:legendHoverLink, Bool, nothing),

    ## Pie
    (:center, AbstractVector, nothing),
    (:radius, Union{Number, AbstractVector}, nothing),
    (:startAngle, Number, nothing),
    (:minAngle, Number, nothing),
    (:clockWise, Bool, nothing),
    (:roseType, AbstractString, nothing),
    (:selectedOffset, Number, nothing),
    (:selectedMode, Union{Number, Bool, AbstractString}, nothing),
    #(:legendHoverLink, Bool, nothing)

    ## Radar
    (:polarIndex, Number, nothing),
    #(:_symbol, AbstractString, nothing),
    #(:symbolSize, Union{Number, AbstractVector}, nothing),
    #(:legendHoverLink, Bool, nothing)

    ## Map
    #(:selectedMode, Union{Number, Bool, AbstractString}, nothing),
    (:mapType, AbstractString, nothing),
    (:hoverable, Bool, nothing),
    (:dataRangeHoverLink, Bool, nothing),
    (:mapLocation, Dict{Any, Any}, nothing),
    (:mapValueCalculation, AbstractString, nothing),
    (:mapValuePrecision, Number, nothing),
    (:showLegendSymbol, Bool, nothing),
    (:roam, Union{Bool, AbstractString}, nothing),
    (:scaleLimit, Dict{Any, Any}, nothing),
    (:nameMap, Dict{Any, Any}, nothing),
    (:textFixed, Dict{Any, Any}, nothing),
    (:geoCoord, Dict{Any, Any}, nothing),
    #(:heatmap, Dict{Any, Any}, nothing),

    ## Heatmap
    (:blurSize, Number, nothing),
    (:gradientColors, AbstractVector, nothing),
    (:minAlpha, Number, nothing),
    (:valueScale, Number, nothing),
    (:opacity, Number, nothing),

    ## Force
    (:categories, AbstractArray, nothing),
    (:nodes, AbstractArray, nothing),
    (:links, AbstractArray, nothing),
    (:matrix, AbstractArray, nothing),
    #(:center, AbstractVector, nothing),
    (:size, Union{Number, AbstractVector}, nothing),
    (:minRadius, Number, nothing),
    (:maxRadius, Number, nothing),
    #(:_symbol, AbstractString, nothing),
    #(:symbolSize, Union{Number, AbstractVector}, nothing),
    (:linkSymbol, AbstractString, nothing),
    (:linkSymbolSize, AbstractVector, nothing),
    (:scaling, Number, nothing),
    (:gravity, Number, nothing),
    (:draggable, Bool, nothing),
    #(:large, Bool, nothing),
    (:useWorker, Bool, nothing),
    (:steps, Number, nothing),
    #(:roam, Union{Bool, AbstractString}, nothing),

    ## Chord
    #(:categories, AbstractArray, nothing),
    #(:nodes, AbstractArray, nothing),
    #(:links, AbstractArray, nothing),
    #(:matrix, AbstractArray, nothing),
    (:ribbonType, Bool, nothing),
    #(:_symbol, AbstractString, nothing),
    #(:symbolSize, Union{Number, AbstractVector}, nothing),
    #(:minRadius, Number, nothing),
    #(:maxRadius, Number, nothing),
    (:showScale, Bool, nothing),
    (:showScaleText, Bool, nothing),
    (:padding, Number, nothing),
    (:sort, AbstractString, nothing),
    (:sortSub, AbstractString, nothing),
    #(:clockWise, Bool, nothing),

    ## Gauge
    #(:center, AbstractVector, nothing),
    #(:radius, Union{Number, AbstractVector}, nothing),
    #(:startAngle, Number, nothing),
    (:endAngle, Number, nothing),
    (:min, Number, nothing),
    (:max, Number, nothing),
    (:splitNumber, Number, nothing),
    (:axisLine, AxisLine, nothing),
    (:axisTick, AxisTick, nothing),
    (:axisLabel, AxisLabel, nothing),
    (:splitLine, SplitLine, nothing),
    (:pointer, Dict{Any, Any}, nothing),
    (:title, Title, nothing),
    (:detail, Dict{Any, Any}, nothing),
    #(:legendHoverLink, Bool, nothing)

    ## Funnel
    (:x, Union{Number, AbstractString}, nothing),
    (:y, Union{Number, AbstractString}, nothing),
    (:x2, Union{Number, AbstractString}, nothing),
    (:y2, Union{Number, AbstractString}, nothing),
    (:width, Union{Number, AbstractString}, nothing),
    (:height, Union{Number, AbstractString}, nothing),
    (:funnelAlign, AbstractString, nothing),
    #(:min, Number, nothing),
    #(:max, Number, nothing),
    (:minSize, AbstractString, nothing),
    (:maxSize, AbstractString, nothing),
    #(:sort, AbstractString, nothing),
    (:gap, Number, nothing),
    #(:legendHoverLink, Bool, nothing)

    ## Event River
    #(:xAxisIndex, Number, nothing),
    (:weight, Number, nothing),
    #(:data, AbstractVector, nothing),
    #(:legendHoverLink, Bool, nothing)

    ## Treemap
    #(:center, AbstractVector, nothing),
    #(:size, Union{Number, AbstractVector}, nothing),
    (:root, AbstractString, nothing),
    #(:itemStyle, Dict{Any, Any}, nothing),
    #(:data, AbstractVector, nothing),

    ## Tree
    (:rootLocation, Dict{Any, Any}, nothing),
    (:layerPadding, Number, nothing),
    (:nodePadding, Number, nothing),
    (:orient, AbstractString, nothing),
    (:direction, AbstractString, nothing),
    #(:roam, Union{Bool, AbstractString}, nothing),
    #(:_symbol, AbstractString, nothing),
    #(:symbolSize, Union{Number, AbstractVector}, nothing),
    #(:itemStyle, Dict{Any, Any}, nothing),
    #(:data, AbstractVector, nothing),

    ## Venn
    #(:itemStyle, Dict{Any, Any}, nothing),
    #(:data, AbstractVector, nothing),

    ## Wordcloud
    #(:center, AbstractVector, nothing),
    #(:size, Union{Number, AbstractVector}, nothing),
    (:autoSize, Dict{Any, Any}, nothing),
    #(:itemStyle, Dict{Any, Any}, nothing),

]

primitivefactory(:Series, series_spec)