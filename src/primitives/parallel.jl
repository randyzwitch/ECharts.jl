parallel_spec =

[
(:zlevel, Int, 0),
(:z, Int, 2),
(:left, Union{String, Int}, "auto"),
(:top, Union{String, Int}, 60),
(:right, Union{String, Int}, 80),
(:bottom, Union{String, Int}, 60),
(:width, Union{String, Int}, "auto"),
(:height, Union{String, Int}, "auto"),
(:layout, String, "horizontal"),
(:parallelAxisDefault, Dict, nothing),
]

primitivefactory(:Parallel, parallel_spec)