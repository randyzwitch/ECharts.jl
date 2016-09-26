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
ectest(bar(x, hcat(0.95 .* y, 1.25 .* y, y)))

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(bar(x, hcat(0.95 .* y, 1.25 .* y,y), mark = "bar", color = ["red", "gray", "blue"], stack = true))

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(bar(x, hcat(0.95 .* y, 1.25 .* y,y), mark = "bar", color = ["red", "gray", "blue"], stack = [1,1,2]))


println("Test 3: Gauge")
ectest(gauge(27.64))


println("Test 4: Line")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(line(x, y))
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

#println("Test 13: xAxis!/yAxis!")
