
function circular_plot(; values::AbstractVector = [],
                        names::AbstractVector = [],
                        selected::AbstractVector = [],
                        radius::Union{AbstractVector, AbstractString, Void} = "90%",
                        center::Union{AbstractVector, AbstractString, Void} = ["50%", "50%"],
                        roseType::Union{AbstractString, Void} = nothing # roseType = {"angle", "radius"}
                        )

    if length(values) != length(names)
    	error("Arrays values and names need to have the same length.")
    end

    data_fmt = dataformat(values = values, names = names, selected = selected)
    ec = deepcopy(EChart())
    ec.series = [Series(_type = "pie", radius = radius, center = center, data = data_fmt, roseType = roseType)]

    return ec

end

piechart(;values::AbstractVector = [], names::AbstractVector = [], selected::AbstractVector = [], radius::Union{AbstractVector, AbstractString} = "90%", center::Union{AbstractVector, AbstractString}  = ["50%", "50%"], roseType::Union{AbstractString, Void} = nothing) =
    circular_plot(values = values, names = names, selected = selected, radius = radius, center = center, roseType = roseType)

donutchart(;values::AbstractVector = [], names::AbstractVector = [], selected::AbstractVector = [], radius::Union{AbstractVector, AbstractString} = ["50%", "90%"], roseType::Union{AbstractString, Void} = nothing) =
    circular_plot(values = values, names = names, selected = selected, radius = radius, center = nothing, roseType = roseType)
