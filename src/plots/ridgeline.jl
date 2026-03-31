"""
    ridgeline(groups, data)

Creates an `EChart` ridgeline (joy) plot — overlapping KDE curves for multiple groups,
each offset vertically so the distributions can be compared.

## Methods
```julia
ridgeline(groups::AbstractVector{String}, data::AbstractVector{<:AbstractVector})
```

## Arguments
* `npoints::Int = 200` : number of KDE evaluation points per group
* `overlap::Real = 0.6` : fraction of the per-group y-range used as the vertical offset
                           between successive groups (0 = no overlap, 1 = full overlap)
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

`groups` and `data` must be the same length. `data[i]` is the vector of observations for
`groups[i]`. Each group's KDE is rendered as a filled line series at a fixed y-offset;
group labels are placed on the y-axis at those offsets.
"""
function ridgeline(groups::AbstractVector{String},
                   data::AbstractVector{<:AbstractVector};
                   npoints::Int = 200,
                   overlap::Real = 0.6,
                   legend::Bool = false,
                   kwargs...)

    series_list = []
    offset      = 0.0
    step        = 1.0

    for i in eachindex(groups)
        grp_vals = data[i]
        length(grp_vals) < 2 && continue

        k = KernelDensity.kde(grp_vals)
        xpts = range(minimum(grp_vals), maximum(grp_vals), length = npoints)
        dens = KernelDensity.pdf(k, collect(xpts))
        max_dens = maximum(dens)
        max_dens == 0 && continue
        dens_norm = dens ./ max_dens   # normalise to [0, 1]

        pts = [[xpts[j], offset + dens_norm[j]] for j in eachindex(xpts)]

        push!(series_list,
            XYSeries(name = groups[i],
                     _type = "line",
                     data = pts,
                     areaStyle = AreaStyle()))

        offset += step * (1.0 - overlap)
    end

    ec = newplot(kwargs, ec_charttype = "ridgeline")
    ec.xAxis = [Axis(_type = "value")]
    ec.yAxis = [Axis(_type = "value")]
    ec.series = series_list

    legend ? legend!(ec) : nothing

    return ec

end
