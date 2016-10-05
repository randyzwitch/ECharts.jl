import Base.print
import Base.show
print(x::EChart) = print(JSON.json(tojs(x)))

#Jupyter Notebook display
#Refactor this so it's not so repetitive
#require.config is due to Jupyter Notebook not wanting to load js
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

function blink_show(ec::EChart)
    w = Window()
    echarts = joinpath(dirname(@__FILE__), "..", "javascript", "echarts.min.js")
    for file in (echarts,)
        load!(w, file)
    end

    divid = "Echart" * randstring(3)
    option = JSON.json(tojs(ec))
    width = ec.ec_width
    height = ec.ec_height
    body =

        """
        <body>
            <!-- Prepare a Dom with size (width and height) for ECharts -->
            <div id=\"$divid\" style=\"height:$(height)px;width:$(width)px;\"></div>
        </body>

            <script type=\"text/javascript\">
                // Initialize after dom ready
               var myChart = echarts.init(document.getElementById(\"$divid\"));

                // Load data into the ECharts instance
                myChart.setOption($option);
            </script>

        """

    body!(w, body)
end

# See if it can render in Jupyter Notebook, if not, Blink
show(io::IO, ec::EChart) = displayable("text/html")? ec: blink_show(ec)
