function sankey(name::AbstractVector{String}, source::AbstractVector{Int}, target::AbstractVector{Int}, value::AbstractVector{T};
                 kwargs...) where T <: Real

    ec = newplot(kwargs, ec_charttype = "sankey")
    ec.series = [Series(name = "Series 1", _type = "sankey", layout = "none", data = arrayofdicts(name = name),
        links = arrayofdicts(source = source, target = target, value = value))]

    return ec

end
