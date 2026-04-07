"""
    ecdfplot(e)

Creates an `EChart` empirical cumulative distribution function (ECDF) plot,
rendered as a right-continuous step function.

## Methods
```julia
ecdfplot(e::StatsBase.ECDF)
```

## Arguments
* `legend::Bool = false` : display legend?
* `showSymbol::Bool = false` : show a dot marker at each observation?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Compute the ECDF object outside this function using `StatsBase.ecdf`:

```julia
using StatsBase
e = ecdf(data)
ecdfplot(e)
```

Weighted ECDFs (via `StatsBase.ecdf(data, weights = ...)`) are supported — the
cumulative weights are normalised to [0, 1] automatically.

The y-axis is fixed to [0, 1] since it represents probability. The x-axis
spans the observed data range with no category gap.
"""
function ecdfplot(e::StatsBase.ECDF;
                  legend::Bool = false,
                  showSymbol::Bool = false,
                  kwargs...)

    x = collect(e.sorted_values)
    n = length(x)
    y = if isempty(e.weights)
        collect((1:n) ./ n)
    else
        w = collect(e.weights)
        cumsum(w) ./ sum(w)
    end

    pts = [[xi, yi] for (xi, yi) in zip(x, y)]

    # Determine a sensible number of decimal places from the data range
    xrange = maximum(x) - minimum(x)
    decimals = if xrange >= 100; 0
               elseif xrange >= 10; 1
               else; 2
               end
    fmt = JSON.JSONText("function(v){ return v.toFixed($decimals); }")

    ec = newplot(kwargs, ec_charttype = "ecdfplot")
    ec.xAxis = [Axis(_type = "value", nameGap = 50,
                     axisLabel = AxisLabel(formatter = fmt))]
    ec.yAxis = [Axis(_type = "value", min = 0, max = 1, nameGap = 50)]
    ec.series = [XYSeries(name = "ECDF", _type = "line", data = pts,
                          step = "end", showSymbol = showSymbol)]

    legend ? legend!(ec) : nothing

    return ec

end
