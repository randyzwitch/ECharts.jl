function tooltip!(ec::EChart; show::Bool = true, kwargs...)

    #If tooltip doesn't exist, add it, else use what is there
    ec.tooltip == nothing ? ec.tooltip = Tooltip() : nothing

    ec.tooltip.show = show

    for (k, v) in kwargs
       setfield!(ec.tooltip, k, v)
    end

    return ec

end
