donut(names::AbstractVector, values::AbstractVector;
            selected::AbstractVector = [],
            radius::Union{AbstractVector, String} = ["50%", "80%"],
            center::Union{AbstractVector, String} = ["50%", "50%"],
            roseType::Union{String, Void} = nothing,
            legend::Bool = false,
            kwargs...
            ) =
            circular_plot(names, values; selected = selected, radius = radius, center = center, roseType = roseType, legend = legend, kwargs...)
