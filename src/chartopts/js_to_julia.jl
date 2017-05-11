function LinearGradient(color1::String, color2::String;
                        x0::Number = 0,
                        y0::Number = 0,
                        x2::Number = 0,
                        y2::Number = 1,
                        globalCoord::Bool = false)

    JSFunction("""new echarts.graphic.LinearGradient($x0, $y0, $x2, $y2, [{offset: 0, color: '$color1'}, {offset: 1, color: '$color2'}])""")

end

function RadialGradient(color1::String,
                        color2::String;
                        x::Number = 0.5,
                        y::Number = 0.5,
                        r::Number = 0.5,
                        globalCoord::Bool = false)

    JSFunction("""new echarts.graphic.RadialGradient($x, $y, $r, [{offset: 0, color: '$color1'}, {offset: 1, color: '$color2'}])""")

end
