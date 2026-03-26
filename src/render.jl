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
print(x::EChart) = print(JSON.json(x))
print(x::EChartRaw) = print(x.option)

# Internal: shared HTML template used by both EChart and EChartRaw renderers.
function _echarts_html(option::String, width, height, renderer::String, theme)
    theme_json = JSON.json(theme)
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
    <div id="$(chart_id)" style="width:$(width)px;height:$(height)px;"></div>
    <script>
    $(echarts_loader)
    (function() {
        var dom = document.getElementById('$(chart_id)');
        var myChart = echarts.init(dom, $(theme_json), {renderer: '$(renderer)'});
        myChart.setOption($(option));
        window.addEventListener('resize', function() { myChart.resize(); });
    })();
    </script>
    """
end

_echarts_html(ec::EChart)    = _echarts_html(JSON.json(ec), ec.ec_width, ec.ec_height, ec.ec_renderer, ec.theme)
_echarts_html(ec::EChartRaw) = _echarts_html(ec.option,     ec.ec_width, ec.ec_height, ec.ec_renderer, ec.theme)

#Jupyter notebook method
Base.show(io::IO, ::MIME"text/html",        ec::EChart)    = write(io, _echarts_html(ec))
Base.show(io::IO, ::MIME"juliavscode/html", ec::EChart)    = write(io, _echarts_html(ec))
Base.show(io::IO, ::MIME"text/html",        ec::EChartRaw) = write(io, _echarts_html(ec))
Base.show(io::IO, ::MIME"juliavscode/html", ec::EChartRaw) = write(io, _echarts_html(ec))
