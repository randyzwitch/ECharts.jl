const _chart_id_counter = Threads.Atomic{Int}(0)

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

"""
macro echart(option, kwargs...)
    :(echart($(esc(option)); $(map(esc, kwargs)...)))
end

#Pretty-print
print(x::EChart) = print(JSON.json(x))
print(x::EChartRaw) = print(x.option)

# Internal: shared HTML template used by both EChart and EChartRaw renderers.
function _echarts_html(option::String, width, height, renderer::String, theme;
                       register_map_name::Union{String, Nothing} = nothing,
                       register_map_data::Union{String, Nothing} = nothing)
    theme_json = JSON.json(theme)
    chart_id = "echarts_" * string(Threads.atomic_add!(_chart_id_counter, 1))

    # When ECHARTS_DOCS_BUILD is set, echarts.min.js is loaded as a page asset
    # by Documenter.jl — skip inlining it to avoid bloating the output.
    echarts_loader = if get(ENV, "ECHARTS_DOCS_BUILD", "false") == "true"
        ""
    else
        echarts_js = read(joinpath(@__DIR__, "echarts.min.js"), String)
        "if (typeof echarts === 'undefined') { $(echarts_js) }"
    end

    register_map_js = if !isnothing(register_map_name) && !isnothing(register_map_data)
        "echarts.registerMap('$(register_map_name)', $(register_map_data));"
    else
        ""
    end

    return """
    <div id="$(chart_id)" style="width:$(width)px;height:$(height)px;"></div>
    <script>
    $(echarts_loader)
    (function() {
        var dom = document.getElementById('$(chart_id)');
        var myChart = echarts.init(dom, $(theme_json), {renderer: '$(renderer)'});
        $(register_map_js)
        myChart.setOption($(option));
        window.addEventListener('resize', function() { myChart.resize(); });
    })();
    </script>
    """
end

_echarts_html(ec::EChart)    = _echarts_html(JSON.json(ec, allownan=true), ec.ec_width, ec.ec_height, ec.ec_renderer, ec.theme;
                                             register_map_name = ec.ec_mapname,
                                             register_map_data = ec.ec_mapdata)
_echarts_html(ec::EChartRaw) = _echarts_html(ec.option,     ec.ec_width, ec.ec_height, ec.ec_renderer, ec.theme)

#Jupyter notebook method
Base.show(io::IO, ::MIME"text/html",        ec::EChart)    = write(io, _echarts_html(ec))
Base.show(io::IO, ::MIME"juliavscode/html", ec::EChart)    = write(io, _echarts_html(ec))
Base.show(io::IO, ::MIME"text/html",        ec::EChartRaw) = write(io, _echarts_html(ec))
Base.show(io::IO, ::MIME"juliavscode/html", ec::EChartRaw) = write(io, _echarts_html(ec))

const _NODEJS_PKG_ID = Base.PkgId(Base.UUID("2bd173c7-0d6d-553b-b6af-13a54713934c"), "NodeJS")

"""
    savefig(filename::AbstractString, ec::Union{EChart, EChartRaw})

Save an EChart to a file. The output format is determined by the file extension:

- `.html` — self-contained HTML page with ECharts.js embedded
- `.json` — raw ECharts option JSON (the object passed to `setOption`)
- `.svg`  — server-side rendered SVG via NodeJS.jl

"""
function savefig(filename::AbstractString, ec::Union{EChart, EChartRaw})
    ext = lowercase(splitext(filename)[2])
    if ext == ".html"
        open(filename, "w") do io
            write(io, "<!DOCTYPE html>\n<html>\n<head><meta charset=\"utf-8\"><title>ECharts</title></head>\n<body>\n")
            write(io, _echarts_html(ec))
            write(io, "\n</body>\n</html>\n")
        end
    elseif ext == ".json"
        open(filename, "w") do io
            write(io, ec isa EChart ? JSON.json(ec) : ec.option)
        end
    elseif ext == ".svg"
        NodeJS = Base.require(_NODEJS_PKG_ID)
        payload = JSON.json(Dict(
            "option" => JSON.parse(ec isa EChart ? JSON.json(ec) : ec.option),
            "width"  => ec.ec_width,
            "height" => ec.ec_height,
            "theme"  => ec.theme,
        ))
        script = joinpath(@__DIR__, "ssr_render.js")
        write(filename, read(pipeline(IOBuffer(payload), `$(NodeJS.nodejs_cmd()) $script`), String))
    else
        throw(ArgumentError("Unsupported extension \"$ext\". Use \".html\", \".json\", or \".svg\"."))
    end
end
