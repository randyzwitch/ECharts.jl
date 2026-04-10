"""
    boxenplot(data)

Creates an `EChart` letter-value (boxen) plot — an extension of the standard box plot
that reveals more of the data's distribution by drawing progressively narrower boxes
for successively more extreme quantile pairs.

## Methods
```julia
boxenplot(data::AbstractVector{<:Real})
boxenplot(data::AbstractVector{<:AbstractVector{<:Real}})
boxenplot(df, data::Symbol)
boxenplot(df, data::Symbol, group::Symbol)
```

## Arguments
* `names::Union{AbstractVector, Nothing} = nothing` : category labels (one per group)
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Each box level *k* spans the quantile pair `(1/2^(k+1), 1 - 1/2^(k+1))`:
- Level 1 (widest): fourths (25 %, 75 %) — the standard IQR box
- Level 2: eighths (12.5 %, 87.5 %)
- Level 3: sixteenths (6.25 %, 93.75 %)
- …up to the depth where fewer than ~14 observations remain in the tails

Box width decreases with depth so inner (more central) boxes are visually widest.
A dark horizontal line marks the median. Points beyond the outermost letter values
are shown as outlier dots.

Rendering uses ECharts' `custom` series type with a `renderItem` JavaScript function.
"""

# ── Statistics helper ─────────────────────────────────────────────────────────

function _lettervalue_stats(data::AbstractVector{<:Real})
    sorted = sort(collect(skipmissing(data)))
    n = length(sorted)
    n >= 4 || throw(ArgumentError("need at least 4 observations for a letter-value plot"))

    # Maximum depth: largest k where expected tail count n/2^(k+1) ≥ 14
    # k ≤ log2(n/14) - 1 = log2(n/28), so max_depth = floor(log2(n/28))
    max_depth = max(1, floor(Int, log2(n / 28)))

    median_val = quantile(sorted, 0.5)

    levels = Tuple{Int,Float64,Float64}[]
    for k in 1:max_depth
        p  = 0.5^(k + 1)
        qs = quantile(sorted, [p, 1.0 - p])
        push!(levels, (k, qs[1], qs[2]))
    end

    outer_low, outer_high = levels[end][2], levels[end][3]
    outliers = filter(v -> v < outer_low || v > outer_high, sorted)

    return median_val, levels, outliers
end

# ── renderItem functions ──────────────────────────────────────────────────────

const _BOXEN_RENDER_BOX = JSON.JSONText("""
function(params, api) {
    var catCoord = api.coord([api.value(0), 0]);
    var y0 = api.coord([0, api.value(1)])[1];
    var y1 = api.coord([0, api.value(2)])[1];
    var halfW = api.value(3) * api.size([1, 0])[0];
    return {
        type: 'rect',
        shape: { x: catCoord[0] - halfW, y: y1, width: 2 * halfW, height: y0 - y1 },
        style: api.style()
    };
}
""")

const _BOXEN_RENDER_MEDIAN = JSON.JSONText("""
function(params, api) {
    var catCoord = api.coord([api.value(0), 0]);
    var yMed = api.coord([0, api.value(1)])[1];
    var halfW = api.value(2) * api.size([1, 0])[0];
    return {
        type: 'rect',
        shape: { x: catCoord[0] - halfW, y: yMed - 1.5, width: 2 * halfW, height: 3 },
        style: { fill: '#1f1f1f' }
    };
}
""")

# Horizontal variants (used by flip!)
const _BOXEN_RENDER_BOX_H = JSON.JSONText("""
function(params, api) {
    var catCoord = api.coord([0, api.value(0)]);
    var x0 = api.coord([api.value(1), 0])[0];
    var x1 = api.coord([api.value(2), 0])[0];
    var halfH = api.value(3) * api.size([0, 1])[1];
    return {
        type: 'rect',
        shape: { x: x0, y: catCoord[1] - halfH, width: x1 - x0, height: 2 * halfH },
        style: api.style()
    };
}
""")

const _BOXEN_RENDER_MEDIAN_H = JSON.JSONText("""
function(params, api) {
    var catCoord = api.coord([0, api.value(0)]);
    var xMed = api.coord([api.value(1), 0])[0];
    var halfH = api.value(2) * api.size([0, 1])[1];
    return {
        type: 'rect',
        shape: { x: xMed - 1.5, y: catCoord[1] - halfH, width: 3, height: 2 * halfH },
        style: { fill: '#1f1f1f' }
    };
}
""")

# ── Core constructor ──────────────────────────────────────────────────────────

