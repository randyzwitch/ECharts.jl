@test ECharts.json("hello") == "\"hello\""
@test ECharts.makevalidjson(:hello) == "hello"
@test ECharts.makevalidjson([:hello, :world]) == ["hello", "world"]
@test ECharts.makevalidjson(missing) == "-"
@test ECharts.makevalidjson(4//7) == 4//7
