@test ECharts.json("hello") == "\"hello\""
@test ECharts.makevalidjson(:hello) == "hello"
@test ECharts.makevalidjson([:hello, :world]) == ["hello", "world"]
@test ECharts.makevalidjson(missing) == "-"
@test ECharts.makevalidjson(4//7) == 4//7

# echart() / EChartRaw
let valid_json = """{"xAxis":{"type":"category","data":["Mon","Tue"]},"yAxis":{"type":"value"},"series":[{"data":[820,932],"type":"bar"}]}"""
    ec = echart(valid_json)
    @test ec isa EChartRaw
    @test ec.ec_width == 800
    @test ec.ec_height == 450
    @test ec.ec_renderer == "canvas"
    @test ec.option == valid_json

    # keyword overrides
    ec2 = echart(valid_json; width=1200, height=600, renderer="svg")
    @test ec2.ec_width == 1200
    @test ec2.ec_height == 600
    @test ec2.ec_renderer == "svg"

    # invalid JSON throws
    @test_throws Exception echart("{not valid json}")

    # HTML output contains the option and chart div
    html = repr(MIME"text/html"(), ec)
    @test occursin(valid_json, html)
    @test occursin("echarts.init", html)

    # @echart macro produces the same result as echart()
    ec3 = @echart valid_json
    @test ec3 isa EChartRaw
    @test ec3.option == valid_json

    ec4 = @echart(valid_json, width=1200, height=600)
    @test ec4.ec_width == 1200
    @test ec4.ec_height == 600
end
