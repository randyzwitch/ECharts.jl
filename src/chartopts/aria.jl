function aria!(ec::EChart; show::Bool = true, description::Union{String, Void} = nothing, general::Union{Dict, Void} = nothing, series::Union{Dict, Void} = nothing, data::Union{Dict, Void} = nothing)

    ec.aria = Aria(show = show, description = description, general = general, series = series, data = data)
    return ec

end
