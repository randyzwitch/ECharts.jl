function treemap(data::AbstractVector; kwargs...)
    ec = newplot(kwargs, ec_charttype = "treemap")
    ec.series = [TreemapSeries(data = data)]
    ec
end
