function tree(data::AbstractVector; orient::String = "horizontal", layout::String = "tree", kwargs...)
    ec = newplot(kwargs, ec_charttype = "tree")
    ec.series = [TreeSeries(data = data, orient = orient)]
    ec
end
