# Live Bitcoin price chart using ECharts.jl + CoinGecko public API
#
# CoinGecko's free API returns the current Bitcoin/USD price with no
# authentication required. We poll it every 5 seconds (well within the
# 30 req/min free-tier limit), maintain a rolling 60-point window, and
# push each new reading to a live ECharts line chart.
#
# Run this in a Jupyter or VSCode notebook. The chart will appear when
# `display(live)` executes, and the price trace will animate as new
# data arrives. Call `close(live)` to stop the HTTP polling server.

using ECharts
using HTTP
using JSON
using Dates

# ── configuration ─────────────────────────────────────────────────────────────
const SYMBOL       = "bitcoin"
const CURRENCY     = "usd"
const POLL_SECS    = 5          # seconds between price fetches
const WINDOW       = 60         # number of data points to keep visible
const COINGECKO_URL = "https://api.coingecko.com/api/v3/simple/price" *
                      "?ids=$SYMBOL&vs_currencies=$CURRENCY"

# ── helpers ───────────────────────────────────────────────────────────────────
function fetch_price()::Float64
    resp = HTTP.get(COINGECKO_URL; status_exception = true)
    data = JSON.parse(String(resp.body))
    return Float64(data[SYMBOL][CURRENCY])
end

function build_chart(times::Vector{String}, prices::Vector{Float64})
    ec = line(times, prices; scale = true)
    title!(ec; text = "Bitcoin / USD  (live)")
    yaxis!(ec; name = "USD")
    xaxis!(ec; name = "Time")
    return ec
end

# ── seed with one real data point so the chart renders immediately ─────────────
const times  = String[]
const prices = Float64[]

push!(times,  Dates.format(now(), "HH:MM:SS"))
push!(prices, fetch_price())

# ── create and display the live chart ─────────────────────────────────────────
const live = livechart(build_chart(times, prices); interval_ms = 1_000)
display(live)

# ── background task: fetch → append → trim → update ───────────────────────────
@async while isopen(live.server)
    sleep(POLL_SECS)

    price = try
        fetch_price()
    catch e
        @warn "CoinGecko fetch failed" exception = e
        continue
    end

    push!(times,  Dates.format(now(), "HH:MM:SS"))
    push!(prices, price)

    if length(prices) > WINDOW
        popfirst!(times)
        popfirst!(prices)
    end

    update!(live, build_chart(times, prices))
end
