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

# marimekko
mm_cats = ["North", "South", "East", "West"]
mm_subs = ["Product A", "Product B", "Product C"]
mm_vals = [40.0 30.0 20.0 10.0;
           25.0 35.0 15.0 25.0;
           35.0 35.0 65.0 65.0]
result_marimekko = marimekko(mm_cats, mm_subs, mm_vals)
@test typeof(result_marimekko) == EChart
@test length(result_marimekko.series) == 3  # one CustomSeries per subcategory
@test result_marimekko.series[1]._type == "custom"
@test result_marimekko.series[1].name == "Product A"
@test result_marimekko.xAxis[1]._type == "value"

@test_throws ArgumentError marimekko(["A", "B"], mm_subs, mm_vals)  # wrong categories length
@test_throws ArgumentError marimekko(mm_cats, ["X"], mm_vals)        # wrong subcategories length
@test_throws ArgumentError marimekko(mm_cats, mm_subs, -1 .* mm_vals) # negative values

mm_df = DataFrame(
    region  = repeat(["North","South","East","West"], inner = 3),
    product = repeat(["A","B","C"], outer = 4),
    revenue = [40.0, 25.0, 35.0, 30.0, 35.0, 35.0, 20.0, 15.0, 65.0, 10.0, 25.0, 65.0],
)
result_marimekko_df = marimekko(mm_df, :region, :product, :revenue)
@test typeof(result_marimekko_df) == EChart
@test length(result_marimekko_df.series) == 3

# choropleth
regions = ["China", "United States", "Brazil", "Russia", "Australia"]
values  = [100.0, 200.0, 150.0, 80.0, 120.0]

result_choropleth = choropleth(regions, values)
@test typeof(result_choropleth) == EChart
@test result_choropleth.series[1]._type == "map"
@test result_choropleth.series[1].map == "world"
@test result_choropleth.visualMap !== nothing
@test result_choropleth.ec_mapname == "world"   # bundled world map auto-loaded
@test result_choropleth.ec_mapdata !== nothing

result_choropleth_roam = choropleth(regions, values; map = "world", roam = true)
@test typeof(result_choropleth_roam) == EChart
@test result_choropleth_roam.series[1].roam == true

# custom map via geojson keyword
fake_geojson = """{"type":"FeatureCollection","features":[]}"""
result_choropleth_geo = choropleth(regions, values; map = "custom", geojson = fake_geojson)
@test typeof(result_choropleth_geo) == EChart
@test result_choropleth_geo.ec_mapname == "custom"
@test result_choropleth_geo.ec_mapdata == fake_geojson

# table interface
using DataFrames
choro_df = DataFrame(region = regions, val = values)
result_choropleth_df = choropleth(choro_df, :region, :val)
@test typeof(result_choropleth_df) == EChart
@test result_choropleth_df.series[1].map == "world"

@test_throws ArgumentError choropleth("not a table", :region, :val)

# ecdfplot
e = ecdf(rand(100))
@test typeof(ecdfplot(e)) == EChart
@test ecdfplot(e).yAxis[1].min == 0
@test ecdfplot(e).yAxis[1].max == 1
@test ecdfplot(e).series[1].showSymbol == false
@test ecdfplot(e, showSymbol = true).series[1].showSymbol == true

# weighted ECDF
w = Weights(rand(100))
ew = ecdf(rand(100), weights = w)
@test typeof(ecdfplot(ew)) == EChart

# errorbar! — categorical x (bar chart)
eb_cats  = ["A", "B", "C", "D"]
eb_y     = [10.0, 15.0, 12.0, 8.0]
eb_lower = [ 8.0, 12.0,  9.0, 6.0]
eb_upper = [12.0, 18.0, 15.0, 10.0]

result_eb = bar(eb_cats, eb_y)
errorbar!(result_eb, eb_lower, eb_upper)
@test typeof(result_eb) == EChart
@test length(result_eb.series) == 2
@test result_eb.series[2]._type == "custom"
@test result_eb.series[2].encode == Dict("x" => 0, "y" => [1, 2])
@test result_eb.series[2].renderItem !== nothing
@test result_eb.series[2].silent == true

