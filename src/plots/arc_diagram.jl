"""
    arcdiagram(nodes, links)

Creates an `EChart` arc diagram — a network graph with nodes arranged in a circle
and edges drawn as curved arcs. Arc diagrams are effective for showing connections
between entities without the instability of force-directed layouts.

## Methods
```julia
arcdiagram(nodes::AbstractVector{String}, links::AbstractVector)
arcdiagram(nodes::AbstractVector{String}, links::AbstractVector,
            weights::AbstractVector{<:Real})
```

## Arguments
* `curveness::Real = 0.4` : edge curvature (0 = straight, 1 = very curved)
* `symbol_size::Int = 20` : node circle diameter in pixels
* `roam::Bool = false` : allow panning and zooming?
* `max_width::Int = 8` : maximum edge line width when weights are provided
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of the resulting `EChart` struct

## Notes

`links` is a vector of two-element indexable objects (e.g. `["A", "B"]` or `("A", "B")`),
each representing a directed edge from source to target. Node names in `links` must
appear in `nodes`.

When `weights` are provided, edge line widths are scaled linearly from 1 to `max_width`
based on the weight values.

# Examples
```@example
using ECharts
nodes = ["Alice", "Bob", "Carol", "Dave", "Eve"]
links = [["Alice","Bob"], ["Alice","Carol"], ["Bob","Dave"],
         ["Carol","Dave"], ["Carol","Eve"], ["Dave","Eve"]]
arcdiagram(nodes, links)
```
"""
function arcdiagram(nodes::AbstractVector{String},
                     links::AbstractVector;
                     curveness::Real = 0.4,
                     symbol_size::Int = 20,
                     roam::Bool = false,
                     legend::Bool = false,
                     kwargs...)

	node_data = [Dict("name" => n) for n in nodes]
	link_data = [Dict("source" => string(l[1]), "target" => string(l[2])) for l in links]

	ec = newplot(kwargs, ec_charttype = "arcdiagram")
	ec.xAxis = nothing
	ec.yAxis = nothing
	ec.series = [GraphSeries(
		layout     = "circular",
		circular   = Dict("rotateLabel" => true),
		roam       = roam,
		symbolSize = symbol_size,
		label      = Label(show = true, position = "right", formatter = "{b}"),
		lineStyle  = LineStyle(curveness = Float64(curveness), color = "source"),
		data       = node_data,
		links      = link_data,
	)]

	legend ? legend!(ec) : nothing
	return ec
end

"""
    arcdiagram(nodes, links, weights)

Creates an `EChart` arc diagram with edge widths scaled by `weights`.
See the primary `arcdiagram` method for full argument documentation.

# Examples
```@example
using ECharts
nodes = ["A", "B", "C", "D"]
links = [["A","B"], ["B","C"], ["C","D"], ["A","D"]]
weights = [5.0, 3.0, 8.0, 2.0]
arcdiagram(nodes, links, weights)
```
"""
function arcdiagram(nodes::AbstractVector{String},
                     links::AbstractVector,
                     weights::AbstractVector{<:Real};
                     curveness::Real = 0.4,
                     symbol_size::Int = 20,
                     roam::Bool = false,
                     max_width::Int = 8,
                     legend::Bool = false,
                     kwargs...)

	length(links) == length(weights) ||
		throw(ArgumentError("links and weights must have the same length"))

	node_data = [Dict("name" => n) for n in nodes]

	wmin, wmax = extrema(weights)
	scale = wmax > wmin ? (max_width - 1) / (wmax - wmin) : 0.0

	link_data = [
		Dict(
			"source"    => string(links[i][1]),
			"target"    => string(links[i][2]),
			"lineStyle" => Dict("width" => 1 + scale * (weights[i] - wmin)),
		)
		for i in eachindex(links)
	]

	ec = newplot(kwargs, ec_charttype = "arcdiagram")
	ec.xAxis = nothing
	ec.yAxis = nothing
	ec.series = [GraphSeries(
		layout     = "circular",
		circular   = Dict("rotateLabel" => true),
		roam       = roam,
		symbolSize = symbol_size,
		label      = Label(show = true, position = "right", formatter = "{b}"),
		lineStyle  = LineStyle(curveness = Float64(curveness), color = "source"),
		data       = node_data,
		links      = link_data,
	)]

	legend ? legend!(ec) : nothing
	return ec
end
