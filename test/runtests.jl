using ECharts
using Base.Test

function ectest(x)
    @test typeof(x) == EChart
end

# Because tests rendered by JavaScript, tests somewhat incomplete in testing only valid return type
# No indication that chart is one actually intended :(
# Todo: xAxis/yAxis tests
println("Test 1: Area")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(area(x, y))
ectest(legend!(area(x, y)))
ectest(area(x, y, horizontal = true))
ectest(area(x, hcat(y, 3.7 .* y)))

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
y2 = 3.7 .* y
ectest(area(x, hcat(y, y2), stack = true))
ectest(area(x, hcat(y, y2), step = "middle", stack = true))


println("Test 2: Bar")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(bar(x, y))
ectest(bar(x, y, color = ["green"]))
ectest(bar(x, y, horizontal = true, color = ["green"]))
ectest(bar(x, hcat(0.95 .* y, 1.25 .* y, y)))

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(bar(x, hcat(0.95 .* y, 1.25 .* y, y), mark = "bar", color = ["red", "gray", "blue"], stack = true))

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(bar(x, hcat(0.95 .* y, 1.25 .* y, y), mark = "bar", color = ["red", "gray", "blue"], stack = [1,1,2]))

x = 1:5
y = [2900, -1200, -300, -200, -900]
ectest(waterfall(x, y))


println("Test 3: Gauge")
ectest(gauge(27.64))


println("Test 4: Line")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(line(x, y))
ectest(legend!(line(x, y)))
ectest(line(x, y, step = "end"))
ectest(line(x, hcat(y, 0.6 .* y)))
ectest(line(x, hcat(y, 0.6 .* y), mark = ["bar", "line"]))


println("Test 5: Pie")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(pie(x, y))

values = [335, 310, 234, 135, 1548]
names = ["direct interview", "email marketing", "advertising alliance", "video ads", "search engine"]
explode = [true, false, false, false, false]
ectest(pie(names, values, selected = explode))

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(donut(x, y))
ectest(legend!(donut(x, y)))

values = [335, 310, 234, 135, 1548]
names = ["direct interview", "email marketing", "advertising alliance", "video ads", "search engine"]
ectest(pie(names, values, roseType = "angle"))
ectest(donut(names, values, roseType = "radius"))


println("Test 6: Scatter")
ectest(scatter(1:30, rand(30)))
ectest(scatter(1:30, hcat(rand(30), rand(30))))


println("Test 7: title!")
x = 1:20
y = 3 .+ 5x
a = bar(x, y)
ectest(title!(a, text = "Bar Plot Title", subtext = "Secondary Title"))


println("Test 8: toolbox!")
a = bar(x, y)
title!(a, text = "Bar Plot Title", subtext = "Secondary Title")
ectest(toolbox!(a, chartTypes = ["bar", "line"]))


println("Test 9: Funnel")
v = [100,60,80,70,50]
n = ["A", "B", "C", "D", "E"]
fn = funnel(n, v)
ectest(fn)
ectest(legend!(fn))
ectest(colorscheme!(fn,  palette = ("acw", "VitaminC"), reversePalette = true))


println("Test 10: Radar")
names = ["sales", "administration", "information technology", "customer support", "development", "marketing"]
max = [6500, 16000, 30000, 38000, 52000, 25000]
values = [4300, 10000, 28000, 35000, 50000, 19000]
ectest(radar(names, values, max))

values2 = 0.7 .* values
r = radar(names, hcat(values, values2), max)
ectest(r)
ectest(radar(names, hcat(values, values2), max, fill = [false, true]))
ectest(colorscheme!(r, palette = ("acw", "JapaneseGarden")))


println("Test 11: polar")
t = 0:360
angle = [a / 180 * pi for a in t]
radius = [(sin(2t) * cos(2t)) for t in angle]
ectest(polar(t, radius, color = ["pink"]))


println("Test 12: box")
data = [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960]
b = box(data)
ectest(b)

data = [
    [850, 740, 900, 1070, 930, 850, 950, 980, 980, 880, 1000, 980, 930, 650, 760, 810, 1000, 1000, 960, 960],
    [960, 940, 960, 940, 880, 800, 850, 880, 900, 840, 830, 790, 810, 880, 880, 830, 800, 790, 760, 800],
    [880, 880, 880, 860, 720, 720, 620, 860, 970, 950, 880, 910, 850, 870, 840, 840, 850, 840, 840, 840],
    [890, 810, 810, 820, 800, 770, 760, 740, 750, 760, 910, 920, 890, 860, 880, 720, 840, 850, 850, 780],
    [890, 840, 780, 810, 760, 810, 790, 810, 820, 850, 870, 870, 810, 740, 810, 940, 950, 800, 810, 870]
]
b = box(data)
ectest(b)


println("Test 13: candlestick")
#open/close/low/high
dt = ["2016/08/26", "2016/08/29", "2016/08/30", "2016/08/31", "2016/09/01", "2016/09/02", "2016/09/06", "2016/09/07",
"2016/09/08", "2016/09/09", "2016/09/12", "2016/09/13", "2016/09/14", "2016/09/15", "2016/09/16", "2016/09/19",
"2016/09/20", "2016/09/21", "2016/09/22", "2016/09/23", "2016/09/26"]

close_ = [12.3800, 12.4700, 12.5500, 12.6000, 12.4400, 12.5000, 12.6700, 12.7000, 12.7300, 12.3800, 12.7000, 12.3800,
12.1400, 12.1100, 12.1100, 12.1100, 12.0000, 12.0900, 12.1800, 12.1700, 12.0100]

open_ = [12.4700, 12.3800, 12.4600, 12.4800, 12.6600, 12.5300, 12.4900, 12.6200, 12.5000, 12.6100, 12.3200, 12.5300,
12.1800, 12.1400, 12.0500, 12.1200, 12.0900, 12.0800, 12.1700, 12.1200, 12.1200]

high_ = [12.5500, 12.5000, 12.5600, 12.6100, 12.7200, 12.5700, 12.6700, 12.7500, 12.7500, 12.6850, 12.7700, 12.6800,
12.3100, 12.1800, 12.1300, 12.3300, 12.1900, 12.1100, 12.2900, 12.2200, 12.1200]

low_ = [12.3400, 12.3800, 12.4300, 12.4800, 12.3500, 12.4600, 12.4300, 12.6200, 12.5000, 12.3800, 12.2800, 12.3300,
12.1100, 12.0600, 12.0100, 12.0586, 11.9600, 12.0100, 12.1600, 12.1200, 12.0000]

ectest(candlestick(dt, open_, close_, low_, high_))

println("Test 14: sankey")
name = ["Agricultural waste", "Bio-conversion", "Liquid", "Losses", "Solid", "Gas", "Biofuel imports",
    "Biomass imports", "Coal imports", "Coal"]

source = [0, 1, 1, 1, 1, 6, 7, 8, 10]
target = [1, 2, 3, 4, 5, 2, 4, 9, 9]
value = [124.729, 0.597, 26.862, 280.322, 81.144, 35, 35, 11.606, 63.965]

ectest(sankey(name, source, target, value))


#println("Test 14: xAxis!/yAxis!")
