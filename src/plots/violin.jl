"""
    violin(groups, values)

Creates an `EChart` violin plot showing the distribution of `values` for each group,
rendered as mirrored KDE curves.

## Methods
```julia
violin(groups::AbstractVector, values::AbstractVector{<:Real})
violin(data::AbstractVector{<:Real})
```

## Arguments
* `npoints::Int = 100` : number of KDE evaluation points per group
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

The single-vector method treats all values as one group labelled `"1"`.
KDE is computed via `KernelDensity.kde`. Each violin is rendered as a pair of filled
area series (mirrored about the group's integer x-position).
"""
function violin(groups::AbstractVector, values::AbstractVector{<:Real};
                npoints::Int = 100,
                legend::Bool = false,
                kwargs...)

    group_labels = unique(groups)
    series_list = []

    for (pos, grp) in enumerate(group_labels)
        idx = findall(==(grp), groups)
        grp_vals = values[idx]
        length(grp_vals) < 2 && continue

        k = KernelDensity.kde(grp_vals)
        ypts = range(minimum(grp_vals), maximum(grp_vals), length = npoints)
        dens = KernelDensity.pdf(k, collect(ypts))
        max_dens = maximum(dens)
        max_dens == 0 && continue
        dens_norm = dens ./ max_dens .* 0.4   # scale so violin half-width ≤ 0.4

        # Right half: pos + density
        right_data = [[pos + dens_norm[i], ypts[i]] for i in eachindex(ypts)]
        # Left half (reversed to close polygon): pos - density
        left_data  = [[pos - dens_norm[i], ypts[i]] for i in reverse(eachindex(ypts))]

        push!(series_list,
            XYSeries(name = string(grp),
                     _type = "line",
                     data = vcat(right_data, left_data),
                     areaStyle = AreaStyle()))
    end

    ec = newplot(kwargs, ec_charttype = "violin")
    ec.xAxis = [Axis(_type = "value")]
    ec.yAxis = [Axis(_type = "value")]
    ec.series = series_list

    legend ? legend!(ec) : nothing

    return ec

end

"""
    violin(data)

Creates an `EChart` violin plot for a single vector of values (one group).
See the primary `violin` method for full argument documentation.
"""
violin(data::AbstractVector{<:Real}; kwargs...) =
    violin(fill("1", length(data)), data; kwargs...)
