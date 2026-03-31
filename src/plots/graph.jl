"""
    graph(nodes, links)

Creates an `EChart` force-directed network graph.

## Methods
```julia
graph(nodes::AbstractVector{String}, links::AbstractVector)
```

## Arguments
* `layout::String = "force"` : graph layout algorithm (`"force"`, `"circular"`, or `"none"`)
* `roam::Bool = true` : allow panning and zooming
* `repulsion::Int = 100` : repulsion force between nodes in force layout
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

`links` is a vector of two-element indexable items (e.g. `["A", "B"]` or `("A", "B")`),
where each pair represents a directed edge from source to target.
"""
function graph(nodes::AbstractVector{String},
               links::AbstractVector;
               layout::String = "force",
               roam::Bool = true,
               repulsion::Int = 100,
               kwargs...)

    node_data = [Dict("name" => n) for n in nodes]
    link_data = [Dict("source" => l[1], "target" => l[2]) for l in links]

    ec = newplot(kwargs, ec_charttype = "graph")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.series = [GraphSeries(layout = layout,
                             data = node_data,
                             links = link_data,
                             roam = roam,
                             label = Label(show = true),
                             force = Dict("repulsion" => repulsion))]

    return ec

end
