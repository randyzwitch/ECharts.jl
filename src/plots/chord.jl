"""
    chord(names, source, target, value)

Creates an `EChart` chord diagram showing bidirectional flows between named nodes.
Each node is drawn as an arc segment; ribbons connecting arcs represent flows,
with ribbon width proportional to the flow value.

## Methods
```julia
chord(names::AbstractVector{String},
      source::AbstractVector{String},
      target::AbstractVector{String},
      value::AbstractVector{<:Union{Missing, Real}})

chord(df, names::Symbol, source::Symbol, target::Symbol, value::Symbol)
```

## Arguments
* `legend::Bool = false` : display legend?
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

`names` is the complete list of node names that appear in the diagram.
`source` and `target` are vectors of node names (must be in `names`) defining
directed flows of magnitude `value`.
"""
function chord(names::AbstractVector{String},
               source::AbstractVector{String},
               target::AbstractVector{String},
               value::AbstractVector{<:Union{Missing, Real}};
               legend::Bool = false,
               kwargs...)

    node_data = [Dict("name" => n) for n in names]
    link_data = arrayofdicts(source = source, target = target, value = value)

    ec = newplot(kwargs, ec_charttype = "chord")
    ec.xAxis = nothing
    ec.yAxis = nothing
    ec.series = [ChordSeries(name = "Series 1",
                             data = node_data,
                             links = link_data)]

    legend ? legend!(ec) : nothing
    return ec
end

"""
    chord(df, names, source, target, value)

Creates an `EChart` chord diagram from columns in table `df`.
See the primary `chord` method for full argument documentation.
"""
function chord(df, names::Symbol, source::Symbol, target::Symbol, value::Symbol;
               legend::Bool = false,
               kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    chord(string.(_table_col(df, names)),
          string.(_table_col(df, source)),
          string.(_table_col(df, target)),
          _table_col(df, value);
          legend = legend, kwargs...)
end
