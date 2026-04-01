#### Because charts are rendered in JavaScript, tests are checks for valid syntax
#### Visual correctness will need to be done manually, mostly via docs

using RDatasets
mtcars = dataset("datasets", "mtcars");
diamonds = dataset("ggplot2", "diamonds");

using ECharts, DataFrames, StatsBase, CSV, KernelDensity, Distributions
using Test
using JSON

#1: Homepage doc example
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y, color = lineargradient("purple", "cyan"))
smooth!(ar)
xaxis!(ar, name = "Day of Week")
yaxis!(ar, name = "Daily High Temperature °C")
@test typeof(ar) == EChart

#2: area
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar2 = area(x, y)
@test typeof(ar2) == EChart

df = DataFrame(x = x, y = y)
@test typeof(area(df, :x, :y)) == EChart
@test typeof(bar(df, :x, :y)) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
y2 = 3.7 .* y
as = area(x, hcat(y, y2))
@test typeof(as) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
y2 = 3.7 .* y
astep = area(x, hcat(y, y2), step = "middle")
@test typeof(astep) == EChart

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
df_merged = DataFrame(hcat(x,y,g), [:x, :y, :g])
adfg = area(df_merged, :x, :y, :g)
@test typeof(adfg) == EChart

x = rand(Beta(3.0, 2.0), 10)
k = kde(x)
@test typeof(area(k)) == EChart

#3: bar
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
b = bar(x, y)
@test typeof(b) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bc = bar(x, y, color = "green")
@test typeof(bc) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bch = bar(x, y, color = "lightgray", horizontal = true)
@test typeof(bch) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bm = bar(x, hcat(0.95 .* y, 1.25 .* y, y))
@test typeof(bm) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bcs = bar(x, hcat(0.95 .* y, 1.25 .* y, y), color = ["red", "gray", "blue"], stack = true)
@test typeof(bcs) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bcsa = bar(x, hcat(0.95 .* y, 1.25 .* y, y), color = ["red", "gray", "blue"], stack = [1,1,2])
@test typeof(bcsa) == EChart

x = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9]
y = [28, 43, 81, 19, 52, 24, 87, 17, 68, 49, 55, 91, 53, 87, 48, 49, 66, 27, 16, 15]
g = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1]
df_merged = DataFrame(hcat(x,y,g), [:x, :y, :g])
bg = bar(df_merged, :x, :y, :g)
@test typeof(bg) == EChart

#4: box
data = [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960]
b = box(data)
@test typeof(b) == EChart

data = [
    [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960],
    [960, 940, 960, 940, 880, 800, 850, 880, 900, 840, 830, 790, 810, 880, 880, 830, 800, 790, 760, 800],
    [880, 880, 880, 860, 720, 720, 620, 860, 970, 950, 880, 910, 850, 870, 840, 840, 850, 840, 840, 840],
    [890, 810, 810, 820, 800, 770, 760, 740, 750, 760, 910, 920, 890, 860, 880, 720, 840, 850, 850, 780],
    [890, 840, 780, 810, 760, 810, 790, 810, 820, 850, 870, 870, 810, 740, 810, 940, 950, 800, 810, 870]
]

b2 = box(data, horizontal = true)
@test typeof(b2) == EChart

bdf = box(mtcars, :MPG, :Cyl)
@test typeof(bdf) == EChart

#5: candlestick
dt = ["2016/08/26", "2016/08/29", "2016/08/30", "2016/08/31", "2016/09/01", "2016/09/02",
"2016/09/06", "2016/09/07", "2016/09/08", "2016/09/09", "2016/09/12", "2016/09/13",
"2016/09/14", "2016/09/15", "2016/09/16", "2016/09/19", "2016/09/20", "2016/09/21",
"2016/09/22", "2016/09/23", "2016/09/26"]

