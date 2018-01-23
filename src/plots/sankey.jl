function sankey(name::AbstractVector,
                source::AbstractVector{<:Union{Missing, Int}},
                target::AbstractVector{<:Union{Missing, Int}},
                value::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
                 kwargs...)

    ec = newplot(kwargs, ec_charttype = "sankey")
    ec.series = [Series(name = "Series 1", _type = "sankey", layout = "none", data = arrayofdicts(name = name),
        links = arrayofdicts(source = source, target = target, value = value))]

    return ec

end
