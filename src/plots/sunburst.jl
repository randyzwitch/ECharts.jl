function sunburst(data::AbstractVector; kwargs...)
    ec = newplot(kwargs, ec_charttype = "sunburst")
    ec.series = [SunburstSeries(data = data)]
    ec
end
