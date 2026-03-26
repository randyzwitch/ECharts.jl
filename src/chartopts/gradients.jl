"""
    lineargradient(color1, color2)

Creates a linear gradient `JSON.JSONText` for use with `colorscheme!` or other color arguments.
The gradient transitions from `color1` at offset 0 to `color2` at offset 1.

## Methods
```julia
lineargradient(color1::String, color2::String; x0, y0, x2, y2)
```

## Arguments
* `color1::String` : starting color (CSS color string)
* `color2::String` : ending color (CSS color string)
* `x0::Number = 0` : x coordinate of gradient start (0–1)
* `y0::Number = 0` : y coordinate of gradient start (0–1)
* `x2::Number = 0` : x coordinate of gradient end (0–1)
* `y2::Number = 1` : y coordinate of gradient end (0–1)

"""
function lineargradient(color1::String, color2::String;
                        x0::Number = 0,
                        y0::Number = 0,
                        x2::Number = 0,
                        y2::Number = 1)

    Dict("type" => "linear", "x" => x0, "y" => y0, "x2" => x2, "y2" => y2,
         "colorStops" => [Dict("offset" => 0, "color" => color1),
                          Dict("offset" => 1, "color" => color2)])

end

"""
    radialgradient(color1, color2)

Creates a radial gradient `JSON.JSONText` for use with `colorscheme!` or other color arguments.
The gradient transitions from `color1` at offset 0 to `color2` at offset 1.

## Methods
```julia
radialgradient(color1::String, color2::String; x, y, r)
```

## Arguments
* `color1::String` : starting color at center (CSS color string)
* `color2::String` : ending color at edge (CSS color string)
* `x::Number = 0.5` : x coordinate of gradient center (0–1)
* `y::Number = 0.5` : y coordinate of gradient center (0–1)
* `r::Number = 0.5` : radius of gradient (0–1)

"""
function radialgradient(color1::String,
                        color2::String;
                        x::Number = 0.5,
                        y::Number = 0.5,
                        r::Number = 0.5)

    Dict("type" => "radial", "x" => x, "y" => y, "r" => r,
         "colorStops" => [Dict("offset" => 0, "color" => color1),
                          Dict("offset" => 1, "color" => color2)])

end
