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

function kwargs!{T}(ec::EChart, kwargs::Vector{T})

	if length(kwargs) > 0
		for (k, v) in kwargs
		   setfield!(ec, k, v)
	   end
	end

end

function fill!(ec::EChart, cols::Int, fill::Union{Bool, Vector})

    typeof(fill) == Bool? fill = [fill for i in 1:cols]: fill = fill

    for i in 1:cols
        fill[i]? ec.series[i].areaStyle = ItemStyle(normal = AreaStyle()): nothing
    end

end

function boxplotstat{T <: Real}(data::Vector{T})

    #Calculate stats
    ss = summarystats(data)
    iqr15 = 1.5 * (ss.q75 - ss.q25)
    upperbound = ss.q75 + iqr15
    lowerbound = ss.q25 - iqr15

    #Calculate outliers for scatterplot
    outliers = filter(x -> (x >= upperbound) || (x <= lowerbound), data)

    return [[lowerbound, ss.q25, ss.median, ss.q75, upperbound], outliers]

end
