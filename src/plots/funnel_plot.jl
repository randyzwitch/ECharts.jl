function funnel(names::AbstractVector, values::AbstractVector; kwargs...)

    ec = deepcopy(EChart())
    ec.series = [Series(_type = "funnel",
                        data =  dataformat(value = values, name = names)
                       )
                ]

    #Process keyword args after defined functionality
	kwargs!(ec, kwargs)

    return ec

end
