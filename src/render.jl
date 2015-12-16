import Base.print
print(x::EChart) = print(JSON.json(tojs(x)))

# Open a URL in a browser
function openurl(url::AbstractString)
    @osx_only     run(`open $url`)
    @windows_only run(`cmd /c start $url`)
    @linux_only   run(`xdg-open $url`)
end

#Jupyter Notebook display
import Base.writemime

function writemime(io::IO, ::MIME"text/html", v::EChart)

    divid = "Echart" * randstring(3)
    option = JSON.json(tojs(v))

        display("text/html", """

                <!DOCTYPE html>
                <head>
                    <meta charset=\"utf-8\">
                </head>
                <body>
                    <!-- Prepare a Dom with size (width and height) for ECharts -->
                    <div id=\"$divid\" style=\"height:400px\"></div>
                    <!-- ECharts import -->
                    <script src=\"http://echarts.baidu.com/build/dist/echarts-all.js\"></script>
                    <script type=\"text/javascript\">
                        // Initialize after dom ready
                        var myChart = echarts.init(document.getElementById(\"$divid\"));

                        // Load data into the ECharts instance
                        myChart.setOption($option);
                    </script>
                </body>


              """)
end

#ECharts scaffold for REPL: works!
function writehtml(io::IO, v::EChart; title="ECharts")

    divid = "Echart" * randstring(3)
    option = JSON.json(tojs(v))

    println(io,
                "
                <!DOCTYPE html>
                <head>
                    <meta charset=\"utf-8\">
                    <title>$title</title>
                </head>
                <body>
                    <!-- Prepare a Dom with size (width and height) for ECharts -->
                    <div id=\"$divid\" style=\"height:400px\"></div>
                    <!-- ECharts import -->
                    <script src=\"http://echarts.baidu.com/build/dist/echarts-all.js\"></script>
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

function Base.show(io::IO, v::EChart)

    if displayable("text/html")
        v
    else
        # create a temporary file
        tmppath = string(tempname(), ".echart.html")
        io = open(tmppath, "w")
        writehtml(io, v)
        close(io)

        # Open the browser
        openurl(tmppath)

    end

    return
end