close_ = [12.3800, 12.4700, 12.5500, 12.6000, 12.4400, 12.5000, 12.6700, 12.7000, 12.7300,
12.3800, 12.7000, 12.3800, 12.1400, 12.1100, 12.1100, 12.1100, 12.0000, 12.0900, 12.1800,
12.1700, 12.0100]

open_ = [12.4700, 12.3800, 12.4600, 12.4800, 12.6600, 12.5300, 12.4900, 12.6200, 12.5000,
12.6100, 12.3200, 12.5300, 12.1800, 12.1400, 12.0500, 12.1200, 12.0900, 12.0800, 12.1700,
12.1200, 12.1200]

high_ = [12.5500, 12.5000, 12.5600, 12.6100, 12.7200, 12.5700, 12.6700, 12.7500, 12.7500,
12.6850, 12.7700, 12.6800, 12.3100, 12.1800, 12.1300, 12.3300, 12.1900, 12.1100, 12.2900,
12.2200, 12.1200]

low_ = [12.3400, 12.3800, 12.4300, 12.4800, 12.3500, 12.4600, 12.4300, 12.6200, 12.5000,
12.3800, 12.2800, 12.3300,12.1100, 12.0600, 12.0100, 12.0586, 11.9600, 12.0100, 12.1600,
12.1200, 12.0000]

c = candlestick(dt, open_, close_, low_, high_)
@test typeof(c) == EChart

#6: funnel
v = [100,60,80,70,50]
n = ["A", "B", "C", "D", "E"]
fn = funnel(n, v)
@test typeof(fn) == EChart

#7: gauge
gg = gauge(27.64)
@test typeof(gg) == EChart

gg2 = gauge(27.64, colors = ["lightgreen", "lightblue","red"], breakpoints = [.4, .7, 1])
@test typeof(gg2) == EChart

#8: line
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
l = line(x, y)
@test typeof(l) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ls = line(x, y, step = "end")
@test typeof(ls) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
y2 = 0.6 .* y
l2s = line(x, hcat(y, y2))
@test typeof(l2s) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
lsamp = line(x, y, sampling = "lttb")
@test typeof(lsamp) == EChart
@test lsamp.series[1].sampling == "lttb"

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
y2 = 0.6 .* y
l2samp = line(x, hcat(y, y2), sampling = "average")
@test typeof(l2samp) == EChart
@test all(s.sampling == "average" for s in l2samp.series)

#9: pie
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
p = pie(x, y)
@test typeof(p) == EChart

values = [335, 310, 234, 135, 1548]
names = ["direct traffic", "email marketing", "advertising alliance", "video ads", "search engine"]
explode = [true, false, false, false, false]
pe = pie(names, values, selected = explode)
@test typeof(pe) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
d = donut(x, y)
@test typeof(d) == EChart

values = [335, 310, 234, 135, 1548]
names = ["direct traffic", "email marketing", "advertising alliance", "video ads", "search engine"]
rose = pie(names, values, roseType = "angle")
@test typeof(rose) == EChart

values = [335, 310, 234, 135, 1548]
names = ["direct traffic", "email marketing", "advertising alliance", "video ads", "search engine"]
radiusd = donut(names, values, roseType = "radius")
@test typeof(radiusd) == EChart

#10: polar
t = 0:360
angle = [a / 180 * pi for a in t]
radius = [(sin(2t) * cos(2t)) for t in angle]
p = polar(angle, radius)
@test typeof(p) == EChart

t = 0:360
angle = [a / 180 * pi for a in t]
radius = [(sin(2t) * cos(2t)) for t in angle]
radius2 = [(sin(2.5t) * cos(2.5t)) for t in angle]
p2 = polar(angle, hcat(radius, radius2))
@test typeof(p2) == EChart

#11: radar
names = ["sales", "administration", "information technology", "customer support", "development",
"marketing"]
max = [6500, 16000, 30000, 38000, 52000, 25000]
values = [4300, 10000, 28000, 35000, 50000, 19000]
r = radar(names, values, max)
@test typeof(r) == EChart

