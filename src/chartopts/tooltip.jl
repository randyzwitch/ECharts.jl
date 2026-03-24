"""
    tooltip!(ec)

Adds or modifies the tooltip for an `EChart`.

## Methods
```julia
tooltip!(ec::EChart; show, kwargs...)
```

## Arguments
* `show::Bool = true` : display the tooltip
* `kwargs` : any additional field of the `Tooltip` struct (e.g. `trigger`, `formatter`)

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
tooltip!(b, trigger = "axis")
```
"""
function tooltip!(ec::EChart; show::Bool = true, kwargs...)

    #If tooltip doesn't exist, add it, else use what is there
    ec.tooltip == nothing ? ec.tooltip = Tooltip() : nothing

    ec.tooltip.show = show

    for (k, v) in kwargs
       setfield!(ec.tooltip, k, v)
    end

    return ec

end
