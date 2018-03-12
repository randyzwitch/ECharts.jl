function jitter!(ec::EChart, series::Int; pctxrange::Real = 0.05, pctyrange::Real = 0)

    #http://blogs.sas.com/content/iml/2011/07/05/jittering-to-prevent-overplotting-in-statistical-graphics.html
    #range method supposed to be from Graphical Methods for Data Analysis
    #Chambers, Cleveland, Kleiner, and Tukey (1983)

    #Calculate range, then use random pct of range
    _y = []
    _x = []

    for datum in ec.series[series].data
        push!(_x, datum[1])
        push!(_y, datum[2])
    end

    xrange = maximum(_x) - minimum(_x)
    yrange = maximum(_y) - minimum(_y)

    #To avoid inexact error, ensure array is float
    typeof(ec.series[series].data) == Array{Array{Int64,1},1} ?
        ec.series[1].data = [convert(Array{Float64,1}, x) for x in ec.series[series].data] :
            nothing

    #Iterate over series to jitter dataset
    for datum in ec.series[series].data

        datum[1] = rand(-pctxrange:0.001:pctxrange) * xrange + datum[1]
        datum[2] = rand(-pctyrange:0.001:pctyrange) * yrange + datum[2]

    end

    return ec
end

function jitter!(ec::EChart; pctxrange::Real = 0.05, pctyrange::Real = 0)

	for n in 1:length(ec.series)
		jitter!(ec, n, pctxrange = pctxrange, pctyrange = pctyrange)
	end

	return ec

end
