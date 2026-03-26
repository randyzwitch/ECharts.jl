"""
    radar(names, values)

Creates an `EChart` where region inside plotted line optionally filled with color.

## Methods
```julia
radar(names::AbstractVector, values::AbstractVector{<:Union{Missing, Real}},
    max::AbstractVector{<:Union{Missing, Real}})
radar(names::AbstractVector, values::AbstractArray{<:Union{Missing, Real},2},
	max::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}})
```

## Arguments
* `fill::Union{Bool, AbstractVector} = false` : fill area inside marks with color?
* `legend::Bool` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
"""
function radar(names::AbstractVector,
			values::AbstractVector{<:Union{Missing, Real}},
			max::AbstractVector{<:Union{Missing, Real}};
            fill::Bool = false,
			legend::Bool = false,
			kwargs...)

	#Validate arrays are same length
	if size(names)[1] != size(values)[1]
		error("Arrays names and values need to have the same length.")
	end

	ec = newplot(kwargs, ec_charttype = "radar")

	ec.radar = [Radar(indicator = arrayofdicts(name = names, max = max))]

	ec.series = [RadarSeries(name = "Series 1", data = [Dict{Any, Any}("value" => values)])]

	# Fill area if requested
	fill!(ec, 1, fill)

	#Add legend if requested
	legend ? legend!(ec) : nothing

	return ec

end

"""
    radar(names, values, max)

Creates an `EChart` radar chart from a 2-D array `values`, where each column is a separate
series. Legend is displayed by default when multiple series are present.
See the primary `radar` method for full argument documentation.
"""
function radar(names::AbstractVector,
			   values::AbstractArray{<:Union{Missing, Real},2},
			   max::AbstractVector{<:Union{Missing, Real}};
	 			fill::Union{Bool, AbstractVector} = false,
				legend::Bool = true,
				kwargs...)

	# Call 1-D method to build base
	ec = radar(names, values[:,1], max; kwargs...)

	# Append remaining Y data
	for i in 2:size(values)[2]
		push!(ec.series, RadarSeries(data = [Dict{Any, Any}("value" => values[:,i])]))
	end

	# Fill area if requested — fill! handles Bool→Vector expansion internally
	fill!(ec, size(values)[2], fill)

	seriesnames!(ec)

	#Add legend if requested
	legend ? legend!(ec) : nothing

	return ec

end
