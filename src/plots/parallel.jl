"""
    parallel(data, dims)

Creates an `EChart` parallel coordinates chart.

## Methods
```julia
parallel(data::AbstractMatrix, dims::AbstractVector{String})
```

## Arguments
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Rows of `data` represent individual observations; columns represent dimensions (axes).
`dims` provides axis labels for each column.
"""
function parallel(data::AbstractMatrix, dims::AbstractVector{String};
                  legend::Bool = false,
                  kwargs...)

    ec = newplot(kwargs, ec_charttype = "parallel")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.parallel = Parallel()
    ec.parallelAxis = [ParallelAxis(dim = i - 1, name = dims[i]) for i in eachindex(dims)]
    ec.series = [ParallelSeries(data = [collect(data[i, :]) for i in axes(data, 1)])]

    legend ? legend!(ec) : nothing

    return ec

end
