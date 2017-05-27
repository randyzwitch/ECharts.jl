function waterfall{T <: Real}(x::AbstractVector, y::AbstractVector{T};
					legend::Bool = false,
					scale::Bool = false,
					kwargs...)

    #Need to add a value for total, since user passes in data values only
    labels = [string(x) for x in x]
    push!(labels, "total")

    #Calculate transparent series as base for stacking
    bottom = cumsum(y)
    bottom[1] = 0
    push!(bottom, 0)

    #Calculate actual waterfall
    top = abs.(y)
    push!(top, sum(y))

    #Make bottom series transparent
    trans = ItemStyleOpts(barBorderColor = "transparent", color = "transparent")

    ec = bar(labels, hcat(bottom, top), stack = true, legend = legend, scale = scale, kwargs...)
    ec.series[1].itemStyle = ItemStyle(normal = trans, emphasis = trans )

    return ec
end
