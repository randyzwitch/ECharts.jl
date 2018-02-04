"""
    area(x, y)

Creates an `EChart` where region below plotted line filled with color.

## Methods
```julia
area(x::AbstractVector, y::AbstractVector{<:Union{Missing, Int, AbstractFloat, Rational}})
area(x::AbstractVector, y::AbstractArray{<:Union{Missing, Int, AbstractFloat, Rational},2})
area(df::AbstractDataFrame, x::Symbol, y::Symbol)
area(df::AbstractDataFrame, x::Symbol, y::Symbol, group::Symbol)
area(k::KernelDensity.UnivariateKDE)
```

## Arguments
* `mark::Union{String, AbstractVector} = "line"` : how to display plotted points
* `fill::Union{Bool, AbstractVector} = true` : fill area below marks with color?
* `stack::Union{Bool, AbstractVector, Void} = nothing` : stack (add together) when multple series present?
* `step::Union{String, Void} = nothing` : one of {"start", "end", "middle", nothing}
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Reasonable defaults set for different methods of `area`, such as displaying a legend when two or more series present.

## Examples
```julia
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y)
```
"""
function histogram(h::StatsBase.Histogram;
                   legend::Bool = false,
                   horizontal::Bool = false,
                   kwargs...)

    if length(h.edges) == 1
        #Create labels for bins
        edges = collect(h.edges[1])
        h.closed == :left ? left = "[" : left = "("
        left == "[" ? right = ")" : right = "]"
        labels = []
        for i in 1:length(edges)-1
            push!(labels, string(left, edges[i], " - ", edges[i + 1], right))
        end

        #Plot as bar, move gap to be near inperceptible
        ec = bar(labels, h.weights; kwargs...)
        ec.series[1].barCategoryGap = "1%"

        #Make plot horizontal
        horizontal? flip!(ec): nothing

        #Add legend if requested
        legend? legend!(ec) : nothing

        return ec

    elseif length(h.edges) == 2
        ec = heatmap(h)
        return ec

    else
        DimensionMismatch("No more than two dimensions can be plotted")
    end

end
