function streamgraph{T <: Real}(x::AbstractVector{String}, y::AbstractVector{T}, group::AbstractVector;
                     legend::Bool = false,
                     kwargs...)

    ec = ECharts.newplot(kwargs, ec_charttype = "streamgraph")

    data = ECharts.arrayofarray(x,y,group)

    #Character value would represent dates
    ec.singleAxis = ECharts.SingleAxis(_type = "time")

    ec.series = [Series(_type = "themeRiver", data = data)]

    #need to modify legend!
    legend? legend!(ec) : nothing

    return ec

end

function streamgraph{T <: Real}(x::AbstractVector{T}, y::AbstractVector{T}, group::AbstractVector;
                     legend::Bool = false,
                     kwargs...)

    ec = ECharts.newplot(kwargs, ec_charttype = "streamgraph")

    data = ECharts.arrayofarray(x,y,group)

    #Character value would represent dates
    ec.singleAxis = ECharts.SingleAxis()

    ec.series = [Series(_type = "themeRiver", data = data)]

    #need to modify legend!
    legend? legend!(ec) : nothing

    return ec

end

streamgraph(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol;
            legend::Bool = false,
            kwargs...) = streamgraph(df[x], df[y], df[group]; legend = legend, kwargs...)
