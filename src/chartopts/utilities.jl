function dataformat(; kwargs...)

    #Determine number of values in array, check that all are equal length
    lengths = [length(x[2]) for x in kwargs]
    all(x -> x == lengths[1], lengths)? nothing: error("All arrays need to have same length.")

    #Parse from arrays to dicts
    k = [x[1] for x in kwargs]
    v = [x[2] for x in kwargs]
    datafmt = []

    for j in 1:lengths[1]
        temp = Dict()
        for i in 1:length(k)
            temp[string(k[i])] = v[i][j]
        end
        push!(datafmt, temp)
    end

    return datafmt
end