# errorbar! — returns the chart (supports chaining)
result_eb_chain = errorbar!(bar(eb_cats, eb_y), eb_lower, eb_upper)
@test typeof(result_eb_chain) == EChart

# errorbar! — kwargs: cap_frac, line_width, color
result_eb_kw = bar(eb_cats, eb_y)
errorbar!(result_eb_kw, eb_lower, eb_upper; line_width = 3, color = "#ff0000")
@test typeof(result_eb_kw) == EChart

# errorbar! — value x-axis (scatter chart)
eb_x_num = [1.0, 2.0, 3.0, 4.0]
result_eb_num = scatter(eb_x_num, eb_y)
errorbar!(result_eb_num, eb_lower, eb_upper)
@test typeof(result_eb_num) == EChart
@test result_eb_num.xAxis[1]._type == "value"
@test length(result_eb_num.series) == 2

# errorbar! — length mismatch raises error
@test_throws ArgumentError errorbar!(bar(eb_cats, eb_y), eb_lower, [1.0, 2.0])

# errorbar! — invalid series_index raises error
@test_throws ArgumentError errorbar!(bar(eb_cats, eb_y), eb_lower, eb_upper; series_index = 99)

# errorbar! — chart without x-axis raises error
@test_throws ArgumentError errorbar!(pie(eb_cats, eb_y), eb_lower, eb_upper)

# qqplot — Q-Q plot against a Distributions.jl distribution
using Distributions
qq_data = randn(100)
result_qq = qqplot(qq_data, Normal())
@test typeof(result_qq) == EChart
@test length(result_qq.series) == 2
@test result_qq.series[1]._type == "scatter"
@test result_qq.series[2]._type == "line"
@test result_qq.series[1].showSymbol == true
@test result_qq.series[2].showSymbol == false
@test result_qq.xAxis[1].name == "Normal quantiles"
@test result_qq.yAxis[1].name == "Sample quantiles"
@test length(result_qq.series[1].data) == 100

# qqplot — axis label reflects the distribution type
@test qqplot(qq_data, TDist(5)).xAxis[1].name == "TDist quantiles"

# qqplot — showSymbol kwarg
@test qqplot(qq_data, Normal(), showSymbol = false).series[1].showSymbol == false

# qqplot — too few elements raises error
@test_throws ArgumentError qqplot([1.0], Normal())

# qqplot — two-sample Q-Q plot (two-argument form)
qq_x = randn(80)
qq_y = randn(120)
result_qq2 = qqplot(qq_x, qq_y)
@test typeof(result_qq2) == EChart
@test length(result_qq2.series) == 2
@test result_qq2.series[1]._type == "scatter"
@test result_qq2.series[2]._type == "line"
@test result_qq2.xAxis[1].name == "x quantiles"
@test result_qq2.yAxis[1].name == "y quantiles"
# smaller sample size determines number of quantile points
@test length(result_qq2.series[1].data) == 80

# qqplot — equal-size two-sample
result_qq2eq = qqplot(randn(50), randn(50))
@test length(result_qq2eq.series[1].data) == 50

# qqplot — two-sample too few elements raises error
@test_throws ArgumentError qqplot([1.0], randn(50))
@test_throws ArgumentError qqplot(randn(50), [1.0])

# jointplot — basic
using Random
Random.seed!(1)
jp_x = randn(200)
jp_y = 0.6 .* jp_x .+ 0.8 .* randn(200)
result_jp = jointplot(jp_x, jp_y)
@test typeof(result_jp) == EChart
@test result_jp.ec_charttype == "jointplot"
@test length(result_jp.series) == 3
@test result_jp.series[1]._type == "scatter"
@test result_jp.series[2]._type == "line"   # top histogram
@test result_jp.series[3]._type == "line"   # right histogram
@test length(result_jp.grid) == 3
@test length(result_jp.xAxis) == 3
@test length(result_jp.yAxis) == 3
@test result_jp.ec_height == 600

# jointplot — scatter axis bounds are rounded to 4 significant figures
_sigfig(v) = round(v; sigdigits = 4)
@test result_jp.xAxis[1].min == string(_sigfig(minimum(jp_x)))
@test result_jp.xAxis[1].max == string(_sigfig(maximum(jp_x)))
@test result_jp.yAxis[1].min == string(_sigfig(minimum(jp_y)))
@test result_jp.yAxis[1].max == string(_sigfig(maximum(jp_y)))

