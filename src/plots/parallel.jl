"""
    parallel(data, dims)

Creates an `EChart` parallel coordinates chart.

## Methods
```julia
parallel(data::AbstractMatrix, dims::AbstractVector{String})
parallel(df, dims::AbstractVector{Symbol})
```

## Arguments
* `legend::Bool = true` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Rows of `data` represent individual observations; columns represent dimensions (axes).
`dims` provides axis labels for each column.

The Tables.jl method accepts any Tables.jl-compatible source (e.g. a DataFrame) and a
vector of column symbols to use as dimensions.
"""
function parallel(data::AbstractMatrix, dims::AbstractVector{String};
                  legend::Bool = true,
                  kwargs...)

    ec = newplot(kwargs, ec_charttype = "parallel")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.parallel = Parallel()
    ec.parallelAxis = [ParallelAxis(dim = i - 1, name = dims[i],
                                   nameTextStyle = nothing,
                                   axisTick = AxisTick(),
                                   axisLabel = AxisLabel()) for i in eachindex(dims)]
    ec.series = [ParallelSeries(name = string(i), data = [collect(data[i, :])]) for i in axes(data, 1)]

    legend ? legend!(ec) : nothing

    return ec

end

"""
    parallel(df, dims)

Creates an `EChart` parallel coordinates chart from a Tables.jl-compatible source.
See the primary `parallel` method for full argument documentation.
"""
function parallel(df, dims::AbstractVector{Symbol}; kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    data = Float64.(hcat([_table_col(df, d) for d in dims]...))
    dimnames = [string(d) for d in dims]
    return parallel(data, dimnames; kwargs...)
end
