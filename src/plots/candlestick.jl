function candlestick{T <: Real}(dt::AbstractVector{String}, open::AbstractVector{T}, close::AbstractVector{T}, low::AbstractVector{T}, high::AbstractVector{T}; kwargs...)

    #Put in array of array format
    fmtdata = []
    for (o,c,l,h) in zip(open, close, low, high)
        push!(fmtdata, [o,c,l,h])
    end

    ec = newplot(kwargs, ec_charttype = "candlestick")
    ec.xAxis = [Axis(_type = "category", data = dt, scale = true, boundaryGap = true)]
    ec.yAxis = [Axis(scale = true)]
    ec.series = [Series(name = "Series 1", _type = "candlestick", data = fmtdata)]

    return ec

end
