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
"""
function box(data::AbstractVector{<:AbstractVector{<:Union{Missing, Real}}};
 names::Union{AbstractVector, Nothing} = nothing,
 outliers::Bool = true,
 legend::Bool = false,
 horizontal::Bool = false,
 kwargs...)

    isnothing(names) ? names = [string(x) for x in 1:length(data)] : names
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

"""
    box(data)

Creates an `EChart` boxplot from a single numeric vector.
See the primary `box` method for full argument documentation.
"""
box(data::AbstractVector{<:Union{Missing, Real}};
  names::String = "",
  outliers::Bool = true,
  legend::Bool = false,
  horizontal::Bool = false,
  kwargs...) =

             box([data], names = [names], outliers = outliers, legend = legend, horizontal = horizontal, kwargs...)

"""
    box(df, data, group)

Creates an `EChart` boxplot from DataFrame `df`, with one box per level of the `group` column.
See the primary `box` method for full argument documentation.
"""
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
    isnothing(names) ? names = [unique(subdf[x][!, group])[1] for x in 1:numgroups] : nothing

    #Convert to array of array for existing method
    arrayarray = [Vector(subdf[x][!, data]) for x in 1:numgroups]

    ec = box(arrayarray, names = names, outliers = outliers, legend = legend, horizontal = horizontal, kwargs...)

    xaxis!(ec, name = string(group))
    yaxis!(ec, name = string(data))

    return ec

end

"""
    box(df, data)

Creates an `EChart` boxplot from a single column `data` in DataFrame `df`.
See the primary `box` method for full argument documentation.
"""
function box(df::AbstractDataFrame, data::Symbol;
         names::Union{AbstractVector, Nothing} = nothing,
         outliers::Bool = true,
         legend::Bool = false,
         horizontal::Bool = false,
         kwargs...)

         converteddf = Vector(df[!, data])
         ec = box([converteddf], names = [names], outliers = outliers, legend = legend, horizontal = horizontal, kwargs...)

         yaxis!(ec, name = string(data))

         return ec

end
