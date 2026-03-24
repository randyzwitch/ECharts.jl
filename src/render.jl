#Pretty-print
print(x::EChart) = print(json(makevalidjson(x)))

#Shared helper: produces self-contained HTML with echarts.min.js inlined
function _echarts_html(ec::EChart)
    echarts_js = read(joinpath(@__DIR__, "..", "docs", "js", "echarts.min.js"), String)
    option = json(makevalidjson(ec))
    theme = json(makevalidjson(ec.theme))
    chart_id = "echarts_" * string(rand(UInt32))

    return """
    <div id="$(chart_id)" style="width:$(ec.ec_width)px;height:$(ec.ec_height)px;"></div>
    <script>
    $(echarts_js)
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

#REPL method
function Base.display(::REPL.REPLDisplay, ec::EChart)
    w = Blink.Window()
    Blink.loadhtml!(w, _echarts_html(ec))
end

#VSCode method - displays chart inline in the VSCode plot panel (requires Julia VSCode extension)
Base.show(io::IO, ::MIME"juliavscode/html", ec::EChart) = write(io, _echarts_html(ec))
