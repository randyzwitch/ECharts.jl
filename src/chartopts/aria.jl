function aria!(ec::EChart; show::Bool = true, description::String = "", general::Dict = Dict(), series::Dict = Dict(), data::Dict = Dict())

    ec.aria = Aria(show = show, description = description, general = general, series = series, data = data)
    return ec

end
