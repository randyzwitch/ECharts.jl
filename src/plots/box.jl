#Array of Arrays: awkward as data structure, awkward code but works
function box(data::Vector{Vector{T}};
 names::Union{AbstractVector, Void} = nothing,
 outliers::Bool = true,
 legend::Bool = false,
 horizontal::Bool = false,
 kwargs...) where T <: Real

    names == nothing ? names = [string(x) for x in 1:length(data)] : names
    length(names) != length(data) ? error("Number of series names must equal number of data series.") : nothing

    dataprep = [boxplotstat(x) for x in data]
    seriesdata = [x.summary for x in dataprep]

    ec = newplot(kwargs, ec_charttype = "box")

    ec.xAxis = [Axis(_type = "category", data = names, boundaryGap = true)]
    ec.yAxis = [Axis(_type = "value", scale = true)]

    ec.series = [Series(name = "boxplot", _type = "boxplot", data = seriesdata)]

    if outliers
        #Format outliers to ECharts nested array format
        outliers = []
        for (i, s_) in enumerate(dataprep)
            if length(s_.outliers) > 0
                for outlier in s_.outliers
                    push!(outliers, [names[i], outlier])
                end
            end
        end
        push!(ec.series, Series(name = "outliers", _type = "scatter", data = outliers))
    end

    #Add legend if requested
    legend? legend!(ec) : nothing

    horizontal? flip!(ec) : nothing

    return ec

end

#Single series
box(data::AbstractVector{T};
  names::String = "",
  outliers::Bool = true,
  legend::Bool = false,
  horizontal::Bool = false,
  kwargs...) where {T <: Real} =

             box([data], names = [names], outliers = outliers, legend = legend, horizontal = horizontal, kwargs...)

#df with group arguments
function box(df::AbstractDataFrame, data::Symbol, group::Symbol;
         names::Union{AbstractVector, Void} = nothing,
         outliers::Bool = true,
         legend::Bool = false,
         horizontal::Bool = false,
         kwargs...)

    #Create grouped df
    subdf = groupby(df, group)

    #Get number of groups
    numgroups = length(subdf)

    #Get names
    names == nothing ? names = [unique(subdf[x][group])[1] for x in 1:numgroups] : names = names

    #Convert to array of array for existing method
    arrayarray = [convert(Array, subdf[x][data]) for x in 1:numgroups]

    ec = box(arrayarray, names = names, outliers = outliers, legend = legend, horizontal = horizontal, kwargs...)

    xaxis!(ec, name = string(group))
    yaxis!(ec, name = string(data))

    return ec

end

#df
function box(df::AbstractDataFrame, data::Symbol;
         names::Union{AbstractVector, Void} = nothing,
         outliers::Bool = true,
         legend::Bool = false,
         horizontal::Bool = false,
         kwargs...)

         converteddf = convert(Array, df[data])
         ec = box([converteddf], names = [names], outliers = outliers, legend = legend, horizontal = horizontal, kwargs...)

         yaxis!(ec, name = string(data))

         return ec

end
