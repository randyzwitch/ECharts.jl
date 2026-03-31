"""
    gantt(tasks, start_dates, end_dates)

Creates an `EChart` Gantt chart with a time x-axis and tasks on the y-axis.
Each task is drawn as a horizontal bar spanning from its start date to its end date.

## Methods
```julia
gantt(tasks::AbstractVector{String},
      start_dates::AbstractVector{Dates.Date},
      end_dates::AbstractVector{Dates.Date})
```

## Arguments
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Dates are converted to millisecond timestamps (Unix epoch) for ECharts' time axis.
The bar data format is `[start_ms, end_ms]` per task row.
"""
function gantt(tasks::AbstractVector{String},
               start_dates::AbstractVector{Dates.Date},
               end_dates::AbstractVector{Dates.Date};
               legend::Bool = false,
               kwargs...)

    # Convert dates to millisecond timestamps (ECharts time axis uses ms)
    to_ms(d::Dates.Date) = Dates.value(Dates.DateTime(d)) - Dates.value(Dates.DateTime(Dates.Date(1970, 1, 1)))

    data = [[to_ms(start_dates[i]), to_ms(end_dates[i])] for i in eachindex(tasks)]

    ec = newplot(kwargs, ec_charttype = "gantt")
    ec.xAxis = [Axis(_type = "time")]
    ec.yAxis = [Axis(_type = "category", data = collect(tasks))]
    ec.series = [XYSeries(name = "Tasks", _type = "bar", data = data)]

    legend ? legend!(ec) : nothing

    return ec

end
