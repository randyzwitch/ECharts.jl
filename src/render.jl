print(x::EChart) = print(json(makevalidjson(x)))

#Jupyter Notebook display
#Refactor this so it's not so repetitive
#require.config is due to Jupyter Notebook not wanting to load js
function show(io::IO, ::MIME"text/html", ec::EChart)

    divid = "Echart" * randstring(3)
    option = json(makevalidjson(ec))
    width = ec.ec_width
    height = ec.ec_height
    theme = json(makevalidjson(ec.theme))

        display("text/html", """

              <body>
                <div id=\"$divid\" style=\"height:$(height)px;width:$(width)px;\"></div>
              </body>

                <script type=\"text/javascript\">

                    require.config({
                      paths: {
                        echarts: \"https://randyzwitch.github.io/ECharts.jl/javascripts/echarts-3.5.3\"
                      }
                    });

                    require(["echarts"], function(echarts){

                        window.echarts = echarts

                        var obj = JSON.parse('$theme');

                        // Initialize after dom ready
                        var myChart = echarts.init(document.getElementById(\"$divid\"), obj);

                        // Load data into the ECharts instance
                        myChart.setOption($option);

                    }); //echarts require end

                </script>

              """)
end

#Register what a EChart is
media(EChart, Media.Graphical)

#Define how to render a VegaVisualization and where
function Media.render(pane::Atom.PlotPane, ec::EChart)

    divid = "Echart" * randstring(3)
    option = json(makevalidjson(ec))
    theme = json(makevalidjson(ec.theme))

    #Make new window
    w = Juno.Atom.blinkplot()

    #Get window size
    width, height = Juno.plotsize()

    #Load JavaScript library via Blink API
    load!(w, "https://randyzwitch.github.io/ECharts.jl/javascripts/echarts-3.5.3.js")

        a =
        """<div id="$divid" style="height:$(height)px;width:$(width)px;"></div>
        <script type="text/javascript">

            var obj = JSON.parse('$theme');

            // Initialize after dom ready
            var myChart = echarts.init(document.getElementById("$divid"), obj);

            // Load data into the ECharts instance
            myChart.setOption($option);
        </script>
        """

    body!(w, a)

end
