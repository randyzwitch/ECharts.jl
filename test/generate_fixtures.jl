using ECharts, DataFrames, StatsBase, CSV, KernelDensity, Distributions
using JSON, RDatasets

mtcars   = dataset("datasets", "mtcars")
diamonds = dataset("ggplot2", "diamonds")

outdir = joinpath(@__DIR__, "fixtures")
mkpath(outdir)

function save_fixture(name, chart)
    try
        json_str = ECharts.json(ECharts.makevalidjson(chart))
        JSON.parse(json_str)  # skip fixtures that contain raw JSFunction output
        write(joinpath(outdir, "$name.json"), json_str)
        println("  saved $name.json")
    catch e
        println("  skipped $name ($(typeof(e)))")
    end
end

charts = Pair{String,EChart}[]

# area
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
push!(charts, "area_basic"            => area(x, y))
push!(charts, "area_step"             => area(x, hcat(y, 3.7 .* y), step = "middle"))
push!(charts, "area_multi"            => area(x, hcat(y, 3.7 .* y)))
push!(charts, "area_df"              => area(DataFrame(x=x, y=y), :x, :y))
push!(charts, "area_kde"             => area(kde(rand(100))))

let df = DataFrame(hcat([0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9],
                        [28,43,81,19,52,24,87,17,68,49,55,91,53,87,48,49,66,27,16,15],
                        [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]), [:x,:y,:g])
    push!(charts, "area_grouped" => area(df, :x, :y, :g))
end

# bar
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
push!(charts, "bar_basic"            => bar(x, y))
push!(charts, "bar_color"            => bar(x, y, color = "green"))
push!(charts, "bar_horizontal"       => bar(x, y, horizontal = true))
push!(charts, "bar_multi"            => bar(x, hcat(0.95.*y, 1.25.*y, y)))
push!(charts, "bar_stacked"          => bar(x, hcat(0.95.*y, 1.25.*y, y), stack = true))
push!(charts, "bar_stack_groups"     => bar(x, hcat(0.95.*y, 1.25.*y, y), stack = [1,1,2]))
push!(charts, "bar_mixed_marks"      => bar(x, hcat(0.95.*y, 1.25.*y, y), mark = ["line","bar","bar"]))

let df = DataFrame(hcat([0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9],
                        [28,43,81,19,52,24,87,17,68,49,55,91,53,87,48,49,66,27,16,15],
                        [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]), [:x,:y,:g])
    push!(charts, "bar_grouped" => bar(df, :x, :y, :g))
end

# box
push!(charts, "box_single"      => box([850,740,900,1070,930,850,950,980,980,880,1000,980,930,650,760,810,1000,1000,960,960]))
push!(charts, "box_horizontal"  => box([[850,740,900,1070,930],[960,940,960,940,880]], horizontal = true))
push!(charts, "box_df"          => box(mtcars, :MPG, :Cyl))

# candlestick
let dt = ["2016/08/26","2016/08/29","2016/08/30","2016/08/31","2016/09/01"],
    o = [12.47,12.38,12.46,12.48,12.66],
    c = [12.38,12.47,12.55,12.60,12.44],
    l = [12.34,12.38,12.43,12.48,12.35],
    h = [12.55,12.50,12.56,12.61,12.72]
    push!(charts, "candlestick" => candlestick(dt, o, c, l, h))
end

# funnel
push!(charts, "funnel" => funnel(["A","B","C","D","E"], [100,60,80,70,50]))

# gauge
push!(charts, "gauge_basic"  => gauge(27.64))
push!(charts, "gauge_colors" => gauge(27.64, colors = ["lightgreen","lightblue","red"], breakpoints = [.4,.7,1.0]))

# line
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
push!(charts, "line_basic"  => line(x, y))
push!(charts, "line_step"   => line(x, y, step = "end"))
push!(charts, "line_multi"  => line(x, hcat(y, 0.6.*y)))
let c = line(x, y); smooth!(c); push!(charts, "line_smooth" => c) end

