#### Chart option functions

#1: colorscheme!
names = ["sales", "administration", "information technology", "customer support", "development",
"marketing"]
max = [6500, 16000, 30000, 38000, 52000, 25000]
values = [4300, 10000, 28000, 35000, 50000, 19000]
values2 = 0.7 .* values
r = radar(names, hcat(values, values2), max, fill = [false, true])
colorscheme!(r, ("acw", "JapaneseGarden"))
@test typeof(r) == EChart

v = [100,60,80,70,50]
n = ["A", "B", "C", "D", "E"]
fn = funnel(n, v)
colorscheme!(fn,  ("acw", "VitaminC"), reversePalette = true)
colorscheme!(fn, "purple")
colorscheme!(fn, ["purple", "yellow"])
@test typeof(fn) == EChart

#2: flip!
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bm = bar(x, hcat(0.95 .* y, 1.25 .* y, y), color = ["red", "gray", "blue"], stack = true)
flip!(bm)
@test typeof(bm) == EChart
flip!(bm, rotatedims = true)
@test typeof(bm) == EChart

#3: lineargradient
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y, color = lineargradient("purple", "cyan"))
smooth!(ar)
xaxis!(ar, name = "Day of Week")
yaxis!(ar, name = "Daily High Temperature °C")
@test typeof(ar) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y, color = lineargradient("purple", "cyan", x0 = 0.4, y0 = 0.9, x2 = .5, y2 = 1))
smooth!(ar)
@test typeof(ar) == EChart

#4: radialgradient
pp = pie(["all"], [1], color = radialgradient("red", "purple"))
@test typeof(pp) == EChart

pp2 = pie(["all"], [1], color = radialgradient("red", "purple", x = 0.25, y = 0.3, r = 0.4))
@test typeof(pp2) == EChart

#5: seriesnames!
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
bm = bar(x, hcat(0.95 .* y, 1.25 .* y,y))
seriesnames!(bm, ["Pink Series", "Blue Series", "Tan Series"])
@test typeof(bm) == EChart

#6: slider!
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
slider!(c)
@test typeof(c) == EChart

#7: smooth!
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ar = area(x, y, color = lineargradient("purple", "cyan"))
smooth!(ar)
smooth!(ar, 1)
smooth!(ar, [1])
xaxis!(ar, name = "Day of Week")
yaxis!(ar, name = "Daily High Temperature °C")
@test typeof(ar) == EChart

#8: text!
sgrp = scatter(mtcars, :MPG, :HP, :Cyl)
title!(sgrp, text = "Horsepower vs. Miles Per Gallon")
text!(sgrp, subtext = "Source: mtcars dataset from R", left = "0%", bottom = "0%")
@test typeof(sgrp) == EChart

text!(sgrp, 2, sublink = "https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html")
@test typeof(sgrp) == EChart

#9: title!
x = 1:20
y = 3 .+ 5x
a = bar(x, y)
title!(a, text = "Bar Plot Title", subtext = "Secondary Title")
@test typeof(a) == EChart

#10: toolbox!
x = 1:20
y = 3 .+ 5x
a = bar(x, y)
toolbox!(a, chartTypes = ["bar", "line"])
@test typeof(a) == EChart

#11: xarea!/yarea!
sgrp = scatter(mtcars, :MPG, :HP, :Cyl)
xarea!(sgrp, 28, 33)
xarea!(sgrp, 10, 14)
@test typeof(sgrp) == EChart

yarea!(sgrp, 100, 150, series = 2)
@test typeof(sgrp) == EChart

#12: xaxis!/yaxis!
x = 1:10
y = [2^x for x in x]
l = line(x, y)
yaxis!(l, _type = "log", scale = true)
@test typeof(l) == EChart

x = 1:10
y = [2^x for x in x]
l = line(x, y)
yaxis!(l, _type = "log", scale = true, formatter = "{value} kg")
@test typeof(l) == EChart

#13: xgridlines!/ygridlines!
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
l = line(x, y)
ygridlines!(l, show = false)
@test typeof(l) == EChart

#14: xline!/yline!
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
y2 = 3.7 .* y
as = area(x, hcat(y, y2))
yline!(as, "average")
yline!(as, 40.362)
xline!(as, "Tuesday")
@test typeof(as) == EChart

#15: radial!
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
b = bar(x, y)
radial!(b)
@test typeof(b) == EChart

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
b = bar(x, hcat(0.95 .* y, 1.25 .* y,y), stack = [1,1,2])
radial!(b)
@test typeof(b) == EChart

#16: jitter!
x = rand(1:10, 500)
y = rand(0:10, 500) + x
a = scatter(x, y)
jitter!(a)
@test typeof(a) == EChart

jitter!(a, pctxrange = 0, pctyrange = 0.05)
@test typeof(a) == EChart

jitter!(a, pctxrange = 0.1, pctyrange = 0.05)
@test typeof(a) == EChart

jitter!(a, 1, pctxrange = 0.1, pctyrange = 0.05)
@test typeof(a) == EChart

sm = scatter(1:30, hcat(rand(30), rand(30)))
jitter!(sm)
@test typeof(sm) == EChart

#17: theme!
@test typeof(theme!(sm, ECharts.vintage)) == EChart

@test typeof(Theme(JSON.parsefile(joinpath(dirname(@__FILE__), "..", "docs/js/themes/chalk.json")))) == Theme
