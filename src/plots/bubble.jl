"""
    bubble(x, y)

Creates an `EChart` scatterplot, with additional dimension represented by circle size.

## Methods
```julia
bubble(x::AbstractVector{<:Union{Missing, Real}}, y::AbstractVector{<:Union{Missing, Real}},
    size::AbstractVector{<:Union{Missing, Real}})
bubble(df, x::Symbol, y::Symbol, size::Symbol)
bubble(df, x::Symbol, y::Symbol, size::Symbol, group::Symbol)
```

## Arguments
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `large::Bool = true` : minimize overplotting
* `largeThreshold::Int = 2000` : number of points before overplotting optimization occurs
* `bubblesize::Real = 50` : maximum size of bubbles (see notes)
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

The displayed size of the bubble is normalized within the function, as the square root of the size values. Using the square root of the value maintains the proper visual perception of the difference. The overall circle size can be modified by the `bubblesize` keyword argument, which is roughly the area in pixels of the largest circle.
"""
function bubble(x::AbstractVector{<:Union{Missing, Real}},
				y::AbstractVector{<:Union{Missing, Real}},
				size::AbstractVector{<:Union{Missing, Real}};
		legend::Bool = false,
		scale::Bool = false,
		large::Bool = true,
		largeThreshold::Int = 2000,
		bubblesize::Real = 50,
		kwargs...)

		#Build base via scatter
		ec = scatter(x, y;
					legend = legend,
					scale = scale,
					large = large,
					largeThreshold = largeThreshold,
					kwargs...)

		#Append size into existing data structure
		[push!(x, y) for (x,y) in zip(ec.series[1].data, size)]

		normalized = maximum(sqrt.(size))

		[x.symbolSize =  JSFunction("""function (data) {return $bubblesize * Math.sqrt(data[2]) / ($normalized);}""") for x in ec.series]

		return ec

end

"""
    bubble(df, x, y, size)

Creates an `EChart` bubble chart from DataFrame `df`, using columns `x`, `y`, and `size`.
Axis labels are set automatically from column names.
See the primary `bubble` method for full argument documentation.
"""
function bubble(df, x::Symbol, y::Symbol, size::Symbol;
		legend::Bool = false,
		scale::Bool = false,
		large::Bool = true,
		largeThreshold::Int = 2000,
		bubblesize::Real = 50,
		kwargs...)

		Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

		#Not currently handling NAs
		ec = bubble(_table_col(df, x), _table_col(df, y), _table_col(df, size),
					legend = legend,
					scale = scale,
					large = large,
					largeThreshold = largeThreshold,
					bubblesize = bubblesize,
					kwargs...)

		#Name axes since we know them
		yaxis!(ec, name = string(y))
		xaxis!(ec, name = string(x))

end

"""
    bubble(df, x, y, size, group)

Creates an `EChart` bubble chart from DataFrame `df`, grouping series by the `group` column.
Legend is displayed by default when a group is provided.
See the primary `bubble` method for full argument documentation.
"""
function bubble(df, x::Symbol, y::Symbol, size::Symbol, group::Symbol;
			legend::Bool = true,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)

			Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

			#Create grouped data
			groups = _table_groupby(df, group)
			numgroups = length(groups)
			xcol = _table_col(df, x)
			ycol = _table_col(df, y)
			sizecol = _table_col(df, size)

			#Initialize with single series
			_, idx1 = groups[1]
			ec = bubble(xcol[idx1], ycol[idx1], sizecol[idx1]; legend = legend, scale = scale, kwargs...)

			#Append remaining series, put symbolSize
			for i in 2:numgroups
				_, idxi = groups[i]
				push!(ec.series, XYSeries(_type = "scatter", data = arrayofarray(xcol[idxi], ycol[idxi], sizecol[idxi])))

				ec.series[i].symbolSize = ec.series[1].symbolSize
			end

			#Add series names based on levels of grouped data
			seriesnames!(ec, [string(groups[i][1]) for i in 1:numgroups])

			#Add legend if desired
			legend == true ? legend!(ec) : nothing

			#Enable optimization for lots of data
			[x.large = large for x in ec.series]
			[x.largeThreshold = largeThreshold for x in ec.series]

			return ec

end
