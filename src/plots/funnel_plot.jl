function funnel(names::AbstractVector, values::AbstractVector;
            kwargs...)

    ec = newplot(kwargs)

    ec.series = [Series(_type = "funnel",
                        data =  dataformat(value = values, name = names)
                       )
                ]

    return ec

end
