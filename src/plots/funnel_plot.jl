function funnel(names::AbstractVector, values::AbstractVector;
            kwargs...)

    ec = newplot(kwargs, ec_charttype = "funnel")

    ec.series = [Series(name = "Series 1",
                        _type = "funnel",
                        data =  dataformat(value = values, name = names)
                       )
                ]

    return ec

end
