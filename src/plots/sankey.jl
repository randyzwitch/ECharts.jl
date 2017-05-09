function sankey{T <: Real}(name::AbstractVector{String}, source::AbstractVector{Int}, target::AbstractVector{Int}, value::AbstractVector{T};
                            legend::Bool = false,
                            kwargs...)

    ec = newplot(kwargs, ec_charttype = "sankey")
    ec.series = [Series(name = "Series 1", _type = "sankey", layout = "none", data = dataformat(name = name),
        links = dataformat(source = source, target = target, value = value))]

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end
