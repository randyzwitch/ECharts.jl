module ECharts

	using JSON

	export tojs

	export EChart

	#Import helper code
	include("jstypes.jl")

	include("primitives/echart.jl")


	include("render.jl")




end # module
