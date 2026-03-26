"""
    title!(ec)

Modifies the primary title (first `Title` object) of an `EChart`. This is an alias for
`text!(ec, 1; kwargs...)`.

## Methods
```julia
title!(ec::EChart; kwargs...)
```

## Arguments
* `kwargs` : any field of the `Title` struct (e.g. `text`, `subtext`, `left`, `top`)

"""
title!(ec::EChart; kwargs...) = text!(ec, 1; kwargs...) # By convention from definetypes.jl, make title! update the first Title object in array

"""
    text!(ec)

Adds or modifies `Title` objects on an `EChart`. When called without a series index, a new
`Title` is appended. When called with an index, the existing `Title` at that position is modified.

## Methods
```julia
text!(ec::EChart; kwargs...)
text!(ec::EChart, series::Int; kwargs...)
```

## Arguments
* `series::Int` : index of the existing `Title` object to modify (1-based)
* `kwargs` : any field of the `Title` struct (e.g. `text`, `subtext`, `left`, `top`)

"""
function text!(ec::EChart; kwargs...)
	#Push on to end of ec.title array

	temp = Title()

	for (k, v) in kwargs
	   setfield!(temp, k, v)
	end

	push!(ec.title, temp)

	return ec

end

"""
    text!(ec, series)

Modifies the `Title` object at index `series` in `ec` in place.
See the primary `text!` method for full argument documentation.
"""
function text!(ec::EChart, series::Int; kwargs...)

	for (k, v) in kwargs
	   setfield!(ec.title[series], k, v)
	end

	return ec

end
