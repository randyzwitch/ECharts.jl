"""
    beeswarm(categories, values)

Creates an `EChart` beeswarm plot — a scatter chart on a categorical axis with random
jitter applied along the categorical dimension to reduce overplotting.

## Methods
```julia
beeswarm(categories::AbstractVector, values::AbstractVector{<:Real})
```

## Arguments
* `jitter_width::Real = 0.3` : half-width of the uniform jitter range (in category units)
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

`categories` and `values` must be the same length (long-format data). Each unique category
is mapped to an integer position on the x-axis, and points within a category receive a
small random horizontal offset drawn from `Uniform(-jitter_width, jitter_width)`.
Each category is rendered as a separate series so that it automatically receives a
distinct color from the active theme palette.
"""
function beeswarm(categories::AbstractVector, values::AbstractVector{<:Real};
                  jitter_width::Real = 0.3,
                  legend::Bool = false,
                  kwargs...)

    cat_labels = unique(categories)
    cat_index  = Dict(c => i for (i, c) in enumerate(cat_labels))

    ec = newplot(kwargs, ec_charttype = "beeswarm")
    ec.xAxis = [Axis(_type = "value",
                     min = 0,
                     max = length(cat_labels) + 1,
                     axisLabel = AxisLabel(formatter = JSON.JSONText(
                         "(function(v){ var labels=" *
                         JSON.json(cat_labels) *
                         "; return labels[Math.round(v)-1] || ''; })")))]
    ec.yAxis = [Axis(_type = "value")]
    ec.series = [
        XYSeries(
            name  = string(cat),
            _type = "scatter",
            data  = [[cat_index[categories[i]] + (rand() * 2 - 1) * jitter_width, values[i]]
                     for i in eachindex(values) if categories[i] == cat]
        )
        for cat in cat_labels
    ]

    legend ? legend!(ec) : nothing

    return ec

end
