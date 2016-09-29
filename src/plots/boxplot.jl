#Make this work with seriesnames!?
function box{T <: Real}(data::Vector{Vector{T}};
            names::Union{AbstractVector, Void} = nothing,
            kwargs...)

    names == nothing ? names = [string(x) for x in 1:length(data)] : names
    length(names) != length(data) ? error("Number of series names must equal number of data series.") : nothing

    dataprep = [boxplotstat(x) for x in data]
    seriesdata = [x[1] for x in dataprep]

    #Format outliers to ECharts nested array format
    outliers = []
    for (i, s_) in enumerate(dataprep)
        if length(s_[2]) > 0
            for outlier in s_[2]
                push!(outliers, [names[i], outlier])
            end
        end
    end

    ec = newplot(kwargs, charttype = "box")

    ec.xAxis = [Axis(_type = "category", data = names, boundaryGap = true)]
    ec.yAxis = [Axis(_type = "value")]

    ec.series = [Series(name = "boxplot", _type = "boxplot", data = seriesdata)]
    push!(ec.series, Series(name = "outliers", _type = "scatter", data = outliers))

    return ec

end

function box{T <: Real}(data::Vector{T};
            names::Union{AbstractVector, Void} = nothing,
            kwargs...)

    return box([data], names = names, kwargs...)

end
