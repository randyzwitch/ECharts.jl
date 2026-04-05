"""
    bullet(labels, actual, target, ranges)

Creates an `EChart` bullet graph — a compact, information-dense alternative to gauge charts.
Each row shows a measured value against performance bands and a reference target.

## Methods
```julia
bullet(labels::AbstractVector,
       actual::AbstractVector{<:Real},
       target::AbstractVector{<:Real},
       ranges::AbstractVector{<:Real})
```

## Arguments
* `range_labels::AbstractVector{String}` : names for each performance band
  (default: `["Poor", "Satisfactory", "Good"]`)
* `range_colors::AbstractVector{String}` : background colors for each band
  (default: muted red → yellow → green shades)
* `bar_color::String = "#334899"` : color of the actual-value bar
* `target_color::String = "#333333"` : color of the target marker
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

`ranges` defines the **cumulative upper boundaries** of each performance band, e.g.
`[60, 80, 100]` creates three bands: 0–60 (Poor), 60–80 (Satisfactory), 80–100 (Good).
All `actual` and `target` values should be ≤ `ranges[end]`.

The same band boundaries apply to every category row. The target marker is shown as
a diamond symbol at the target x-position for each category row.

"""
function bullet(labels::AbstractVector,
                actual::AbstractVector{<:Real},
                target::AbstractVector{<:Real},
                ranges::AbstractVector{<:Real};
                range_labels::AbstractVector{String} = ["Poor", "Satisfactory", "Good"],
                range_colors::AbstractVector{String} = ["#f5a5a5", "#f5d876", "#a5d6a7"],
                bar_color::String = "#334899",
                target_color::String = "#333333",
                legend::Bool = false,
                kwargs...)

	length(labels) == length(actual) == length(target) ||
		throw(ArgumentError("labels, actual, and target must all have the same length"))
	length(ranges) >= 1 ||
		throw(ArgumentError("ranges must have at least one threshold"))
	length(range_labels) == length(ranges) ||
		throw(ArgumentError("range_labels must have the same length as ranges"))
	length(range_colors) >= length(ranges) ||
		throw(ArgumentError("range_colors must have at least as many entries as ranges"))
	issorted(ranges) ||
		throw(ArgumentError("ranges must be in ascending order"))

	# Build MarkArea background bands
	n_ranges = length(ranges)
	mark_data = Vector{Any}(undef, n_ranges)
	prev = 0.0
	for i in 1:n_ranges
		mark_data[i] = [
			Dict("xAxis" => prev,
				 "itemStyle" => Dict("color" => range_colors[i], "opacity" => 0.35)),
			Dict("xAxis" => Float64(ranges[i])),
		]
		prev = Float64(ranges[i])
	end

	# Actual value bar (with background bands as MarkArea)
	actual_series = XYSeries(
		name      = "Actual",
		_type     = "bar",
		barWidth  = 10,
		data      = collect(Float64, actual),
		itemStyle = ItemStyle(color = bar_color),
		markArea  = MarkArea(silent = true, data = mark_data),
		z         = 2,
	)

	# Target marker — scatter with diamond symbol
	target_series = XYSeries(
		name       = "Target",
		_type      = "scatter",
		symbol     = "diamond",
		symbolSize = 12,
		data       = [[Float64(target[i]), string(labels[i])] for i in eachindex(labels)],
		itemStyle  = ItemStyle(color = target_color),
		z          = 3,
	)

	ec = newplot(kwargs, ec_charttype = "bullet")
	ec.xAxis = [Axis(_type = "value", max = ceil(Int, ranges[end]))]
	ec.yAxis = [Axis(_type = "category", data = string.(labels),
					 inverse = true)]
	ec.series = [actual_series, target_series]

	legend ? legend!(ec) : nothing
	return ec

end
