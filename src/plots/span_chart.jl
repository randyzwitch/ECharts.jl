"""
    spanchart(categories, lows, highs)

Creates an `EChart` span (range) chart — a floating bar chart that shows a range from
`lows[i]` to `highs[i]` for each category. Useful for visualising data ranges, error bounds,
confidence intervals, or any quantity defined by a minimum and maximum.

## Methods
```julia
spanchart(categories::AbstractVector, lows::AbstractVector{<:Real}, highs::AbstractVector{<:Real})
spanchart(df, category_col::Symbol, low_col::Symbol, high_col::Symbol)
```

## Arguments
* `color::String = "#5470c6"` : fill color of the span bars
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

Each bar "floats" above the axis: an invisible spacer bar extends from 0 to `lows[i]`,
and the visible span bar extends from `lows[i]` to `highs[i]` (height = `highs[i] - lows[i]`).
All values of `lows` must be ≤ the corresponding `highs`.

# Examples
```@example
using ECharts
months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
temp_low  = [-3.0, -2.0, 3.0, 8.0, 13.0, 18.0]
temp_high = [5.0,  7.0, 12.0, 18.0, 23.0, 28.0]
spanchart(months, temp_low, temp_high)
```
"""
function spanchart(categories::AbstractVector,
                    lows::AbstractVector{<:Real},
                    highs::AbstractVector{<:Real};
                    color::String = "#5470c6",
                    legend::Bool = false,
                    kwargs...)

	length(categories) == length(lows) == length(highs) ||
		throw(ArgumentError("categories, lows, and highs must all have the same length"))
	all(lows .<= highs) ||
		throw(ArgumentError("all lows must be ≤ the corresponding highs"))

	spacer = XYSeries(
		name      = "",
		_type     = "bar",
		stack     = "span",
		data      = collect(Float64, lows),
		itemStyle = ItemStyle(color = "transparent"),
	)

	spans = XYSeries(
		name      = "Range",
		_type     = "bar",
		stack     = "span",
		data      = collect(Float64, highs) .- collect(Float64, lows),
		itemStyle = ItemStyle(color = color),
	)

	ec = newplot(kwargs, ec_charttype = "spanchart")
	ec.xAxis = [Axis(_type = "category", data = string.(categories))]
	ec.yAxis = [Axis(_type = "value")]
	ec.series = [spacer, spans]

	legend ? legend!(ec) : nothing
	return ec

end

"""
    spanchart(df, category_col, low_col, high_col)

Creates an `EChart` span chart from a Tables.jl-compatible table.
See the primary `spanchart` method for full argument documentation.

# Examples
```@example
using ECharts, DataFrames
df = DataFrame(
    quarter      = ["Q1", "Q2", "Q3", "Q4"],
    revenue_low  = [80.0, 95.0, 110.0, 130.0],
    revenue_high = [120.0, 145.0, 165.0, 180.0],
)
spanchart(df, :quarter, :revenue_low, :revenue_high)
```
"""
function spanchart(df, category_col::Symbol, low_col::Symbol, high_col::Symbol;
                    color::String = "#5470c6",
                    legend::Bool = false,
                    kwargs...)
	Tables.istable(df) ||
		throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
	cats  = _table_col(df, category_col)
	lows  = Float64.(_table_col(df, low_col))
	highs = Float64.(_table_col(df, high_col))
	return spanchart(cats, lows, highs; color = color, legend = legend, kwargs...)
end
