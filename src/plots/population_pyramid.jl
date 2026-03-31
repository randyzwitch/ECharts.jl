"""
    population_pyramid(ages, male, female)

Creates an `EChart` population pyramid with age groups on the y-axis and bars diverging
left (male) and right (female) on the x-axis.

## Methods
```julia
population_pyramid(ages::AbstractVector{String},
                   male::AbstractVector{<:Real},
                   female::AbstractVector{<:Real})
```

## Arguments
* `legend::Bool = true` : display legend?
* `male_name::String = "Male"` : series label for male data
* `female_name::String = "Female"` : series label for female data
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes

Male values are plotted as negative so bars extend to the left. Pass positive values for
both `male` and `female`; negation is handled internally.
"""
function population_pyramid(ages::AbstractVector{String},
                             male::AbstractVector{<:Real},
                             female::AbstractVector{<:Real};
                             legend::Bool = true,
                             male_name::String = "Male",
                             female_name::String = "Female",
                             kwargs...)

    ec = newplot(kwargs, ec_charttype = "population_pyramid")
    ec.xAxis = [Axis(_type = "value")]
    ec.yAxis = [Axis(_type = "category", data = collect(ages))]
    ec.series = [
        XYSeries(name = male_name,   _type = "bar", data = [-m for m in male]),
        XYSeries(name = female_name, _type = "bar", data = collect(female)),
    ]

    legend ? legend!(ec) : nothing

    return ec

end
