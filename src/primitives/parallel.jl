parallel_spec =

[
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{AbstractString, Int}, "auto"),
(:top, Union{AbstractString, Int}, 60),
(:right, Union{AbstractString, Int}, 80),
(:bottom, Union{AbstractString, Int}, 60),
(:width, Union{AbstractString, Int}, "auto"),
(:height, Union{AbstractString, Int}, "auto"),
(:layout, AbstractString, "horizontal"),
(:parallelAxisDefault, Dict, nothing),
]

primitivefactory(:Parallel, parallel_spec)