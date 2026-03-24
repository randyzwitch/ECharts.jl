"""
    colorscheme!(ec, palette)

Sets the color palette for an `EChart`.

## Methods
```julia
colorscheme!(ec::EChart, palette::Tuple{AbstractString,Any}; reversePalette)
colorscheme!(ec::EChart, palette::Union{AbstractString, JSFunction})
colorscheme!(ec::EChart, palette::AbstractVector; reversePalette)
```

## Arguments
* `palette::Tuple{AbstractString,Any}` : named palette tuple, e.g. `("Tableau", 10)`
* `palette::Union{AbstractString, JSFunction}` : single color string or gradient
* `palette::AbstractVector` : vector of color strings
* `reversePalette::Bool = false` : reverse the color order (not applicable to single-color method)

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
colorscheme!(b, ("Tableau", 10))

colorscheme!(b, ["#ff0000", "#00ff00", "#0000ff"])
```
"""
#using colorpalettes
function colorscheme!(ec::EChart, palette::Tuple{AbstractString,Any}; reversePalette::Bool = false)

    reversePalette == true ?
		ec.color = reverse(colorpalettes[palette[1]]["$(palette[2])"]) :
			ec.color  = colorpalettes[palette[1]]["$(palette[2])"]

    return ec

end

#This is for string literals and gradients, so reversePalette doesn't make sense as argument
function colorscheme!(ec::EChart, palette::Union{AbstractString, JSFunction})

    ec.color = [palette]

    return ec

end

#For passing vector of colors
function colorscheme!(ec::EChart, palette::AbstractVector; reversePalette::Bool = false)

    reversePalette == true ? ec.color  = reverse(collect(palette)) : ec.color  = collect(palette)

    return ec

end
