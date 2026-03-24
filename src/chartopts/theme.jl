"""
    theme!(ec, theme)

Sets the theme for an `EChart`.

## Methods
```julia
theme!(ec::EChart, theme::Theme)
```

## Arguments
* `theme::Theme` : a `Theme` object specifying visual styling

## Examples
```julia
b = bar(["A","B","C"], [1,2,3])
theme!(b, Theme(backgroundColor = "#1b1b1b"))
```
"""
function theme!(ec::EChart, theme::Theme)
	ec.theme = theme
	return ec
end
