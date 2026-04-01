"""
    polar(angle, radius)

Creates an `EChart` where region between points connected by a line, with polar coordinates.

## Methods
```julia
polar(angle::AbstractVector{<:Union{Missing, Real}}, radius::AbstractVector{<:Union{Missing, Real}})
polar(angle::AbstractVector{<:Union{Missing, Real}},radius::AbstractArray{<:Union{Missing, Real},2})
```

## Arguments
* `splitNumber::Int = 12` : number of splits shown in axis
* `showSymbol::Bool = false` : show the dots as well as the line?
* `legend::Bool` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `polar`, such as displaying a legend when two or more series present.
"""
function polar(angle::AbstractVector{<:Union{Missing, Real}},
               radius::AbstractVector{<:Union{Missing, Real}};
            splitNumber::Int = 12,
            showSymbol::Bool = false,
            legend::Bool = false,
            kwargs...)

    ec = newplot(kwargs, ec_charttype = "polar")

    ec.polar = [Polar()]
    ec.angleAxis = AngleAxis(_type = "value", splitNumber = splitNumber)
    ec.radiusAxis = RadiusAxis(min = 0)
    ec.series = [XYSeries(name = "Series 1", coordinateSystem = "polar", _type = "line", showSymbol = showSymbol, data = arrayofarray(radius,angle))]

    #Add legend if requested
    legend ? legend!(ec) : nothing

    return ec

end

"""
    polar(angle, radius)

Creates an `EChart` polar line chart from a 2-D array `radius`, where each column is a
separate series. Legend is displayed by default when multiple series are present.
See the primary `polar` method for full argument documentation.
"""
function polar(angle::AbstractVector{<:Union{Missing, Real}},
               radius::AbstractArray{<:Union{Missing, Real},2};
            splitNumber::Int = 12,
            showSymbol::Bool = false,
            legend::Bool = true,
            kwargs...)

    #Instantiate polar graph with first series
    ec = polar(angle, radius[:,1]; splitNumber = splitNumber, showSymbol = showSymbol, kwargs...)

    #Append remaining series
	for i in 2:size(radius)[2]
		push!(ec.series, XYSeries(coordinateSystem = "polar", _type = "line", showSymbol = showSymbol, data = arrayofarray(radius[:,i],angle)))
	end

    #Add seriesnames for legend
    seriesnames!(ec)

    #Add legend if requested
    legend ? legend!(ec) : nothing

    return ec

end

"""
    polar(df, angle, radius)

Creates an `EChart` polar chart from columns `angle` and `radius` in table `df`.
See the primary `polar` method for full argument documentation.
"""
function polar(df, angle::Symbol, radius::Symbol;
               splitNumber::Int = 12,
               showSymbol::Bool = false,
               legend::Bool = false,
               kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    polar(_table_col(df, angle), _table_col(df, radius);
          splitNumber = splitNumber, showSymbol = showSymbol, legend = legend, kwargs...)
end

"""
    polar(df, angle, radius, group)

Creates an `EChart` polar chart from table `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `polar` method for full argument documentation.
"""
function polar(df, angle::Symbol, radius::Symbol, group::Symbol;
               splitNumber::Int = 12,
               showSymbol::Bool = false,
               legend::Bool = true,
               kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    groups = _table_groupby(df, group)
    numgroups = length(groups)
    anglecol = _table_col(df, angle)
    radiuscol = _table_col(df, radius)

    _, idx1 = groups[1]
    ec = polar(anglecol[idx1], radiuscol[idx1];
               splitNumber = splitNumber, showSymbol = showSymbol, kwargs...)

    for i in 2:numgroups
        _, idxi = groups[i]
        push!(ec.series, XYSeries(coordinateSystem = "polar", _type = "line",
                                  showSymbol = showSymbol,
                                  data = arrayofarray(radiuscol[idxi], anglecol[idxi])))
    end

    seriesnames!(ec, [string(groups[i][1]) for i in 1:numgroups])
    legend ? legend!(ec) : nothing

    return ec
end
