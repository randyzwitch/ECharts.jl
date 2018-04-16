function tree(data::AbstractVector; kwargs...)
    ec = newplot(kwargs, ec_charttype = "tree")
    ec.series = [TreeSeries(data = data)]
    ec
end
