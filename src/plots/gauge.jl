function gauge(x::Number;
               kwargs...)

    ec = newplot(kwargs, ec_charttype = "gauge")

    ec.series = [Series(name = "Series 1", _type = "gauge", data = [Dict("value" => x)])]

    return ec

end