names = ["sales", "administration", "information technology", "customer support", "development",
"marketing"]
max = [6500, 16000, 30000, 38000, 52000, 25000]
values = [4300, 10000, 28000, 35000, 50000, 19000]
values2 = 0.7 .* values
r2 = radar(names, hcat(values, values2), max)
@test typeof(r2) == EChart

#12: sankey
name = ["Agricultural waste", "Bio-conversion", "Liquid", "Losses", "Solid", "Gas", "Biofuel imports",
    "Biomass imports", "Coal imports", "Coal"]

source = [0, 1, 1, 1, 1, 6, 7, 8, 10]
target = [1, 2, 3, 4, 5, 2, 4, 9, 9]
value = [124.729, 0.597, 26.862, 280.322, 81.144, 35, 35, 11.606, 63.965]
s = sankey(name, source, target, value)
@test typeof(s) == EChart

s2 = sankey(joinpath(dirname(@__DIR__), "exampledata", "sankey.txt"))
@test typeof(s) == EChart

#13: scatter
sc = scatter(rand(30), rand(30))
@test typeof(sc) == EChart

sc2 = scatter(rand(30), hcat(rand(30), rand(30)))
@test typeof(sc2) == EChart

sgrp = scatter(mtcars, :MPG, :HP, :Cyl)
@test typeof(sgrp) == EChart

#14: xy
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bmf = bar(x, hcat(0.95 .* y, 1.25 .* y, y), mark = ["line", "bar", "bar"])
@test typeof(bmf) == EChart

#15: waterfall
x = 1:5
y = [2900, -1200, -300, -200, -900]
w = waterfall(x, y)
@test typeof(w) == EChart

#16: histogram
h = fit(Histogram, diamonds.Price, closed = :left)
hs = histogram(h)
@test typeof(hs) == EChart

h2 = fit(Histogram, (diamonds.Price, diamonds.Carat), closed = :left)
hs2 = histogram(h2)
@test typeof(hs2) == EChart

#17: radialbar
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
b = radialbar(x, y)
@test typeof(b) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
b = radialbar(x, hcat(0.95 .* y, 1.25 .* y,y))
@test typeof(b) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
b = radialbar(x, hcat(0.95 .* y, 1.25 .* y,y), stack = [1,1,2])
@test typeof(b) == EChart

#18: streamgraph
s_df = CSV.read(joinpath(dirname(@__FILE__), "..", "exampledata/streamdata.csv"), DataFrame, types=[String, Float64, String])
sg = streamgraph(s_df.date, s_df.value, s_df.key, legend = true)
@test typeof(sg) == EChart

#19: bubble
sgrp = bubble(mtcars, :MPG, :HP, :Disp)
@test typeof(sgrp) == EChart

sgrp2 = bubble(mtcars.MPG, mtcars.HP, mtcars.Disp)
@test typeof(sgrp2) == EChart

sgrp3 = bubble(mtcars, :MPG, :HP, :Disp, :Cyl)
@test typeof(sgrp3) == EChart

#shadow! — bubbles have shadows by default
@test sgrp2.series[1].itemStyle.shadowBlur == 10
@test sgrp2.series[1].itemStyle.shadowColor == "rgba(0,0,0,0.5)"
@test sgrp2.series[1].itemStyle.shadowOffsetX == 0
@test sgrp2.series[1].itemStyle.shadowOffsetY == 5

#shadow! on grouped bubble applies to all series
for s in sgrp3.series
    @test s.itemStyle.shadowBlur == 10
end

#shadow! can override defaults
shadow!(sgrp3, 1, shadowBlur = 20, shadowColor = "rgba(255,0,0,0.5)", shadowOffsetX = 2, shadowOffsetY = 4)
@test sgrp3.series[1].itemStyle.shadowBlur == 20
@test sgrp3.series[1].itemStyle.shadowColor == "rgba(255,0,0,0.5)"
@test sgrp3.series[1].itemStyle.shadowOffsetX == 2
@test sgrp3.series[1].itemStyle.shadowOffsetY == 4

