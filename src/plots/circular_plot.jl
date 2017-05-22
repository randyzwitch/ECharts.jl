function circular_plot(names::AbstractVector = [], values::AbstractVector = [];
            selected::AbstractVector = [],
            radius::Union{AbstractVector, String, Void} = "80%",
            center::Union{AbstractVector, String, Void} = ["50%", "50%"],
            roseType::Union{String, Void} = nothing, # roseType = {"angle", "radius"}
            legend::Bool = false,
            kwargs...
            )

    # Set default to false if not passed by user
    selected == [] ? selected = [false for x in 1:length(values)] : selected = selected

    ec = newplot(kwargs, ec_charttype = "circular")

    data_fmt = arrayofdicts(value = values, name = names, selected = selected)

    ec.series = [Series(name = "Series 1", _type = "pie", radius = radius, center = center, data = data_fmt, roseType = roseType)]

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end
