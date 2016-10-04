import Base.print
import Base.show
print(x::EChart) = print(JSON.json(tojs(x)))

# Open a URL in a browser
function openurl(url::String)
    @static if is_apple() run(`open $url`) end
    @static if is_windows() run(`cmd /c start $url`) end
    @static if is_linux() run(`xdg-open $url`) end
end

#Jupyter Notebook display
function show(io::IO, ::MIME"text/html", ec::EChart)

    divid = "Echart" * randstring(3)
    option = JSON.json(tojs(ec))
    width = ec.ec_width
    height = ec.ec_height

        display("text/html", """

              <body>
                <div id=\"$divid\" style=\"height:$(height)px;width:$(width)px;\"></div>
              </body>

                <script type=\"text/javascript\">

                    require.config({
                      paths: {
                        echarts: \"https://randyzwitch.github.io/ECharts.jl/javascripts/echarts.min\",
                      }
                    });

                    require(["echarts"], function(echarts){

                        window.echarts = echarts

                        // Initialize after dom ready
                        var myChart = echarts.init(document.getElementById(\"$divid\"));

                        // Load data into the ECharts instance
                        myChart.setOption($option);

                    }); //echarts require end

                </script>

              """)
end

#ECharts scaffold for REPL: works!
function writehtml(io::IO, ec::EChart; title="ECharts")

    divid = "Echart" * randstring(3)
    option = JSON.json(tojs(ec))
    width = ec.ec_width
    height = ec.ec_height

    println(io,
                "
                <!DOCTYPE html>
                <head>
                    <meta charset=\"utf-8\">
                    <title>$title</title>
                </head>
                <body>
                    <!-- Prepare a Dom with size (width and height) for ECharts -->
                    <div id=\"$divid\" style=\"height:$(height)px;width:$(width)px;\"></div>
                    <!-- ECharts import -->
                    <script>$(readstring(joinpath(dirname(@__FILE__), "..", "javascript", "echarts.min.js")))</script>

                    <script type=\"text/javascript\">
                        // Initialize after dom ready
                        var myChart = echarts.init(document.getElementById(\"$divid\"));

                        // Load data into the ECharts instance
                        myChart.setOption($option);
                    </script>
                </body>
                "
            )
end

function show(io::IO, ec::EChart)

    if displayable("text/html")
        ec
    else
        # create a temporary file
        tmppath = string(tempname(), ".echart.html")
        io = open(tmppath, "w")
        writehtml(io, ec)
        close(io)

        # Open the browser
        openurl(tmppath)

    end

    return
end
