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

println("Test 2: Bar")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(bar(x, y))
ectest(bar(x, y, color = ["green"]))
ectest(bar(x, hcat(0.95 .* y, 1.25 .* y, y)))

println("Test 3: Gauge")
ectest(gauge(27.64))

println("Test 4: Line")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(line(x, y))
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
#println("Test 11: xAxis!/yAxis!")
