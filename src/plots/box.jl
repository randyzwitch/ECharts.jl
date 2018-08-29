"""
    box(data)

Creates an `EChart` as a boxplot, optionally with outliers.

## Methods
```julia
box(data::AbstractVector{<:Union{Missing, Real}})
box(data::AbstractVector{<:AbstractVector{<:Union{Missing, Real}}})
box(df::AbstractDataFrame, data::Symbol)
box(df::AbstractDataFrame, data::Symbol, group::Symbol)
```

## Arguments
* `names::Union{AbstractVector, Void} = nothing` : provide names for series
* `outliers::Bool` : show outliers?
* `legend::Bool` : display legend?
* `horizontal::Bool = false` : show horizontal? (default: vertical)
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `box`, such as displaying a legend when two or more series present.

## Examples
```julia
data = [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960]
b = box(data)
```
"""
function box(data::AbstractVector{<:AbstractVector{<:Union{Missing, Real}}};
 names::Union{AbstractVector, Nothing} = nothing,
 outliers::Bool = true,
 legend::Bool = false,
 horizontal::Bool = false,
 kwargs...)

    names == nothing ? names = [string(x) for x in 1:length(data)] : names
    length(names) != length(data) ? error("Number of series names must equal number of data series.") : nothing

    dataprep = [boxplotstat(x) for x in data]
    seriesdata = [x.summary for x in dataprep]

    ec = newplot(kwargs, ec_charttype = "box")

    ec.xAxis = [Axis(_type = "category", data = names, boundaryGap = true)]
    ec.yAxis = [Axis(_type = "value", scale = true)]

    ec.series = [BoxPlotSeries(name = "boxplot", _type = "boxplot", data = seriesdata)]

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
        #hack to call this BoxPlotSeries, since the data fields are the same
        push!(ec.series, BoxPlotSeries(name = "outliers", _type = "scatter", data = outliers))
    end

    #Add legend if requested
    legend ? legend!(ec) : nothing

    horizontal ? flip!(ec) : nothing

    return ec

end

#Single series
box(data::AbstractVector{<:Union{Missing, Real}};
  names::String = "",
  outliers::Bool = true,
  legend::Bool = false,
  horizontal::Bool = false,
  kwargs...) =

             box([data], names = [names], outliers = outliers, legend = legend, horizontal = horizontal, kwargs...)

#df with group arguments
function box(df::AbstractDataFrame, data::Symbol, group::Symbol;
         names::Union{AbstractVector, Nothing} = nothing,
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
         names::Union{AbstractVector, Nothing} = nothing,
         outliers::Bool = true,
         legend::Bool = false,
         horizontal::Bool = false,
         kwargs...)

         converteddf = convert(Array, df[data])
         ec = box([converteddf], names = [names], outliers = outliers, legend = legend, horizontal = horizontal, kwargs...)

         yaxis!(ec, name = string(data))

         return ec

end
