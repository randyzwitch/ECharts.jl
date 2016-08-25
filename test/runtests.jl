using ECharts
using Base.Test

function ectest(x)
    @test typeof(x) == EChart
end

# Because tests rendered by JavaScript, tests somewhat incomplete in testing only valid return type
# No indication that chart is one actually intended :(
println("Test 1: Area Chart")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(areaplot(x, y))
ectest(areaplot(x, hcat(y, 3.7 .* y)))

println("Test 2: Bar Chart")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(barplot(x, y))
ectest(barplot(x, hcat(0.95 .* y, 1.25 .* y,y)))

println("Test 3: Gauge")
ectest(gauge(27.64))

println("Test 4: Line Chart")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(lineplot(x, y))
ectest(lineplot(x, hcat(y, 0.6 .* y)))
ectest(lineplot(x, hcat(y, 0.6 .* y), mark = ["bar", "line"]))

println("Test 5: Pie Chart")
x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(piechart(x, y))

values = [335, 310, 234, 135, 1548]
names = ["direct interview", "email marketing", "advertising alliance", "video ads", "search engine"]
explode = [true, false, false, false, false]
ectest(piechart(names, values, selected = explode))

x = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
y = [11, 11, 15, 13, 12, 13, 10]
ectest(donutchart(x, y))

values = [335, 310, 234, 135, 1548]
names = ["direct interview", "email marketing", "advertising alliance", "video ads", "search engine"]
ectest(piechart(names, values, roseType = "angle"))
ectest(donutchart(names, values, roseType = "radius"))

println("Test 6: Scatterplot")
ectest(scatterplot(1:30, rand(30)))
ectest(scatterplot(1:30, hcat(rand(30), rand(30))))

println("Test 7: title!")
x = 1:20
y = 3 .+ 5x
a = barplot(x, y)
ectest(title!(a, text = "Bar Plot Title", subtext = "Secondary Title"))

println("Test 8: toolbox!")
a = barplot(x, y)
title!(a, text = "Bar Plot Title", subtext = "Secondary Title")
ectest(toolbox!(a, chartTypes = ["bar", "line"]))

println("Test 9: Funnel")
v = [100,60,80,70,50]
n = ["A", "B", "C", "D", "E"]
ectest(funnel(n, v))

println("Test 10: Radar")
names = ["sales", "administration", "information technology", "customer support", "development", "marketing"]
max = [6500, 16000, 30000, 38000, 52000, 25000]
values = [4300, 10000, 28000, 35000, 50000, 19000]
ectest(radarchart(names, values, max))

values2 = 0.7 .* values
ectest(radarchart(names, hcat(values, values2), max))
