function collect_data_sankey(datafile::String)
    data = Vector{Tuple{AbstractString, AbstractString, Int}}()
    
    open(datafile) do io
        while ! eof(io)
            n1, v, n2 = match(r"(.*)\s+\[(\d+)\]\s+(.*)", readline(io)).captures
            v = parse(Int, v)
            push!(data, (n1, n2, v))
        end
    end
    
    return data
end

function get_names_sankey(data::Vector{Tuple{AbstractString, AbstractString, Int}})
    names = Vector{AbstractString}()
    
    for line in data
        n1, n2, v = line
        push!(names, n1); push!(names, n2)
    end
    
    return unique(names)
end

function parse_sankey(datafile::String)
    data = collect_data_sankey(datafile)
    names = get_names_sankey(data)
    
    source = Vector{Union{Missing, Int}}()
    target = Vector{Union{Missing, Int}}()
    values = Vector{Union{Missing, Real}}()
    
    for line in data
        n1, n2, v = line
        push!(values, v)
        push!(source, findfirst(==(n1), names) - 1)
        push!(target, findfirst(==(n2), names) - 1)
    end
    
    return names, source, target, values
end

"""
    sankey(names, source, target, value)

Creates an `EChart` diagram displaying the path and frequencies between nodes.

## Methods
```julia
sankey(names::AbstractVector, source::AbstractVector{<:Union{Missing, Int}},
    target::AbstractVector{<:Union{Missing, Int}}, value::AbstractVector{<:Union{Missing, Real}};
sankey(datafile::AbstractString)
```

## Arguments
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Using the second method mentioned above--as per http://sankeymatic.com/build/'s convention--you can have a datafile (call it `input.txt`), where each line has the information
```
SOURCE [AMOUNT] TARGET
```
In this case.  `SOURCE` and `TARGET` are both `String`s, where `AMOUNT` is a `Real`.  For example:
```
Wages [2000] Budget
Interest [25] Budget
Budget [500] Taxes
Budget [450] Housing
Budget [310] Food
Budget [205] Transportation
Budget [400] Health Care
Budget [160] Other Necessities
```
And simply run
```julia
s = sankey("input.txt")
```
"""
function sankey(names::AbstractVector,
                source::AbstractVector{<:Union{Missing, Int}},
                target::AbstractVector{<:Union{Missing, Int}},
                value::AbstractVector{<:Union{Missing, Real}};
                kwargs...)

    ec = newplot(kwargs, ec_charttype = "sankey")
    ec.series = [SankeySeries(name = "Series 1", layout = "none", data = arrayofdicts(name = names),
        links = arrayofdicts(source = source, target = target, value = value))]

    return ec

end

sankey(datafile::AbstractString; kwargs...) = sankey(parse_sankey(datafile)...; kwargs...)
