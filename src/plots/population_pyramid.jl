"""
    populationpyramid(ages, male, female)

Creates an `EChart` population pyramid with age groups on the y-axis and bars diverging
left (male) and right (female) on the x-axis. This is a convenience wrapper around
[`divergingbar`](@ref) with demographic defaults.

## Methods
```julia
populationpyramid(ages::AbstractVector{String},
                   male::AbstractVector{<:Real},
                   female::AbstractVector{<:Real})
populationpyramid(df, ages::Symbol, male::Symbol, female::Symbol)
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
function populationpyramid(ages::AbstractVector{String},
                             male::AbstractVector{<:Real},
                             female::AbstractVector{<:Real};
                             legend::Bool = true,
                             male_name::String = "Male",
                             female_name::String = "Female",
                             kwargs...)
    divergingbar(ages, male, female;
                 left_name = male_name, right_name = female_name,
                 legend = legend, kwargs...)
end

"""
    populationpyramid(df, ages, male, female)

Creates an `EChart` population pyramid from columns `ages`, `male`, and `female` in table `df`.
See the primary `populationpyramid` method for full argument documentation.
"""
function populationpyramid(df, ages::Symbol, male::Symbol, female::Symbol;
                            legend::Bool = true,
                            male_name::String = "Male",
                            female_name::String = "Female",
                            kwargs...)
    Tables.istable(df) || throw(ArgumentError("first argument must be a Tables.jl-compatible table"))
    divergingbar(_table_col(df, ages), _table_col(df, male), _table_col(df, female);
                 left_name = male_name, right_name = female_name,
                 legend = legend, kwargs...)
end
