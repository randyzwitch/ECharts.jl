"""
    labels!(ec)

Shows or hides data labels on an `EChart`.

## Methods
```julia
labels!(ec::EChart, series::Int; show, position, color, rotate, fontSize, fontWeight, formatter)
labels!(ec::EChart; show, position, color, rotate, fontSize, fontWeight, formatter)
```

## Arguments
* `series::Int` : index of the series to modify (single-series method only)
* `show::Bool = true` : display labels
* `position::String = "insideTop"` : label position (e.g. `"insideTop"`, `"top"`, `"inside"`, `"bottom"`)
* `color::Union{String,Nothing} = nothing` : label text color (e.g. `"#fff"`, `"red"`)
* `rotate::Union{Number,Nothing} = nothing` : label rotation in degrees (-90 to 90)
* `fontSize::Union{Int,Nothing} = nothing` : label font size in pixels
* `fontWeight::Union{String,Nothing} = nothing` : label font weight (e.g. `"bold"`, `"normal"`)
* `formatter::Union{String,Nothing} = nothing` : label format string or JS function string

## Notes

When called without a `series` argument, labels are applied to all series.

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
labels!(b)

# Color and font size
labels!(b, color = "#fff", fontSize = 14)

# Rotate labels
labels!(b, position = "top", rotate = 45)

# Format numbers to 2 decimal places
labels!(b, formatter = "{c:.2f}")
```
"""
function labels!(ec::EChart, series::Int;
                 show::Bool = true,
                 position::String = "insideTop",
                 color::Union{String,Nothing} = nothing,
                 rotate::Union{Number,Nothing} = nothing,
                 fontSize::Union{Int,Nothing} = nothing,
                 fontWeight::Union{String,Nothing} = nothing,
                 formatter::Union{String,Nothing} = nothing)

	ec.series[series].label = Label(show = show,
	                                position = position,
	                                color = color,
	                                rotate = rotate,
	                                fontSize = fontSize,
	                                fontWeight = fontWeight,
	                                formatter = formatter)

    return ec

end

function labels!(ec::EChart;
                 show::Bool = true,
                 position::String = "insideTop",
                 color::Union{String,Nothing} = nothing,
                 rotate::Union{Number,Nothing} = nothing,
                 fontSize::Union{Int,Nothing} = nothing,
                 fontWeight::Union{String,Nothing} = nothing,
                 formatter::Union{String,Nothing} = nothing)

	for n in 1:length(ec.series)
		labels!(ec, n, show = show, position = position, color = color,
		        rotate = rotate, fontSize = fontSize, fontWeight = fontWeight,
		        formatter = formatter)
	end

	return ec

end
