function aria!(ec::EChart; show::Bool = true, description::Union{String, Nothing} = nothing, general::Union{Dict, Nothing} = nothing, series::Union{Dict, Nothing} = nothing, data::Union{Dict, Nothing} = nothing)

    ec.aria = Aria(show = show, description = description, general = general, series = series, data = data)
    return ec

end
