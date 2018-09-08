#New for 0.7, splat changed syntax.
#TODO: Merge with newplot method below
newplot(itr::Base.Iterators.Pairs, args...; kwargs...) = newplot(collect(itr), args...; kwargs...)

#Common code across all plots
function newplot(kwargs::Vector{T}; ec_charttype::Union{String, Nothing} = nothing) where T

    #Create new chart
    ec = deepcopy(EChart(ec_charttype = ec_charttype))

    #Process keyword args after defined functionality
	kwargs!(ec, kwargs)

    return ec

end

#Separate arrays as inputs to array of dicts
function arrayofdicts(; kwargs...)

    #Determine number of values in array, check that all are equal length
    lengths = [length(x[2]) for x in kwargs]
    all(x -> x == lengths[1], lengths) ? nothing : error("All arrays need to have same length.")

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

#Combine arrays into array of arrays by each value
arrayofarray(x::AbstractVector,y::AbstractVector) = [[x,y] for (x,y) in zip(x,y)]
arrayofarray(x::AbstractVector,y::AbstractVector,z::AbstractVector) = [[x,y,z] for (x,y,z) in zip(x,y,z)]

#Common kwargs code for all plots
#For convenience, let color be specified as a string, even though it's always an array in echarts.js
function kwargs!(ec::EChart, kwargs::Vector{T}) where T

	for (k, v) in kwargs
        k == :color && typeof(v) in [String, JSFunction] ? setfield!(ec, k, [v]) : setfield!(ec, k, v)
    end

end

# Fill area inside areaStyle
function fill!(ec::EChart, cols::Int, fill::Union{Bool, Vector})

    typeof(fill) == Bool ? fill = [fill for i in 1:cols] : fill = fill

    for i in 1:cols
        fill[i] ? ec.series[i].areaStyle = ItemStyle() : nothing
    end

end

function boxplotstat(data::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}})

    data_ = collect(skipmissing(data))
    #Calculate stats
    ss = summarystats(data_)
    iqr15 = 1.5 * (ss.q75 - ss.q25)
    upperbound = ss.q75 + iqr15
    lowerbound = ss.q25 - iqr15

    #Calculate outliers for scatterplot
    outliers = filter(x -> (x >= upperbound) || (x <= lowerbound), data_)

    return BoxPlotStats([lowerbound, ss.q25, ss.median, ss.q75, upperbound], outliers)

end
