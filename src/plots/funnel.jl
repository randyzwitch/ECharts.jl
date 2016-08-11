function funnel(; values::AbstractVector = [], names::AbstractVector = [])

    if length(values) != length(names)
        error("Arrays values and names need to have the same length.")
    end

    ec = deepcopy(EChart())
    ec.series = [Series(_type = "funnel",
                                data =  dataformat(value = values, name = names)
                                )
                ]
    ec
end
