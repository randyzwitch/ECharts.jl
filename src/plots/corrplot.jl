"""
    corrplot(data)

Creates an `EChart` showing pairwise correlations between columns of data.

## Methods
```julia
corrplot(m::Matrix)
corrplot(df::AbstractDataFrame)
```

## Arguments
* `bubblesize::Int = 45` : size of bubbles
* `layout::String = "lower"` : one of {"lower", "upper", nothing}
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

`corrplot` does not currently support missing values. Users should call `completecases!()` when using a DataFrame, or manually fill missing values as appropriate.

## Examples
```julia
using ECharts, DataFrames, RDatasets
df = dataset("datasets", "mtcars")
cplot = corrplot(df)
```
"""
function corrplot(m::Matrix;
                  bubblesize::Int = 45,
                  layout::String = "lower",
                  labels::Bool = true,
                  ec_height::Real = 650,
                  ec_width::Real = 650,
                  kwargs...)

    #Validate input, since cor in StatsBase returns plain Matrix
    size(m)[1] != size(m)[2] ? error("Matrix needs to be square for a corrplot") : nothing

    #Copy to avoid mutating
    m_ = m
    if layout == "lower"
        tril!(m_)
    elseif layout == "upper"
        triu!(m_)
    else
        nothing
    end

    #convert back to df, melt to pass to arrayofarray
    cor_df = DataFrame(m_)
    original_names = names(cor_df)
    names!(cor_df, [Symbol(x) for x in 1:length(names(cor_df))])
    cor_df[:rownames] = names(cor_df)
    df_melt = melt(cor_df, [:rownames])

    #convert to numeric, fixes weird echarts api requiring numeric series in order to rename
    df_melt[:variable] = [parse(Int, string(x)) - 1 for x in df_melt[:variable]]
    df_melt[:rownames] = [parse(Int, string(x)) - 1 for x in df_melt[:rownames]]

    #plot
    ec = newplot(kwargs, ec_charttype = "corrplot")
    ec.ec_height = ec_height
    ec.ec_width = ec_width
    ec.xAxis = [Axis(data = 1:length(original_names), _type = "category")]
    ec.yAxis = [Axis(data = 1:length(original_names), _type = "category", inverse = true)]

    ec.series = [XYSeries(data = arrayofarray(df_melt[:variable], df_melt[:rownames], df_melt[:value]),
                        _type = "scatter",
                        symbolSize = JSFunction("""function (data) {return $bubblesize * Math.sqrt(Math.abs(data[2]))}""")
                        )
                ]

    ec.visualMap = VisualMap(left = "right", top = "middle",
                             min = -1.0,
                             max = 1.0,
                             inRange = Dict("color" => colorpalettes["RdBu"]["9"]),
                             calculable = true,
                             precision = 2
                            )

    #overlay labels. figure out what might be worth a keyword in method definition
    labels ?
    ec.series[1].label = ECharts.Label(show = true,
                                      position = "inside",
                                      formatter = JSFunction("""function (params) {return params.data[2].toFixed(2);}"""),
                                      textStyle = TextStyle(fontWeight = "bold", color = "black", fontSize = 14)

                                  ) : nothing
    ec

end

function corrplot(df::AbstractDataFrame;
                  bubblesize::Int = 45,
                  layout::String = "lower",
                  labels::Bool = true,
                  ec_height::Real = 650,
                  ec_width::Real = 650,
                  kwargs...)

    #get numeric columns from df, call cor from StatsBase
    df_num = df[[x <: Union{Missing, Number} for x in eltypes(df)]]
    c = cor(convert(Matrix, df_num))

    ec = corrplot(c, bubblesize = bubblesize, layout = layout, labels = labels, ec_height = ec_height, ec_width = ec_width, kwargs...)

    #add column names
    yaxis!(ec, data = names(df_num))
    xaxis!(ec, data = names(df_num))


    ec

end
