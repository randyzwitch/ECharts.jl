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
s_df = CSV.read(joinpath(dirname(@__FILE__), "..", "exampledata/streamdata.csv"), types=[String, Float64, String])
sg = streamgraph(s_df.date, s_df.value, s_df.key, legend = true)
@test typeof(sg) == EChart

#19: bubble
sgrp = bubble(mtcars, :MPG, :HP, :Disp)
@test typeof(sgrp) == EChart

sgrp2 = bubble(mtcars.MPG, mtcars.HP, mtcars.Disp)
@test typeof(sgrp2) == EChart

sgrp3 = bubble(mtcars, :MPG, :HP, :Disp, :Cyl)
@test typeof(sgrp3) == EChart

#19: corrplot
cplot = corrplot(mtcars)
@test typeof(cplot) == EChart

df_num = mtcars[!, [x <: Union{Number, Missing} for x in eltypes(mtcars)]]
c = cor(convert(Matrix, df_num))
ccc = corrplot(c)
@test typeof(ccc) == EChart