#19: corrplot
cplot = corrplot(mtcars)
@test typeof(cplot) == EChart

df_num = mtcars[!, [x <: Union{Number, Missing} for x in eltype.(eachcol(mtcars))]]
c = cor(Matrix(df_num))
ccc = corrplot(c)
@test typeof(ccc) == EChart

# new arguments
ccc_nodiag = corrplot(c, diag = false)
@test typeof(ccc_nodiag) == EChart

ccc_digits = corrplot(c, number_digits = 4)
@test typeof(ccc_digits) == EChart

ccc_style = corrplot(c, label_color = "white", label_fontsize = 12)
@test typeof(ccc_style) == EChart

cplot_alpha = corrplot(mtcars, order = "alphabet")
@test typeof(cplot_alpha) == EChart

@test_throws ArgumentError corrplot(mtcars, order = "invalid")

# parallel
par_data = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]
par_dims = ["A", "B", "C"]
result_parallel = parallel(par_data, par_dims)
@test typeof(result_parallel) == EChart
# effectscatter
es_x = randn(20)
es_y = randn(20)
result_effectscatter = effectscatter(es_x, es_y)
@test typeof(result_effectscatter) == EChart

es2 = effectscatter(es_x, hcat(es_y, randn(20)))
@test typeof(es2) == EChart

es_df = effectscatter(mtcars, :MPG, :HP)
@test typeof(es_df) == EChart

