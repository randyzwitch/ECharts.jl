polar_spec =

[
(:zlevel, Int, 0),
(:z, Int, 2),
(:center, Vector{String}, ["50%", "50%"]),
(:radius, AbstractVector, nothing) #tighten up definition
]

primitivefactory(:Polar, polar_spec)
