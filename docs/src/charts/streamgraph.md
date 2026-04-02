# streamgraph

```@docs
streamgraph
```

```@example
using ECharts, Dates, Random
Random.seed!(42)
months = collect(Date(2019, 1, 1):Month(1):Date(2023, 12, 1))
n = length(months)

# Simulated music streaming share by genre (relative units)
t = range(0, 2π, length = n)
hip_hop = max.(1, 30 .+ 4 .* sin.(t .+ 0.5) .+ randn(n))
pop     = max.(1, 24 .+ 3 .* sin.(t .+ 1.5) .+ randn(n))
rock    = max.(1, 20 .- 3 .* range(0, 1, length = n) .+ randn(n))
rnb     = max.(1, 14 .+ 2 .* sin.(t .+ 2.0) .+ randn(n))
country = max.(1, 10 .+ 1 .* sin.(t .+ 3.0) .+ randn(n))

dates  = repeat(months, 5)
values = vcat(hip_hop, pop, rock, rnb, country)
groups = vcat(fill("Hip-Hop", n), fill("Pop", n), fill("Rock", n),
              fill("R&B", n), fill("Country", n))
ec = streamgraph(dates, values, groups)
title!(ec, text = "Music Streaming by Genre", subtext = "Relative share, 2019–2023")
ec
```
