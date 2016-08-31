function circular_plot(names::AbstractVector = [], values::AbstractVector = [];
                        selected::AbstractVector = [],
                        radius::Union{AbstractVector, String, Void} = "90%",
                        center::Union{AbstractVector, String, Void} = ["50%", "50%"],
                        roseType::Union{String, Void} = nothing, # roseType = {"angle", "radius"}
                        kwargs...
                        )

    # Set default to false if not passed by user
    selected == [] ? selected = [false for x in 1:length(values)] : selected = selected

    data_fmt = dataformat(value = values, name = names, selected = selected)
    ec = deepcopy(EChart())
    ec.series = [Series(_type = "pie", radius = radius, center = center, data = data_fmt, roseType = roseType)]

    #Process keyword args after defined functionality
    if length(kwargs) > 0
        for (k, v) in kwargs
           setfield!(ec, k, v)
       end
    end

    return ec

end

pie(names::AbstractVector, values::AbstractVector;
            selected::AbstractVector = [],
            radius::Union{AbstractVector, String} = "90%",
            center::Union{AbstractVector, String}  = ["50%", "50%"],
            roseType::Union{String, Void} = nothing,
            kwargs...
            ) =
            circular_plot(names, values; selected = selected, radius = radius, center = center, roseType = roseType, kwargs...)

donut(names::AbstractVector, values::AbstractVector;
            selected::AbstractVector = [],
            radius::Union{AbstractVector, String} = ["50%", "90%"],
            roseType::Union{String, Void} = nothing,
            kwargs...
            ) =
            circular_plot(names, values; selected = selected, radius = radius, center = nothing, roseType = roseType, kwargs...)

function gauge(x::Number; kwargs...)

    ec = deepcopy(EChart())
    ec.series = [Series(_type = "gauge", data = [Dict("value" => x)])]

    #Process keyword args after defined functionality
    if length(kwargs) > 0
        for (k, v) in kwargs
           setfield!(ec, k, v)
       end
    end

    return ec

end

function polar(angle::AbstractVector, radius::AbstractVector; splitNumber::Int = 12, showSymbol::Bool = false, kwargs...)

    ec = deepcopy(EChart())
    ec.polar = ECharts.Polar()
    ec.angleAxis = ECharts.AngleAxis(_type = "value", splitNumber = splitNumber)
    ec.radiusAxis = ECharts.RadiusAxis(min = 0)
    ec.series = [Series(coordinateSystem = "polar", _type = "line", showSymbol = showSymbol, data = [[r,a] for (r,a) in zip(radius, angle)])]

    #Process keyword args after defined functionality
    if length(kwargs) > 0
        for (k, v) in kwargs
           setfield!(ec, k, v)
       end
    end

    return ec

end