es_grp = effectscatter(mtcars, :MPG, :HP, :Cyl)
@test typeof(es_grp) == EChart
# graph
g_nodes = ["A", "B", "C", "D"]
g_links = [["A", "B"], ["B", "C"], ["C", "D"], ["D", "A"]]
result_graph = graph(g_nodes, g_links)
@test typeof(result_graph) == EChart
# calendar_heatmap
using Dates
cal_dates = [Date(2023, 1, 1) + Day(i) for i in 0:364]
cal_values = rand(365)
result_cal = calendarheatmap(cal_dates, cal_values, 2023)
@test typeof(result_cal) == EChart
# punchcard
pc_x = repeat(["Mon", "Tue", "Wed", "Thu", "Fri"], 3)
pc_y = repeat(["Morning", "Afternoon", "Evening"], inner = 5)
pc_sizes = rand(1:100, 15)
result_punchcard = punchcard(pc_x, pc_y, pc_sizes)
@test typeof(result_punchcard) == EChart
# beeswarm
bs_cats = vcat(fill("A", 20), fill("B", 20), fill("C", 20))
bs_vals = randn(60)
result_beeswarm = beeswarm(bs_cats, bs_vals)
@test typeof(result_beeswarm) == EChart
# population_pyramid
pp_ages = ["0-9", "10-19", "20-29", "30-39"]
pp_male = [100, 120, 130, 110]
pp_female = [95, 115, 125, 105]
result_pyramid = populationpyramid(pp_ages, pp_male, pp_female)
@test typeof(result_pyramid) == EChart
# gantt
using Dates
gantt_tasks  = ["Design", "Development", "Testing", "Deployment"]
gantt_starts = [Date(2024, 1, 1), Date(2024, 2, 1), Date(2024, 4, 1), Date(2024, 5, 1)]
gantt_ends   = [Date(2024, 2, 1), Date(2024, 4, 1), Date(2024, 5, 1), Date(2024, 5, 15)]
result_gantt = gantt(gantt_tasks, gantt_starts, gantt_ends)
@test typeof(result_gantt) == EChart
# ridgeline
rl_groups = ["Group A", "Group B", "Group C"]
rl_data   = [randn(50), randn(50) .+ 2, randn(50) .- 1]
result_ridgeline = ridgeline(rl_groups, rl_data)
@test typeof(result_ridgeline) == EChart
# violin
vio_groups = vcat(fill("A", 50), fill("B", 50))
vio_values = vcat(randn(50), randn(50) .+ 2)
result_violin = violin(vio_groups, vio_values)
@test typeof(result_violin) == EChart
result_violin_single = violin(randn(50))
@test typeof(result_violin_single) == EChart
# nightingale
ng_labels = ["A", "B", "C", "D", "E"]
ng_values = [42.0, 32.0, 26.0, 18.0, 12.0]
result_nightingale = nightingale(ng_labels, ng_values)
@test typeof(result_nightingale) == EChart
result_nightingale_area = nightingale(ng_labels, ng_values, rose_type = "area")
@test typeof(result_nightingale_area) == EChart
@test_throws ArgumentError nightingale(ng_labels, ng_values, rose_type = "invalid")
# bullet
bl_labels = ["Revenue", "Profit", "Satisfaction"]
bl_actual = [75.0, 62.0, 81.0]
bl_target = [80.0, 70.0, 85.0]
bl_ranges = [60.0, 80.0, 100.0]
result_bullet = bullet(bl_labels, bl_actual, bl_target, bl_ranges)
@test typeof(result_bullet) == EChart
@test length(result_bullet.series) == 2  # actual bar + target scatter
@test_throws ArgumentError bullet(bl_labels, bl_actual, bl_target, [100.0, 60.0, 80.0])  # not sorted
@test_throws ArgumentError bullet(bl_labels, bl_actual, [80.0, 70.0], bl_ranges)  # wrong length target
# span_chart
sc_cats  = ["Jan", "Feb", "Mar", "Apr", "May"]
sc_lows  = [2.0, 3.0, 8.0, 14.0, 18.0]
sc_highs = [10.0, 12.0, 18.0, 22.0, 27.0]
result_span = spanchart(sc_cats, sc_lows, sc_highs)
@test typeof(result_span) == EChart
@test length(result_span.series) == 2  # spacer + visible span
@test result_span.series[1].itemStyle.color == "transparent"
@test_throws ArgumentError spanchart(sc_cats, sc_highs, sc_lows)  # lows > highs
@test_throws ArgumentError spanchart(sc_cats, sc_lows, [1.0, 2.0])  # wrong length
# arc_diagram
ad_nodes = ["Alice", "Bob", "Carol", "Dave", "Eve"]
ad_links = [["Alice","Bob"], ["Alice","Carol"], ["Bob","Dave"], ["Carol","Eve"]]
result_arc = arcdiagram(ad_nodes, ad_links)
@test typeof(result_arc) == EChart
ad_weights = [5.0, 3.0, 8.0, 2.0]
result_arc_w = arcdiagram(ad_nodes, ad_links, ad_weights)
@test typeof(result_arc_w) == EChart
@test_throws ArgumentError arcdiagram(ad_nodes, ad_links, [1.0, 2.0])  # wrong length

# polarbar
pb_cats = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
pb_vals = [120.0, 200.0, 150.0, 80.0, 70.0, 110.0, 130.0]
result_polarbar = polarbar(pb_cats, pb_vals)
@test typeof(result_polarbar) == EChart
@test result_polarbar.angleAxis._type == "category"
@test result_polarbar.radiusAxis !== nothing

result_polarbar_legend = polarbar(pb_cats, pb_vals, legend = true)
@test typeof(result_polarbar_legend) == EChart

pb_vals2 = hcat(pb_vals, 0.8 .* pb_vals)
result_polarbar_multi = polarbar(pb_cats, pb_vals2)
@test typeof(result_polarbar_multi) == EChart
@test length(result_polarbar_multi.series) == 2

result_polarbar_stack = polarbar(pb_cats, pb_vals2, stack = true)
@test typeof(result_polarbar_stack) == EChart
@test result_polarbar_stack.series[1].stack == "polarbar_stack"

pb_df = DataFrame(day = pb_cats, sales = pb_vals)
@test typeof(polarbar(pb_df, :day, :sales)) == EChart

