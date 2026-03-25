"""
    colorscheme!(ec, palette)

Sets the color palette for an `EChart`.

## Methods
```julia
colorscheme!(ec::EChart, palette::Tuple{AbstractString,Any}; reversePalette)
colorscheme!(ec::EChart, palette::Union{AbstractString, Dict})
colorscheme!(ec::EChart, palette::AbstractVector; reversePalette)
```

## Arguments
* `palette::Tuple{AbstractString,Any}` : named palette tuple, e.g. `("Set1", 9)`
* `palette::Union{AbstractString, Dict}` : single color string or gradient
* `palette::AbstractVector` : vector of color strings
* `reversePalette::Bool = false` : reverse the color order (not applicable to single-color method)

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
colorscheme!(b, ("Set1", 9))

colorscheme!(b, ["#ff0000", "#00ff00", "#0000ff"])
```
"""
function colorscheme!(ec::EChart, palette::Tuple{AbstractString,Any}; reversePalette::Bool = false)
    #using colorpalettes

    reversePalette == true ?
		ec.color = reverse(colorpalettes[palette[1]]["$(palette[2])"]) :
			ec.color  = colorpalettes[palette[1]]["$(palette[2])"]

    return ec

end

"""
    colorscheme!(ec, palette)

Sets the color of all series in `ec` to a single color string or gradient `Dict`.
`reversePalette` is not applicable for this method.
See the primary `colorscheme!` method for full argument documentation.
"""
function colorscheme!(ec::EChart, palette::Union{AbstractString, Dict})

    ec.color = [palette]

    return ec

end

"""
    colorscheme!(ec, palette)

Sets the color palette of `ec` from an explicit vector of color strings.
See the primary `colorscheme!` method for full argument documentation.
"""
function colorscheme!(ec::EChart, palette::AbstractVector; reversePalette::Bool = false)

    reversePalette == true ? ec.color  = reverse(collect(palette)) : ec.color  = collect(palette)

    return ec

end