function boxenplot(data::AbstractVector{<:AbstractVector{<:Real}};
                   names::Union{AbstractVector, Nothing} = nothing,
                   legend::Bool = false,
                   kwargs...)

    isnothing(names) && (names = string.(1:length(data)))
    length(names) == length(data) ||
        error("Number of names must equal number of data vectors")

    n_cats = length(data)
    stats  = [_lettervalue_stats(d) for d in data]
    max_depth = maximum(length(s[2]) for s in stats)

    # Width decreases with depth: innermost (depth 1) = 0.40, each step narrows by 0.07
    max_hw    = 0.40
    hw_step   = 0.07

    series_list = AbstractEChartSeries[]

    # Draw from outermost (lightest) to innermost so inner boxes render on top
    for depth in max_depth:-1:1
        hw         = max(0.08, max_hw - (depth - 1) * hw_step)
        depth_data = Vector{Float64}[]
        for (ci, stat) in enumerate(stats)
            depth <= length(stat[2]) || continue
            _, q_low, q_high = stat[2][depth]
            push!(depth_data, [Float64(ci), q_low, q_high, hw])
        end
        isempty(depth_data) && continue
        push!(series_list, CustomSeries(
            name       = "Depth $depth",
            renderItem = _BOXEN_RENDER_BOX,
            data       = depth_data,
            encode     = Dict("x" => 0, "y" => [1, 2]),
        ))
    end

    # Median line
    median_data = [[Float64(ci), stat[1], max_hw] for (ci, stat) in enumerate(stats)]
    push!(series_list, CustomSeries(
        name       = "Median",
        renderItem = _BOXEN_RENDER_MEDIAN,
        data       = median_data,
        encode     = Dict("x" => 0, "y" => 1),
    ))

    outlier_pts = [[Float64(ci), o] for (ci, stat) in enumerate(stats) for o in stat[3]]
    if !isempty(outlier_pts)
        push!(series_list, XYSeries(
            name       = "Outliers",
            _type      = "scatter",
            data       = outlier_pts,
            symbolSize = 4,
        ))
    end

    ec = newplot(kwargs, ec_charttype = "boxenplot")
    ec.xAxis = [Axis(_type = "value",
                     min = 0,
                     max = n_cats + 1,
                     axisLabel = AxisLabel(formatter = JSON.JSONText(
                         "(function(v){ var labels=" *
                         JSON.json(string.(names)) *
                         "; return labels[Math.round(v)-1] || ''; })")))]
    ec.yAxis  = [Axis(_type = "value", scale = true)]
    ec.series = series_list

    legend ? legend!(ec) : nothing

    return ec
end

"""
    boxenplot(data)

Creates an `EChart` letter-value plot for a single numeric vector (one group).
See the primary `boxenplot` method for full argument documentation.
"""
function boxenplot(data::AbstractVector{<:Real};
                   names::Union{AbstractVector, Nothing} = nothing,
                   legend::Bool = false,
                   kwargs...)
    nm = isnothing(names) ? [""] : names
    boxenplot([data]; names = nm, legend = legend, kwargs...)
end

"""
    boxenplot(df, data, group)

Creates an `EChart` letter-value plot from table `df`, one box per level of `group`.
See the primary `boxenplot` method for full argument documentation.
"""
function boxenplot(df, data::Symbol, group::Symbol;
                   names::Union{AbstractVector, Nothing} = nothing,
                   legend::Bool = false,
                   kwargs...)
    Tables.istable(df) ||
        throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    groups  = _table_groupby(df, group)
    datacol = _table_col(df, data)
    isnothing(names) && (names = [string(groups[i][1]) for i in eachindex(groups)])
    arrays  = [datacol[groups[i][2]] for i in eachindex(groups)]
    ec = boxenplot(arrays; names = names, legend = legend, kwargs...)
    xaxis!(ec, name = string(group))
    yaxis!(ec, name = string(data))
    return ec
end

"""
    boxenplot(df, data)

Creates an `EChart` letter-value plot for a single column `data` in table `df`.
See the primary `boxenplot` method for full argument documentation.
"""
function boxenplot(df, data::Symbol;
                   names::Union{AbstractVector, Nothing} = nothing,
                   legend::Bool = false,
                   kwargs...)
    Tables.istable(df) ||
        throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    ec = boxenplot([_table_col(df, data)]; names = isnothing(names) ? [""] : names,
                   legend = legend, kwargs...)
    yaxis!(ec, name = string(data))
    return ec
end
