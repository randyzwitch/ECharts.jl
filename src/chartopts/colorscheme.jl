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