# jointplot — top histogram x-range = scatter x-range
@test result_jp.xAxis[2].min == result_jp.xAxis[1].min
@test result_jp.xAxis[2].max == result_jp.xAxis[1].max

# jointplot — right histogram y-range = scatter y-range
@test result_jp.yAxis[3].min == result_jp.yAxis[1].min
@test result_jp.yAxis[3].max == result_jp.yAxis[1].max

# jointplot — custom nbins
result_jp_bins = jointplot(jp_x, jp_y; nbins = 10)
@test typeof(result_jp_bins) == EChart

# jointplot — table method
using DataFrames
jp_df = DataFrame(a = jp_x, b = jp_y)
result_jp_df = jointplot(jp_df, :a, :b)
@test typeof(result_jp_df) == EChart
@test result_jp_df.xAxis[1].name == "a"
@test result_jp_df.yAxis[1].name == "b"

# jointplot — length mismatch raises error
@test_throws ArgumentError jointplot(jp_x, jp_y[1:end-1])

# boxenplot — single vector
bp_data = randn(200)
result_bp = boxenplot(bp_data)
@test typeof(result_bp) == EChart
@test result_bp.ec_charttype == "boxenplot"
@test result_bp.xAxis[1]._type == "value"
@test result_bp.yAxis[1]._type == "value"
# must have at least one box series + median + (possibly outliers)
@test length(result_bp.series) >= 2

# boxenplot — multiple groups
bp_groups = [randn(100), randn(100) .+ 2, randn(100) .+ 4]
result_bp_multi = boxenplot(bp_groups; names = ["A", "B", "C"])
@test typeof(result_bp_multi) == EChart
@test result_bp_multi.xAxis[1].max == 4   # n_cats + 1

# boxenplot — mixed series types (CustomSeries + XYSeries)
@test any(s isa CustomSeries for s in result_bp_multi.series)

# boxenplot — table methods
bp_df = DataFrame(
    val = vcat(randn(80), randn(80) .+ 2),
    grp = vcat(fill("X", 80), fill("Y", 80)),
)
@test typeof(boxenplot(bp_df, :val)) == EChart
@test typeof(boxenplot(bp_df, :val, :grp)) == EChart
@test boxenplot(bp_df, :val, :grp).xAxis[1].name == "grp"

# boxenplot — too few observations raises error
@test_throws ArgumentError boxenplot([1.0, 2.0, 3.0])

# horizonchart — basic numeric x-axis
hc_x = collect(1:100)
hc_y = sin.(range(0, 4π, length = 100)) .* 5 .+ 3.0
result_hc = horizonchart(hc_x, hc_y)
@test typeof(result_hc) == EChart
@test result_hc.ec_charttype == "horizonchart"
@test length(result_hc.series) == 3      # default nbands = 3
@test result_hc.yAxis[1].min == 0
@test result_hc.xAxis[1]._type == "value"
@test all(s._type == "line" for s in result_hc.series)

# horizonchart — string x-axis becomes category
hc_cats = string.(1:50)
hc_y2   = abs.(randn(50)) .* 4
result_hc_cat = horizonchart(hc_cats, hc_y2; nbands = 2)
@test result_hc_cat.xAxis[1]._type == "category"
@test length(result_hc_cat.series) == 2

# horizonchart — negative values shift without error
result_hc_neg = horizonchart(hc_x, hc_y .- 10.0)
@test typeof(result_hc_neg) == EChart

# horizonchart — custom colors
result_hc_col = horizonchart(hc_x, hc_y; nbands = 2, colors = ["#ffffcc", "#d9f0a3"])
@test typeof(result_hc_col) == EChart

# horizonchart — color length mismatch raises error
@test_throws ArgumentError horizonchart(hc_x, hc_y; nbands = 3, colors = ["#aaa", "#bbb"])

# horizonchart — table method
hc_df = DataFrame(t = hc_x, v = hc_y)
result_hc_df = horizonchart(hc_df, :t, :v)
@test typeof(result_hc_df) == EChart
@test result_hc_df.xAxis[1].name == "t"
@test result_hc_df.yAxis[1].name == "v"
