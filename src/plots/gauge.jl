function gauge(x::Number;
               legend::Bool = false,
               kwargs...)

    ec = newplot(kwargs, ec_charttype = "gauge")

    ec.series = [Series(name = "Series 1", _type = "gauge", data = [Dict("value" => x)])]

    #Add legend if requested
    legend? legend!(ec) : nothing

    return ec

end
