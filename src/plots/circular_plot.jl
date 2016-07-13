
function circular_plot(; values::AbstractVector = [],
                        names::AbstractVector = [],
                        selected::AbstractVector = [],
                        radius::Union{AbstractVector, String, Void} = "90%",
                        center::Union{AbstractVector, String, Void} = ["50%", "50%"],
                        roseType::Union{String, Void} = nothing # roseType = {"angle", "radius"}
                        )

    if length(values) != length(names)
    	error("Arrays values and names need to have the same length.")
    end

    data_fmt = dataformat(values = values, names = names, selected = selected)
    ec = deepcopy(EChart())
    ec.series = [Series(_type = "pie", radius = radius, center = center, data = data_fmt, roseType = roseType)]

    return ec

end

piechart(;values::AbstractVector = [], names::AbstractVector = [], selected::AbstractVector = [], radius::Union{AbstractVector, String} = "90%", center::Union{AbstractVector, String}  = ["50%", "50%"], roseType::Union{String, Void} = nothing) =
    circular_plot(values = values, names = names, selected = selected, radius = radius, center = center, roseType = roseType)

donutchart(;values::AbstractVector = [], names::AbstractVector = [], selected::AbstractVector = [], radius::Union{AbstractVector, String} = ["50%", "90%"], roseType::Union{String, Void} = nothing) =
    circular_plot(values = values, names = names, selected = selected, radius = radius, center = nothing, roseType = roseType)

gauge(; x::Number = 50) = EChart(series = [Series(_type = "gauge", data = [Dict("value" => x)])])
