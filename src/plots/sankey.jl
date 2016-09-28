function sankey{T <: Real}(name::AbstractVector{String}, source::AbstractVector{Int}, target::AbstractVector{Int}, value::AbstractVector{T}; kwargs...)

    ec = newplot(kwargs)
    ec.series = [Series(_type = "sankey", layout = "none", data = dataformat(name = name),
        links = dataformat(source = source, target = target, value = value))]

    return ec

end
