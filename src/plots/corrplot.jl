"""
    corrplot(data)

Creates an `EChart` showing pairwise correlations between columns of data.

## Methods
```julia
corrplot(m::Matrix)
corrplot(df)
```

## Arguments
* `bubblesize::Int = 45` : size of bubbles
* `layout::String = "lower"` : one of {"lower", "upper", nothing}
* `labels::Bool = true` : show correlation coefficient labels inside each bubble
* `diag::Bool = true` : show the diagonal (self-correlations)
* `number_digits::Int = 2` : decimal places shown in correlation labels
* `label_color::String = "black"` : text color of correlation labels
* `label_fontsize::Int = 14` : font size of correlation labels
* `order::String = "original"` : column ordering for table input; one of {"original", "alphabet"}
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

`corrplot` does not currently support missing values. Users should call `completecases!()` when using a table, or manually fill missing values as appropriate.
"""
function corrplot(m::Matrix;
                  bubblesize::Int = 45,
                  layout::String = "lower",
                  labels::Bool = true,
                  diag::Bool = true,
                  number_digits::Int = 2,
                  label_color::String = "black",
                  label_fontsize::Int = 14,
                  ec_height::Real = 650,
                  ec_width::Real = 650,
                  kwargs...)

    #Validate input, since cor in StatsBase returns plain Matrix
    size(m)[1] != size(m)[2] ? error("Matrix needs to be square for a corrplot") : nothing

    #build melt/stack equivalent using plain arrays, filtering by layout/diag
    n = size(m, 1)
    melt_variable = Int[]
    melt_rownames = Int[]
    melt_value = Float64[]
    for col in 1:n, row in 1:n
        layout == "lower" && row < col && continue
        layout == "upper" && row > col && continue
        !diag && row == col && continue
        push!(melt_variable, col - 1)
        push!(melt_rownames, row - 1)
        push!(melt_value, m[row, col])
    end

    #plot
    ec = newplot(kwargs, ec_charttype = "corrplot")
    ec.ec_height = ec_height
    ec.ec_width = ec_width
    ec.xAxis = [Axis(data = 1:n, _type = "category")]
    ec.yAxis = [Axis(data = 1:n, _type = "category", inverse = true)]

    ec.series = [XYSeries(data = arrayofarray(melt_variable, melt_rownames, melt_value),
                        _type = "scatter",
                        symbolSize = JSON.JSONText("""function (data) {return $bubblesize * Math.sqrt(Math.abs(data[2]))}""")
                        )
                ]

    ec.visualMap = VisualMap(left = "right", top = "middle",
                             min = -1.0,
                             max = 1.0,
                             inRange = Dict("color" => colorpalettes["RdBu"]["9"]),
                             calculable = true,
                             precision = 2
                            )

    if labels
        ec.series[1].label = ECharts.Label(show = true,
                                          position = "inside",
                                          formatter = JSON.JSONText("""function (params) {return params.data[2].toFixed($number_digits);}"""),
                                          textStyle = TextStyle(fontWeight = "bold", color = label_color, fontSize = label_fontsize)
                                      )
    end

    ec

end

function corrplot(df;
                  bubblesize::Int = 45,
                  layout::String = "lower",
                  labels::Bool = true,
                  diag::Bool = true,
                  number_digits::Int = 2,
                  label_color::String = "black",
                  label_fontsize::Int = 14,
                  order::String = "original",
                  ec_height::Real = 650,
                  ec_width::Real = 650,
                  kwargs...)

    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))

    #get numeric columns from table, call cor from StatsBase
    cols = Tables.columns(df)
    colnames = collect(Tables.columnnames(cols))
    num_colnames = [n for n in colnames if eltype(Tables.getcolumn(cols, n)) <: Union{Missing, Number}]

    if order == "alphabet"
        sort!(num_colnames, by = string)
    elseif order != "original"
        throw(ArgumentError("order must be \"original\" or \"alphabet\""))
    end

    m = convert(Matrix{Float64}, hcat([collect(Tables.getcolumn(cols, n)) for n in num_colnames]...))
    c = cor(m)

    ec = corrplot(c, bubblesize = bubblesize, layout = layout, labels = labels,
                  diag = diag, number_digits = number_digits,
                  label_color = label_color, label_fontsize = label_fontsize,
                  ec_height = ec_height, ec_width = ec_width, kwargs...)

    #add column names
    yaxis!(ec, data = [string(n) for n in num_colnames])
    xaxis!(ec, data = [string(n) for n in num_colnames])

    ec

end
