function circular_plot(names::AbstractVector = [], values::AbstractVector = [];
            selected::Union{AbstractVector, Nothing} = nothing,
            radius::Union{AbstractVector, String, Nothing} = "80%",
            center::Union{AbstractVector, String, Nothing} = ["50%", "50%"],
            roseType::Union{String, Nothing} = nothing, # roseType = {"angle", "radius"}
            legend::Bool = false,
            kwargs...
            )

    # Set default to false if not passed by user
    selected == nothing ? selected = [false for x in 1:length(values)] : selected = selected

    ec = newplot(kwargs, ec_charttype = "circular")

    data_fmt = arrayofdicts(value = values, name = names, selected = selected)

    ec.series = [PieSeries(name = "Series 1", radius = radius, center = center, data = data_fmt, roseType = roseType)]

    #Add legend if requested
    legend ? legend!(ec) : nothing

    return ec

end
