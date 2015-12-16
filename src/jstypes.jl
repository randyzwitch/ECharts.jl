# All types in Vega.jl are subtypes of AbstractVegaType. Overloading `call` as
# a parametric type over the field of `AbstractVegaType`s allows us to get much
# better performance for the first visualization after importing Vega
abstract AbstractEChartType

function Base.call{T<:AbstractEChartType}(::Type{T}; kwargs...)
    out = T()
    for (sym, val) in kwargs
        setfield!(out, sym, val)
    end
    out
end

tojs(s::Symbol) = string(s)
tojs(v::Vector) = [tojs(v_i) for v_i in v]

function tojs(v::Dict)
    res = Dict()
    for (k, v) in v
        res[k] = tojs(v)
    end
    return res
end
tojs(x::Any) = x

#Takes in a type name and its specification
#Returns Expr for the type code as if you had written it yourself

#Ex: padding_spec = [(:top, Number, 80, false), (:left, Number, 80, false), (:bottom, Number, 80, false), (:right, Number, 80, false)]
# > maketype(:VegaPadding, padding_spec)
# :(type VegaPadding <: AbstractVegaType
#     top::Number
#     left::Number
#     bottom::Number
#     right::Number
# end)

function maketype(typename::Symbol, spec)
    n = length(spec)
    lines = Array(Expr, n)
    for i in 1:n
        entry = spec[i]
        lines[i] = Expr(:(::), entry[1], Union{entry[2], Void}) #Was fielddef(entry::Tuple) function
    end

    return Expr(:type, #type
                true, Expr(:<:, typename, AbstractEChartType), Expr(:block, lines...) #arguments
                )
end

#Takes in typename and its specification
#Builds a function with the same name as the type (i.e function VegaPadding and type :VegaPadding)
#An Expr is returned, as if you had typed it yourself

#:(function VegaPadding()
#        VegaPadding(80,80,80,80)
#    end)

function makedefaultfunc(typename::Symbol, spec)
    return Expr(:function, #type
                Expr(:call, typename),
                Expr(:block,
                     Expr(:call, typename, map(entry -> entry[3], spec)...)))
end


#Intermediate helper function to maketojs()
#Make a dict from fieldname
#If fieldname happens to be _type (because type is a reserved keyword), take the underscore off when placing in dict
function makehash(fieldname::Symbol)
    if fieldname == :_type
        return Expr(:(=),
                    Expr(:ref, :res, "type"),
                    Expr(:call, :tojs, Expr(:., :x, Expr(:quote, fieldname))))
    elseif fieldname == :_end
        return Expr(:(=),
                    Expr(:ref, :res, "end"),
                    Expr(:call, :tojs, Expr(:., :x, Expr(:quote, fieldname))))
    else
        return Expr(:(=),
                    Expr(:ref, :res, string(fieldname)),
                    Expr(:call, :tojs, Expr(:., :x, Expr(:quote, fieldname))))
    end
end

##Intermediate helper function to maketojs()
function makejsline(entry::Tuple)
    fieldname = entry[1]

    return Expr(:if,
                Expr(:comparison,
                    Expr(:., :x, Expr(:quote, fieldname)),
                    :!=,
                    :nothing),
                Expr(:block, makehash(fieldname)))

end

#Intermediate helper function to maketojs()
function makejsbody(spec)
    return Expr(:block,
                :(res = Dict()),
                map(makejsline, spec)...,
                :(return res))
end

#Function uses makejsbody, makejsline, makehash to create a custom tojs() function for each type

#Ex:
# > maketojs(:VegaPadding, padding_spec)
# :(function tojs(x::VegaPadding)
#         res = Dict()
#         res["top"] = tojs(x.top)
#         res["left"] = tojs(x.left)
#         res["bottom"] = tojs(x.bottom)
#         res["right"] = tojs(x.right)
#         return res
#     end)
function maketojs(typename::Symbol, spec)
    return Expr(:function,
                Expr(:call,
                     :tojs,
                     Expr(:(::), :x, typename)),
                     makejsbody(spec))
end

#Create primitives from one function instead of repeating
#Use of eval() takes all Expr created above, evaluates their results, so that they become Julia citizens
function primitivefactory(create::Symbol, spec::AbstractArray)
    eval(maketype(create, spec))
    eval(makedefaultfunc(create, spec))
    eval(maketojs(create, spec))
end