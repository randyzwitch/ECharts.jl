"""
    calendarheatmap(dates, values, year)

Creates an `EChart` calendar heatmap showing daily values laid out in a calendar grid.

## Methods
```julia
calendarheatmap(dates::AbstractVector{Date}, values::AbstractVector{<:Real}, year::Int)
```

## Arguments
* `show::Bool = true` : show the visual map slider
* `calculable::Bool = true` : allow user to slide endpoints to change data displayed
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Each element of `dates` is paired with the corresponding element of `values`. Only dates
within the specified `year` are rendered.
"""
function calendarheatmap(dates::AbstractVector{Dates.Date},
                          values::AbstractVector{<:Real},
                          year::Int;
                          show::Bool = true,
                          calculable::Bool = true,
                          kwargs...)

    data = [[Dates.format(d, "yyyy-mm-dd"), v] for (d, v) in zip(dates, values)]

    ec = newplot(kwargs, ec_charttype = "calendarheatmap")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.calendar = Calendar(range = string(year), cellSize = ["auto", 13])
    ec.series = [HeatmapSeries(coordinateSystem = "calendar", data = data)]

    minval, maxval = extrema(values)
    ec.visualMap = VisualMap(show = show,
                             min = minval,
                             max = maxval,
                             calculable = calculable,
                             orient = "horizontal",
                             left = "center",
                             top = "top")

    return ec

end
