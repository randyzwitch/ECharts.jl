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

Dates are converted to millisecond durations for ECharts' value axis. A transparent
spacer series offsets each bar to its start date, and the visible series spans the
task duration. The x-axis labels are formatted as `YYYY-MM-DD` dates.
"""
function gantt(tasks::AbstractVector{String},
               start_dates::AbstractVector{Dates.Date},
               end_dates::AbstractVector{Dates.Date};
               legend::Bool = false,
               kwargs...)

    to_ms(d::Dates.Date) = Dates.value(Dates.DateTime(d)) - Dates.value(Dates.DateTime(Dates.Date(1970, 1, 1)))

    start_ms  = to_ms.(start_dates)
    end_ms    = to_ms.(end_dates)
    min_start = minimum(start_ms)

    spacer_data   = collect(Int, start_ms .- min_start)
    duration_data = collect(Int, end_ms   .- start_ms)

    formatter_js = "function(val){var d=new Date(val+$(min_start));return d.getFullYear()+'-'+String(d.getMonth()+1).padStart(2,'0')+'-'+String(d.getDate()).padStart(2,'0');}"

    spacer = XYSeries(
        name      = "",
        _type     = "bar",
        stack     = "gantt",
        data      = spacer_data,
        itemStyle = ItemStyle(color = "transparent"),
    )

    bars = XYSeries(
        name      = "Tasks",
        _type     = "bar",
        stack     = "gantt",
        data      = duration_data,
    )

    ec = newplot(kwargs, ec_charttype = "gantt")
    ec.xAxis = [Axis(_type     = "value",
                     min       = 0,
                     axisLabel = AxisLabel(formatter = JSON.JSONText(formatter_js)))]
    ec.yAxis = [Axis(_type = "category", data = collect(tasks))]
    ec.series = [spacer, bars]

    legend ? legend!(ec) : nothing

    return ec

end

"""
    gantt(df, tasks, start_dates, end_dates)

Creates an `EChart` Gantt chart from columns `tasks`, `start_dates`, and `end_dates` in table `df`.
See the primary `gantt` method for full argument documentation.
"""
function gantt(df, tasks::Symbol, start_dates::Symbol, end_dates::Symbol;
               legend::Bool = false,
               kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    gantt(_table_col(df, tasks), _table_col(df, start_dates), _table_col(df, end_dates);
          legend = legend, kwargs...)
end
