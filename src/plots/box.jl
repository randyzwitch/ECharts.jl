"""
    area(x, y)

Creates an `EChart` where region below plotted line filled with color.

## Methods
```julia
area(x::AbstractVector, y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}})
area(x::AbstractVector, y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2})
area(df::AbstractDataFrame, x::Symbol, y::Symbol)
area(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
area(k::KernelDensity.UnivariateKDE)
```

## Arguments
* `mark::Union{String, AbstractVector} = "line"` : how to display plotted points
* `fill::Union{Bool, AbstractVector} = true` : fill area below marks with color?
* `stack::Union{Bool, AbstractVector, Void} = nothing` : stack (add together) when multple series present?
* `step::Union{String, Void} = nothing` : one of {"start", "end", "middle", nothing}
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.

## Examples
```julia
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y)
```
"""
function box(data::AbstractVector{<:AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}}};
 names::Union{AbstractVector, Void} = nothing,
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
box(data::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}};
  names::String = "",
  outliers::Bool = true,
  legend::Bool = false,
  horizontal::Bool = false,
  kwargs...) =

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
