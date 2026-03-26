"""
    xy_plot(x, y)

Internal generic interface for building a single-series `EChart` with Cartesian (x-y) axes.
Higher-level functions such as `bar`, `line`, and `area` dispatch to this method.

## Arguments
* `mark::String = "bar"` : series type (e.g. `"bar"`, `"line"`, `"scatter"`)
* `stack::Union{Bool, AbstractVector, Nothing} = nothing` : stack series?
* `step::Union{String, Nothing} = nothing` : step line style; one of `"start"`, `"end"`, `"middle"`
* `horizontal::Bool = false` : flip axes to produce a horizontal chart
* `legend::Bool = false` : display legend?
* `scale::Bool = false` : truncate y-axis to data range?
* `kwargs` : additional fields passed to the `EChart` struct
"""
function xy_plot(x::AbstractVector, y::AbstractVector;
			mark::String = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing, #No op, here since other functions dispatch here
			step::Union{String, Nothing} = nothing,
			horizontal::Bool = false,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	#Validate arrays are same length
	if size(x) != size(y)
		error("Arrays x and y need to have the same length.")
	end

    ec = newplot(kwargs, ec_charttype = "xy plot")

	#General visualization defaults
	ec.xAxis = [Axis(_type = "category", data = x)]
	ec.yAxis = [Axis(_type = "value", nameGap = 50, scale = scale)] #Add some padding for later if name added
	ec.series = [XYSeries(name = "Series 1", _type = mark, data = y, step = step)]

	#Make plot horizontal
	horizontal ? flip!(ec) : nothing

	#Add legend if requested
	legend ? legend!(ec) : nothing

	return ec

end

"""
    xy_plot(x, y)

Internal generic interface for building a multi-series `EChart` from a 2-D array `y`,
where each column becomes a separate series. Higher-level functions dispatch to this method.
See the primary `xy_plot` method for full argument documentation.
"""
function xy_plot(x::AbstractVector, y::AbstractArray;
			mark::Union{String, AbstractVector} = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing,
			step::Union{String, Nothing} = nothing,
			horizontal::Bool = false,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	# Allow for convenience of using single string to represent same mark for all series values
	typeof(mark) <: AbstractVector ? nothing : mark = [mark for i in 1:length(x)]

	#If there are missing values, set equal to zero so the graph stacks correctly
	if eltype(y) >: Missing
		@warn "y contains Missing values; they will be replaced with 0 for rendering. " *
		      "Pass an array without Missing values to suppress this warning."
		y_ = coalesce.(y, 0)
	else
		y_ = deepcopy(y)
	end

	# Call 1-D method to build base
	ec = xy_plot(x, y_[:,1]; mark = mark[1], scale = scale, kwargs...)

	# Append remaining Y data
	for i in 2:size(y_)[2]
		push!(ec.series, XYSeries(_type = mark[i], data = y_[:,i]))
	end

	#stack: this logic feels janky, but seems to work
	if !isnothing(stack)
		if stack == true
			[x.stack = 1 for x in ec.series]
		elseif typeof(stack) <: AbstractVector
			[x.stack = stack[i] for (i,x) in enumerate(ec.series)]
		else
			nothing
		end

	end

	#step
	!isnothing(step) ? [x.step = step for x in ec.series] : nothing

	#Make plot horizontal
	horizontal ? flip!(ec) : nothing

	# Add default names to series
	seriesnames!(ec)

	#Add legend if requested
	legend ? legend!(ec) : nothing

	return ec

end

"""
    xy_plot(df, x, y)

Internal generic interface for building a single-series `EChart` from a Tables.jl-compatible table `df`.
Axis labels are set automatically from column names.
See the primary `xy_plot` method for full argument documentation.
"""
function xy_plot(df, x::Symbol, y::Symbol;
			mark::String = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing, #No op, here since other functions dispatch here
			step::Union{String, Nothing} = nothing,
			horizontal::Bool = false,
			legend::Bool = false,
			scale::Bool = false,
			kwargs...)

	Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

	#Intialize for single series
	ec = xy_plot(_table_col(df, x), _table_col(df, y), mark = mark, stack = stack, step = step, horizontal = horizontal, legend = legend, scale = scale, kwargs...)

	#Name axes since we know them
	xaxis!(ec, name = string(x))
	yaxis!(ec, name = string(y))

	#Add legend if requested
	legend ? legend!(ec) : nothing

	return ec

end

"""
    xy_plot(df, x, y, group)

Internal generic interface for building a multi-series `EChart` from a Tables.jl-compatible table `df`,
pivoting `y` values by the `group` column. Axis labels and series names are set automatically.
See the primary `xy_plot` method for full argument documentation.
"""
function xy_plot(df, x::Symbol, y::Symbol, group::Symbol;
			mark::String = "bar",
			stack::Union{Bool, AbstractVector, Nothing} = nothing, #No op, here since other functions dispatch here
			step::Union{String, Nothing} = nothing,
			horizontal::Bool = false,
			legend::Bool = true,
			scale::Bool = false,
			kwargs...)

	Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

	#create pivot from table
	xvals, m, groupnames = _table_unstack(df, x, group, y)

	ec = xy_plot(xvals, m, mark = mark, stack = stack, step = step, horizontal = horizontal, legend = legend, scale = scale, kwargs...)

	#Name axes since we know them
	xaxis!(ec, name = string(x))
	yaxis!(ec, name = string(y))

	#Add legend if requested
	legend ? legend!(ec) : nothing

	#Add series names
	seriesnames!(ec, groupnames)

	return ec

end
