#Pretty-print
print(x::EChart) = print(json(makevalidjson(x)))

#WebIO Scope/dom
function createscope(ec::EChart)
    deps = [
        "echarts" => joinpath(@__DIR__, "..", "docs", "js", "echarts.min.js")
    ]

    # set up web io scope. We need to tell it about our dependencies and then
    # create a div for our chart.
    scope = Scope(imports=deps)
    scope.dom = dom"div#myplot"(
        style=Dict(:width => "$(ec.ec_width)px", :height => "$(ec.ec_height)px")
    )

    # extract some echarts stuff
    option = makevalidjson(ec)
    renderer = Dict(:renderer => ec.ec_renderer)
    theme = makevalidjson(ec.theme)

    # teach WebIO how to render the chart, once the `echarts` js lib is loaded
    onimport(scope, JSExpr.@js function (echarts)
        @var myChart = echarts.init(this.dom.querySelector("#myplot"), $theme, $renderer)
        myChart.setOption($option);
        window.onresize = () -> myChart.resize()
    end)

    return scope
end

#Makes EChart into a DOM node
function WebIO.render(ec::EChart)

    scope = createscope(ec)
    WebIO.render(scope)

end

#Jupyter notebook method
#doesn't work with JupyterLab unless extension installed (not verified)
Base.show(io::IO, mm::MIME"text/html", ec::EChart) = Base.show(io, mm, WebIO.render(ec))

#REPL method
function Base.display(::REPL.REPLDisplay, ec::EChart)

    scope = createscope(ec)
    w = Blink.Window()
    Blink.body!(w, scope)

end

#Juno method

#VSCode method
