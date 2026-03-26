"""
    theme!(ec, theme)

Sets the theme for an `EChart`.

## Methods
```julia
theme!(ec::EChart, theme::Theme)
```

## Arguments
* `theme::Theme` : a `Theme` object specifying visual styling

"""
function theme!(ec::EChart, theme::Theme)
	ec.theme = theme
	return ec
end
