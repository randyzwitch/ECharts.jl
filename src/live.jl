import HTTP
import Sockets

"""
    EChartLive

A dynamically-updating ECharts chart backed by a local HTTP server.
The browser polls the server every `interval_ms` milliseconds and calls
`setOption` with whatever the current chart state is.

Created by [`livechart`](@ref). Display in a Jupyter or VSCode notebook to
start the polling loop. Use [`update!`](@ref) to push new data. Use
`close(live)` to shut down the server when done.
"""
mutable struct EChartLive
    chart::Union{EChart, EChartRaw}
    port::Int
    interval_ms::Int
    server::Any        # HTTP.Servers.Server
    chart_id::String
end

function _find_free_port()
    for _ in 1:100
        port = rand(49152:65000)
        try
            s = Sockets.listen(Sockets.IPv4("127.0.0.1"), port)
            close(s)
            return port
        catch
        end
    end
    error("ECharts: could not find a free port for live chart server")
end

"""
    livechart(ec; interval_ms=1000)

Wrap an `EChart` or `EChartRaw` in a live-updating container. Starts a local
HTTP server on a random port; the rendered chart polls this server every
`interval_ms` milliseconds and calls `setOption` with the latest data.

Use [`update!`](@ref) to push new chart data. Use `close(live)` to stop the
server.

!!! note "Local use only"
    `livechart` starts an HTTP server on `127.0.0.1` and embeds that address
    in the rendered HTML. The browser resolves `127.0.0.1` relative to
    itself, so both Julia and the browser must be running on the same machine.
    This works in local Jupyter notebooks and the VSCode Julia extension, but
    will not work on JupyterHub, Binder, or other remote notebook environments.
    For deployable live dashboards, see Genie.jl / Stipple.jl.

# Example
```julia
ec = line(times, prices)
live = livechart(ec; interval_ms=1000)
display(live)

@async while true
    push!(times, now_str()); push!(prices, fetch_price())
    update!(live, line(times, prices))
    sleep(1)
end
```
"""
function livechart(ec::Union{EChart, EChartRaw}; interval_ms::Int = 1000)
    port     = _find_free_port()
    chart_id = "echarts_live_" * string(Threads.atomic_add!(_chart_id_counter, 1))
    live     = EChartLive(ec, port, interval_ms, nothing, chart_id)

    live.server = HTTP.serve!("127.0.0.1", port) do _
        option_json = live.chart isa EChart ? JSON.json(live.chart) : live.chart.option
        return HTTP.Response(200,
            ["Content-Type"  => "application/json",
             "Cache-Control" => "no-store"],
            option_json)
    end

    return live
end

"""
    update!(live::EChartLive, new_chart)

Replace the chart data shown by a live chart. The next browser poll will call
`setOption` with the new data; ECharts animates the transition automatically.
"""
function update!(live::EChartLive, new_chart::Union{EChart, EChartRaw})
    live.chart = new_chart
    return live
end

"""
    close(live::EChartLive)

Stop the local HTTP polling server backing a live chart.
"""
Base.close(live::EChartLive) = close(live.server)

function _echarts_live_html(live::EChartLive)
    ec         = live.chart
    option_json = ec isa EChart ? JSON.json(ec) : ec.option
    width      = ec.ec_width
    height     = ec.ec_height
    renderer   = ec.ec_renderer
    theme_json = JSON.json(ec.theme)

    echarts_loader = if get(ENV, "ECHARTS_DOCS_BUILD", "false") == "true"
        ""
    else
        echarts_js = read(joinpath(@__DIR__, "echarts.min.js"), String)
        "if (typeof echarts === 'undefined') { $(echarts_js) }"
    end

    return """
    <div id="$(live.chart_id)" style="width:$(width)px;height:$(height)px;"></div>
    <script>
    $(echarts_loader)
    (function() {
        var dom = document.getElementById('$(live.chart_id)');
        var myChart = echarts.init(dom, $(theme_json), {renderer: '$(renderer)'});
        myChart.setOption($(option_json));
        window.addEventListener('resize', function() { myChart.resize(); });

        setInterval(function() {
            fetch('http://127.0.0.1:$(live.port)/$(live.chart_id)', {cache: 'no-store'})
                .then(function(r) { return r.json(); })
                .then(function(opt) { myChart.setOption(opt); })
                .catch(function(e) { console.warn('[ECharts live] poll error:', e); });
        }, $(live.interval_ms));
    })();
    </script>
    """
end

Base.show(io::IO, ::MIME"text/html",        live::EChartLive) = write(io, _echarts_live_html(live))
Base.show(io::IO, ::MIME"juliavscode/html", live::EChartLive) = write(io, _echarts_live_html(live))
