print(x::EChart) = print(json(makevalidjson(x)))

#Jupyter Notebook display
#Refactor this so it's not so repetitive
#require.config is due to Jupyter Notebook not wanting to load js
function show(io::IO, ::MIME"text/html", ec::EChart)

    divid = "Echart" * randstring(3)
    option = json(makevalidjson(ec))
    width = ec.ec_width
    height = ec.ec_height
    renderer = ec.ec_renderer
    theme = json(makevalidjson(ec.theme))

        display("text/html", """

                <figure id=\"$divid\" style=\"height:$(height)px;width:$(width)px;\"></figure>

                <script type=\"text/javascript\">

                    require.config({
                      paths: {
                        echarts: \"https://randyzwitch.github.io/ECharts.jl/js/echarts-4.0.2\"
                      }
                    });

                    require(["echarts"], function(echarts){

                        window.echarts = echarts

                        var obj = JSON.parse('$theme');

                        // Initialize after dom ready
                        var myChart = echarts.init(document.getElementById(\"$divid\"), obj, {renderer: '$renderer'});

                        // Load data into the ECharts instance
                        myChart.setOption($option);

                        //Allow chart to resize when window does
                        window.onresize = function() {
                          myChart.resize();
                        };

                        //Make div resizeable within notebook
                        //jQuery( function() {
                        //    jQuery( '#' + "$divid").resizable();
                        //} );

                    }); //echarts require end

                </script>

              """)
end

#Register what a EChart is
media(EChart, Media.Graphical)

#Define how to render a EChart and where
function Media.render(pane::Atom.PlotPane, ec::EChart)

    divid = "Echart" * randstring(3)
    option = json(makevalidjson(ec))
    theme = json(makevalidjson(ec.theme))

    renderer = ec.ec_renderer

    #Make new window
    if Juno.isactive()
        w = Juno.Atom.blinkplot()
    else
        w = Blink.Window()
    end

    #Block until the window created
    wait(w.content)

    #Load JavaScript library via Blink API
    load!(w, joinpath(dirname(@__FILE__), "..", "docs/js/echarts-4.0.2.js"))

    a =
    """<figure id="$divid" style="height:95%;width:95%;"></figure>
    <script type="text/javascript">

        var obj = JSON.parse('$theme');

        // Initialize after dom ready
        var myChart = echarts.init(document.getElementById("$divid"), obj, {renderer: '$renderer'});

        // Load data into the ECharts instance
        myChart.setOption($option);

        //Allow chart to resize when window does
        window.onresize = function() {
          myChart.resize();
        };

    </script>
    """

    body!(w, a)

end
