"""
    tree(data)

Creates an `EChart` tree chart displaying hierarchical data as a connected node diagram.

## Methods
```julia
tree(data::AbstractDict)
```

## Arguments
* `data` : hierarchical data as a dict with `name` and `children` keys, where
  `children` is a vector of dicts with the same structure
* `orient` : direction of the tree layout; `"LR"` (left-to-right, default), `"RL"`,
  `"TB"` (top-to-bottom), or `"BT"`
* `layout` : tree layout algorithm; `"tree"` (default) or `"radial"`
* `kwargs` : varargs to set any field of resulting `EChart` struct

"""
function tree(data::AbstractDict; orient::String = "LR", layout::String = "tree", kwargs...)
    ec = newplot(kwargs, ec_charttype = "tree")
    ec.series = [TreeSeries(data = [data], orient = orient, layout = layout)]
    return ec
end
