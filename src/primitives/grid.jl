grid_spec =
[
    (:zlevel, Int, 0),
    (:z, Int, 0),
    (:x, Union{AbstractString, Number}, 80),
    (:y, Union{AbstractString, Number}, 60),
    (:x2, Union{AbstractString, Number}, 80),
    (:y2, Union{AbstractString, Number}, 60),
    (:width, Union{AbstractString, Number}, nothing),
    (:height, Union{AbstractString, Number}, nothing),
    (:backgroundColor, AbstractString, nothing),
    (:borderWidth, Number, 1),
    (:borderColor, AbstractString, "#ccc")

]

primitivefactory(:Grid, grid_spec)