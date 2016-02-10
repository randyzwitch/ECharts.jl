function dataformat(; values::AbstractVector = [], names::AbstractVector = [], selected::AbstractVector = [])

    selected == [] ? selected = [false for x in 1:length(values)] : selected = selected

    data_fmt = []
    for (v, n, s) in zip(values, names, selected)
        push!(data_fmt, Dict("value" => v, "name" => n, "selected" => s))
    end

    return data_fmt

end
