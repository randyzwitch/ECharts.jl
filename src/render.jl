"""
    EChartRaw

An ECharts chart created from a raw JSON string specification. Produced by [`echart`](@ref)
or the [`@echart`](@ref) macro. Renders directly in Jupyter notebooks and the VSCode Julia
plot panel.

# Fields
- `option`: raw JSON string passed to ECharts `setOption`
- `ec_width`: chart width in pixels
- `ec_height`: chart height in pixels
- `ec_renderer`: ECharts renderer (`"canvas"` or `"svg"`)
- `theme`: ECharts [`Theme`](@ref)
"""
mutable struct EChartRaw
    option::String
    ec_width::Int
    ec_height::Int
    ec_renderer::String
    theme::Theme
end

"""
    echart(option::AbstractString; width::Int=800, height::Int=450, renderer::String="canvas", theme::Theme=roma)

Create an `EChartRaw` from a raw JSON string specification, allowing ECharts examples copied
from the Apache ECharts gallery to be rendered directly in Julia.

# Example
```julia
ec = echart(\"\"\"
{
  "xAxis": {"type": "category", "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]},
  "yAxis": {"type": "value"},
  "series": [{"data": [820, 932, 901, 934, 1290, 1330, 1320], "type": "bar"}]
}
\"\"\")
```
"""
function echart(option::AbstractString; width::Int=800, height::Int=450,
                renderer::String="canvas", theme::Theme=roma)
    JSON.parse(option)  # validate; throws ParseError on invalid JSON
    return EChartRaw(String(option), width, height, renderer, theme)
end

"""
    @echart json_string
    @echart(json_string, width=800, height=450, renderer="canvas", theme=roma)

Macro form of [`echart`](@ref). Accepts a raw JSON string literal without a function-call wrapper.

# Example
```julia
@echart \"\"\"
{
  "xAxis": {"type": "category", "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]},
  "yAxis": {"type": "value"},
  "series": [{"data": [820, 932, 901, 934, 1290, 1330, 1320], "type": "bar"}]
}
\"\"\"
```
"""
macro echart(option, kwargs...)
    :(echart($(esc(option)); $(map(esc, kwargs)...)))
end

#Pretty-print
print(x::EChart) = print(json(makevalidjson(x)))
print(x::EChartRaw) = print(x.option)

#Shared helper: produces self-contained HTML with echarts.min.js inlined
function _echarts_html(ec::EChart)
    option = json(makevalidjson(ec))
    theme = json(makevalidjson(ec.theme))
    chart_id = "echarts_" * string(rand(UInt32))

    # When ECHARTS_DOCS_BUILD is set, echarts.min.js is loaded as a page asset
    # by Documenter.jl — skip inlining it to avoid bloating the output.
    echarts_loader = if get(ENV, "ECHARTS_DOCS_BUILD", "false") == "true"
        ""
    else
        echarts_js = read(joinpath(@__DIR__, "echarts.min.js"), String)
        "if (typeof echarts === 'undefined') { $(echarts_js) }"
    end

    return """
    <div id="$(chart_id)" style="width:$(ec.ec_width)px;height:$(ec.ec_height)px;"></div>
    <script>
    $(echarts_loader)
    (function() {
        var dom = document.getElementById('$(chart_id)');
        var myChart = echarts.init(dom, $(theme), {renderer: '$(ec.ec_renderer)'});
        myChart.setOption($(option));
        window.addEventListener('resize', function() { myChart.resize(); });
    })();
    </script>
    """
end

#Jupyter notebook method
Base.show(io::IO, ::MIME"text/html", ec::EChart) = write(io, _echarts_html(ec))

#VSCode method - displays chart inline in the VSCode plot panel (requires Julia VSCode extension)
Base.show(io::IO, ::MIME"juliavscode/html", ec::EChart) = write(io, _echarts_html(ec))

#Shared helper for EChartRaw: same structure as EChart but uses the raw JSON option string directly
function _echarts_html(ec::EChartRaw)
    theme = json(makevalidjson(ec.theme))
    chart_id = "echarts_" * string(rand(UInt32))

    echarts_loader = if get(ENV, "ECHARTS_DOCS_BUILD", "false") == "true"
        ""
    else
        echarts_js = read(joinpath(@__DIR__, "echarts.min.js"), String)
        "if (typeof echarts === 'undefined') { $(echarts_js) }"
    end

    return """
    <div id="$(chart_id)" style="width:$(ec.ec_width)px;height:$(ec.ec_height)px;"></div>
    <script>
    $(echarts_loader)
    (function() {
        var dom = document.getElementById('$(chart_id)');
        var myChart = echarts.init(dom, $(theme), {renderer: '$(ec.ec_renderer)'});
        myChart.setOption($(ec.option));
        window.addEventListener('resize', function() { myChart.resize(); });
    })();
    </script>
    """
end

Base.show(io::IO, ::MIME"text/html", ec::EChartRaw) = write(io, _echarts_html(ec))
Base.show(io::IO, ::MIME"juliavscode/html", ec::EChartRaw) = write(io, _echarts_html(ec))
