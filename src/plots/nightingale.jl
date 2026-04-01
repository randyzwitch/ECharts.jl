"""
    nightingale(labels, values)

Creates an `EChart` nightingale rose chart (also called a coxcomb or polar area chart),
where each sector's **radius** (or **area**) encodes its value rather than just the angle.
This makes differences in magnitude visually prominent.

## Methods
```julia
nightingale(labels::AbstractVector, values::AbstractVector{<:Real})
```

## Arguments
* `rose_type::String = "radius"` : encoding — `"radius"` (radius ∝ value, all sectors same angle) or `"area"` (area ∝ value)
* `radius::AbstractVector{String} = ["20%", "75%"]` : inner and outer radius of the rose
* `center::AbstractVector{String} = ["50%", "50%"]` : chart center position
* `legend::Bool = true` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

`rose_type = "radius"` (default) gives a classic Nightingale diagram where the radius is proportional
to the value. `rose_type = "area"` makes the sector *area* proportional to the value, which is
more perceptually accurate.

Labels are shown on the sectors by default using `"{b}: {c}"` format (name + value).

# Examples
```@example
using ECharts
labels = ["Respiratory", "Zymotic", "Other"]
values = [42, 32, 26]
nightingale(labels, values)
```
"""
function nightingale(labels::AbstractVector, values::AbstractVector{<:Real};
                     rose_type::String = "radius",
                     radius::AbstractVector{String} = ["20%", "75%"],
                     center::AbstractVector{String} = ["50%", "50%"],
                     legend::Bool = true,
                     kwargs...)

    rose_type in ("radius", "area") ||
        throw(ArgumentError("rose_type must be \"radius\" or \"area\", got \"$rose_type\""))
    length(labels) == length(values) ||
        throw(ArgumentError("labels and values must have the same length"))

    data_fmt = arrayofdicts(value = collect(values), name = string.(labels))

    ec = newplot(kwargs, ec_charttype = "nightingale")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.series = [PieSeries(
        name    = "Nightingale",
        roseType = rose_type,
        radius  = radius,
        center  = center,
        label   = Label(show = true, formatter = "{b}: {c}"),
        data    = data_fmt,
    )]

    legend ? legend!(ec) : nothing
    return ec
end

"""
    nightingale(df, labels, values)

Creates an `EChart` nightingale rose chart from columns `labels` and `values` in table `df`.
See the primary `nightingale` method for full argument documentation.
"""
function nightingale(df, labels::Symbol, values::Symbol;
                     rose_type::String = "radius",
                     radius::AbstractVector{String} = ["20%", "75%"],
                     center::AbstractVector{String} = ["50%", "50%"],
                     legend::Bool = true,
                     kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    nightingale(_table_col(df, labels), _table_col(df, values);
                rose_type = rose_type, radius = radius, center = center,
                legend = legend, kwargs...)
end
