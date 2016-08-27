function funnel(names::AbstractVector, values::AbstractVector; kwargs...)

    ec = deepcopy(EChart())
    ec.series = [Series(_type = "funnel",
                        data =  dataformat(value = values, name = names)
                       )
                ]

    #Process keyword args after defined functionality
    if length(kwargs) > 0
        for (k, v) in kwargs
           setfield!(ec, k, v)
       end
    end

    return ec
    
end
