function funnel(; values::AbstractVector = [], names::AbstractVector = [])

    if length(values) != length(names)
        error("Arrays values and names need to have the same length.")
    end

    ec = deepcopy(EChart())
    ec.series = [ECharts.Series(_type = "funnel",
                                data =  ECharts.dataformat(values = values, names = names)
                                )
                ]
    ec
end
