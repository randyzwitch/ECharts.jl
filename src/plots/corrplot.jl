function corrplot(m::Matrix;
                  bubblesize::Int = 40,
                  layout::String = "lower",
                  ec_height::Real = 600,
                  ec_width::Real = 600,
                  kwargs...)

    #Validate input, since cor in StatsBase returns plain Matrix
    !issymmetric(m) ? error("Matrix needs to be symmetric for a corrplot") : nothing

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

    ec.series = [Series(data = arrayofarray(df_melt[:variable], df_melt[:rownames], df_melt[:value]),
                        _type = "scatter",
                        symbolSize = JSFunction("""function (data) {return $bubblesize * Math.sqrt(Math.abs(data[2]))}""")
                        )
                ]

    ec.visualMap = VisualMap(left = "right", top = "middle",
                             min = -1.0,
                             max = 1.0,
                             inRange = Dict("color" => colorpalettes["RdBu"]["11"]),
                             calculable = true,
                             precision = 2
                            )
    ec

end

function corrplot(df::AbstractDataFrame;
                  bubblesize::Int = 40,
                  layout::String = "lower",
                  ec_height::Real = 600,
                  ec_width::Real = 600,
                  kwargs...)

    #get numeric columns from df, call cor from StatsBase
    df_num = df[[x <: Number for x in eltypes(df)]]
    c = cor(convert(Matrix, df_num))

    ec = corrplot(c, bubblesize = bubblesize, layout = layout, ec_height = ec_height, ec_width = ec_width, kwargs...)

    #add column names
    yaxis!(ec, data = names(df_num))
    xaxis!(ec, data = names(df_num))


    ec

end
