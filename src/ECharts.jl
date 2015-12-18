module ECharts

	using JSON

	export print

	export EChart
	export Tooltip, Legend, Toolbox, Axis, Series, Title, Grid, DataZoom, Timeline, DataRange, RoamController, Polar

	#Import helper code
	include("jstypes.jl")

	#Primitives - these are in order!
	include("primitives/tooltip.jl")
	include("primitives/legend.jl")
	include("primitives/toolbox.jl")
	include("primitives/axis.jl")
	include("primitives/series.jl")
	include("primitives/title.jl")
	include("primitives/grid.jl")
	include("primitives/datazoom.jl")
	include("primitives/timeline.jl")
	include("primitives/datarange.jl")
	include("primitives/roamcontroller.jl")
	include("primitives/polar.jl")

	include("primitives/echart.jl")


	include("render.jl")




end # module