# pie / donut
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
push!(charts, "pie_basic"   => pie(x, y))
push!(charts, "pie_explode" => pie(["a","b","c","d","e"], [335,310,234,135,1548], selected = [true,false,false,false,false]))
push!(charts, "pie_rose"    => pie(["a","b","c","d","e"], [335,310,234,135,1548], roseType = "angle"))
push!(charts, "donut_basic" => donut(x, y))
push!(charts, "donut_rose"  => donut(["a","b","c","d","e"], [335,310,234,135,1548], roseType = "radius"))

# polar
let t = 0:360,
    ang = [a/180*pi for a in t],
    rad = [(sin(2a)*cos(2a)) for a in ang]
    push!(charts, "polar_basic" => polar(ang, rad))
    push!(charts, "polar_multi" => polar(ang, hcat(rad, [(sin(2.5a)*cos(2.5a)) for a in ang])))
end

# radar
let names = ["sales","administration","information technology","customer support","development","marketing"],
    mx    = [6500,16000,30000,38000,52000,25000],
    vals  = [4300,10000,28000,35000,50000,19000]
    push!(charts, "radar_basic" => radar(names, vals, mx))
    push!(charts, "radar_multi" => radar(names, hcat(vals, 0.7.*vals), mx))
end

# sankey
let name = ["Agricultural waste","Bio-conversion","Liquid","Losses","Solid","Gas","Biofuel imports","Biomass imports","Coal imports","Coal"],
    src  = [0,1,1,1,1,6,7,8,10],
    tgt  = [1,2,3,4,5,2,4,9,9],
    val  = [124.729,0.597,26.862,280.322,81.144,35,35,11.606,63.965]
    push!(charts, "sankey" => sankey(name, src, tgt, val))
end

# scatter
push!(charts, "scatter_basic"   => scatter(rand(30), rand(30)))
push!(charts, "scatter_multi"   => scatter(rand(30), hcat(rand(30), rand(30))))
push!(charts, "scatter_grouped" => scatter(mtcars, :MPG, :HP, :Cyl))

# waterfall
push!(charts, "waterfall" => waterfall(1:5, [2900,-1200,-300,-200,-900]))

# histogram
let h = fit(Histogram, diamonds.Price, closed = :left)
    push!(charts, "histogram_1d" => histogram(h))
end
let h = fit(Histogram, (diamonds.Price, diamonds.Carat), closed = :left)
    push!(charts, "histogram_2d" => histogram(h))
end

# radialbar
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
push!(charts, "radialbar_basic"       => radialbar(x, y))
push!(charts, "radialbar_multi"       => radialbar(x, hcat(0.95.*y, 1.25.*y, y)))
push!(charts, "radialbar_stack"       => radialbar(x, hcat(0.95.*y, 1.25.*y, y), stack = [1,1,2]))

# streamgraph
let s_df = CSV.read(joinpath(dirname(@__FILE__), "..", "exampledata/streamdata.csv"), DataFrame,
                    types = [String, Float64, String])
    push!(charts, "streamgraph" => streamgraph(s_df.date, s_df.value, s_df.key, legend = true))
end

# bubble
push!(charts, "bubble_df"          => bubble(mtcars, :MPG, :HP, :Disp))
push!(charts, "bubble_vectors"     => bubble(mtcars.MPG, mtcars.HP, mtcars.Disp))
push!(charts, "bubble_grouped"     => bubble(mtcars, :MPG, :HP, :Disp, :Cyl))

# corrplot
push!(charts, "corrplot_df"     => corrplot(mtcars))
let df_num = mtcars[!, [x <: Union{Number,Missing} for x in eltype.(eachcol(mtcars))]]
    push!(charts, "corrplot_matrix" => corrplot(cor(Matrix(df_num))))
end

println("Generating $(length(charts)) fixtures into $outdir")
foreach(p -> save_fixture(p.first, p.second), charts)
println("Done.")