pb_df2 = DataFrame(day = vcat(pb_cats, pb_cats),
                   sales = vcat(pb_vals, 0.8 .* pb_vals),
                   group = vcat(fill("A", 7), fill("B", 7)))
@test typeof(polarbar(pb_df2, :day, :sales, :group)) == EChart

# bump
bump_periods = ["2019", "2020", "2021", "2022", "2023"]
bump_vals = [82.0 75.0 60.0;
             74.0 88.0 65.0;
             68.0 95.0 72.0;
             91.0 70.0 80.0;
             85.0 78.0 92.0]
result_bump = bump(bump_periods, bump_vals)
@test typeof(result_bump) == EChart
@test result_bump.yAxis[1].inverse == true
@test result_bump.yAxis[1].min == 1
@test length(result_bump.series) == 3

result_bump_named = bump(bump_periods, bump_vals, names = ["A", "B", "C"])
@test typeof(result_bump_named) == EChart
@test result_bump_named.series[1].name == "A"

@test_throws ArgumentError bump(bump_periods, bump_vals, names = ["A", "B"])  # wrong length
@test_throws ArgumentError bump(["2019", "2020"], bump_vals)  # mismatched periods

bump_df = DataFrame(
    year  = repeat(2019:2023, inner = 3),
    brand = repeat(["Alpha", "Beta", "Gamma"], outer = 5),
    sales = [82.0, 75.0, 60.0, 74.0, 88.0, 65.0, 68.0, 95.0, 72.0, 91.0, 70.0, 80.0, 85.0, 78.0, 92.0],
)
result_bump_df = bump(bump_df, :year, :sales, :brand)
@test typeof(result_bump_df) == EChart

# lollipop
lp_cats = ["Mon", "Tue", "Wed", "Thu", "Fri"]
lp_vals = [120.0, 200.0, 150.0, 80.0, 110.0]
result_lollipop = lollipop(lp_cats, lp_vals)
@test typeof(result_lollipop) == EChart
@test length(result_lollipop.series) == 2  # stem bar + dot scatter
@test result_lollipop.series[1]._type == "bar"
@test result_lollipop.series[2]._type == "scatter"

lp_vals2 = hcat(lp_vals, 0.8 .* lp_vals)
result_lollipop_multi = lollipop(lp_cats, lp_vals2)
@test typeof(result_lollipop_multi) == EChart
@test length(result_lollipop_multi.series) == 4  # 2 stems + 2 dots

lp_df = DataFrame(day = lp_cats, sales = lp_vals)
@test typeof(lollipop(lp_df, :day, :sales)) == EChart

lp_df2 = DataFrame(day = vcat(lp_cats, lp_cats),
                   sales = vcat(lp_vals, 0.8 .* lp_vals),
                   group = vcat(fill("A", 5), fill("B", 5)))
result_lollipop_grp = lollipop(lp_df2, :day, :sales, :group)
@test typeof(result_lollipop_grp) == EChart

# slope
slope_labels = ["2015", "2023"]
slope_vals = [4.6  3.0;
              10.4  7.3;
              22.1 12.2]
result_slope = slope(slope_labels, slope_vals)
@test typeof(result_slope) == EChart
@test length(result_slope.series) == 3
@test result_slope.xAxis[1]._type == "category"

@test_throws ArgumentError slope(["2015", "2020", "2023"], slope_vals)  # too many labels
@test_throws ArgumentError slope(slope_labels, hcat(slope_vals, slope_vals[:,1]))  # 3 cols

slope_df = DataFrame(
    country   = ["Germany", "France", "Spain"],
    rate_2015 = [4.6, 10.4, 22.1],
    rate_2023 = [3.0,  7.3, 12.2],
)
result_slope_df = slope(slope_df, :country, :rate_2015, :rate_2023)
@test typeof(result_slope_df) == EChart
@test result_slope_df.series[1].name == "Germany"
