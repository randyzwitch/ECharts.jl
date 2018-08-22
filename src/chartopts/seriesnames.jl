#Automatically name series, so that downstream functions like legend which use names have one
function seriesnames!(ec::EChart)

    for (i, x) in enumerate(ec.series)
        x.name == nothing ? x.name = "Series $i" : nothing
    end

    return ec

end

function seriesnames!(ec::EChart, names::AbstractVector{String})

    length(ec.series) != length(names) ? error("Names not equal to number of Series") : nothing

    for i in 1:length(ec.series)
        ec.series[i].name = names[i]
    end

    #Modify legend attribute to use new seriesnames
    ec.legend.data = names

    return ec

end

seriesnames!(ec::EChart, names::AbstractVector) = seriesnames!(ec, String[string(x) for x in names])
