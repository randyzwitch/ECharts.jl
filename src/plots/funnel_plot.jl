function funnel(names::AbstractVector, values::AbstractVector)

    ec = deepcopy(EChart())
    ec.series = [Series(_type = "funnel",
                        data =  dataformat(value = values, name = names)
                       )
                ]
    ec
end
