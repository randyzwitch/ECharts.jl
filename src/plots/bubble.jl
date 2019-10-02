"""
    bubble(x, y)

Creates an `EChart` scatterplot, with additional dimension represented by circle size.

## Methods
```julia
bubble(x::AbstractVector{<:Union{Missing, Real}}, y::AbstractVector{<:Union{Missing, Real}},
    size::AbstractVector{<:Union{Missing, Real}})
bubble(df::AbstractDataFrame, x::Symbol, y::Symbol, size::Symbol)
bubble(df::AbstractDataFrame, x::Symbol, y::Symbol, size::Symbol, group::Symbol)
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

## Examples
```julia
Random.seed!(13579)
xval = rand() .* (0:1000:30000)
yval = 60 .+ (rand(31) * 20)
sizeval = shuffle!(6000 .* (rand(31) * 50))
sp = bubble(xval, yval, sizeval, scale = true)
```
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

#dataframe, single series
function bubble(df::AbstractDataFrame, x::Symbol, y::Symbol, size::Symbol;
		legend::Bool = false,
		scale::Bool = false,
		large::Bool = true,
		largeThreshold::Int = 2000,
		bubblesize::Real = 50,
		kwargs...)

		#Not currently handling NAs
		ec = bubble(df[!, x], df[!, y], df[!, size],
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

#dataframe with group: uses single series df method
function bubble(df::AbstractDataFrame, x::Symbol, y::Symbol, size::Symbol, group::Symbol;
			legend::Bool = true,
			scale::Bool = false,
			large::Bool = true,
			largeThreshold::Int = 2000,
			kwargs...)

			#Create grouped df
			subdf = groupby(df, group)

			#Get number of groups
			numgroups = length(subdf)

			#Initialize with single series
			ec = bubble(subdf[1], x, y, size; legend = legend, scale = scale, kwargs...)

			#Append remaining series, put symbolSize
			for i in 2:numgroups
				push!(ec.series, XYSeries(_type = "scatter", data = arrayofarray(subdf[i][!, x], subdf[i][!, y], subdf[i][!, size])))

				ec.series[i].symbolSize = ec.series[1].symbolSize
			end

			#Add series names based on levels of grouped df
			seriesnames!(ec, [unique(subdf[x][!, group])[1] for x in 1:numgroups])

			#Add legend if desired
			legend == true ? legend!(ec) : nothing

			#Enable optimization for lots of data
			[x.large = large for x in ec.series]
			[x.largeThreshold = largeThreshold for x in ec.series]

			return ec

end
