"""
    aria!(ec)

Adds or modifies [ARIA](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA) (Accessible Rich Internet Applications) settings for an `EChart`.

ECharts supports two accessibility features:
- **Screen reader labels** (`label`): auto-generates chart descriptions from titles, series, and data
- **Decal patterns** (`decal`): overlays visual patterns on series marks to distinguish data without relying on color alone (useful for color-blind users)

## Methods
```julia
aria!(ec::EChart; enabled, label_enabled, description, general, series, data, decal_show, decal)
```

## Arguments
* `enabled::Bool = true` : enable ARIA globally; must be `true` for either label or decal to take effect
* `label_enabled::Bool = true` : enable auto-generated screen reader label text
* `description::Union{String, Nothing} = nothing` : custom description that replaces the auto-generated label entirely
* `general::Union{Dict, Nothing} = nothing` : templates for the chart-level description:
  - `"withTitle"` — used when the chart has a title (default: `"This is a chart about {title}."`)
  - `"withoutTitle"` — used when no title is set (default: `"This is a chart."`)
* `series::Union{Dict, Nothing} = nothing` : templates for series descriptions; supports `"maxCount"`,
  `"single"` (with `"prefix"`, `"withName"`, `"withoutName"`), and `"multiple"` (with `"prefix"`,
  `"withName"`, `"withoutName"`, `"separator"` containing `"middle"` and `"end"`)
* `data::Union{Dict, Nothing} = nothing` : templates for data-point descriptions; supports `"maxCount"`,
  `"allData"`, `"partialData"` (template variable: `{displayCnt}`), `"withName"` (variables: `{name}`,
  `{value}`), `"withoutName"` (variable: `{value}`), and `"separator"` containing `"middle"` and `"end"`
* `decal_show::Bool = false` : enable decal patterns as a secondary visual representation of data
  (v5+); patterns cycle automatically across series so no further configuration is required
* `decal::Union{Dict, Nothing} = nothing` : fine-grained decal configuration dict (v5+); when
  provided, `decal_show` is set to `true` automatically; supports `"show"` and `"decals"` (array of
  pattern objects with fields `"symbol"`, `"symbolSize"`, `"symbolKeepAspect"`, `"color"`,
  `"backgroundColor"`, `"dashArrayX"`, `"dashArrayY"`, `"rotation"`, `"maxTileWidth"`, `"maxTileHeight"`)

## Examples
```julia
# Enable screen reader label (auto-generated from chart title, series, and data)
aria!(ec)

# Provide a fully custom description instead of the auto-generated one
aria!(ec; description = "Bar chart showing monthly revenue for 2024.")

# Customise the title template
aria!(ec; general = Dict("withTitle" => "Chart titled {title}, showing sales data."))

# Enable decal patterns for colour-blind accessibility (no other config needed)
aria!(ec; decal_show = true)

# Enable both screen reader label and decal patterns
aria!(ec; decal_show = true)
```

"""
function aria!(ec::EChart; enabled::Bool = true,
               label_enabled::Bool = true,
               description::Union{String, Nothing} = nothing,
               general::Union{Dict, Nothing} = nothing,
               series::Union{Dict, Nothing} = nothing,
               data::Union{Dict, Nothing} = nothing,
               decal_show::Bool = false,
               decal::Union{Dict, Nothing} = nothing)

    label_config = Dict{String,Any}("enabled" => label_enabled)
    description !== nothing && (label_config["description"] = description)
    general !== nothing && (label_config["general"] = general)
    series !== nothing && (label_config["series"] = series)
    data !== nothing && (label_config["data"] = data)

    # If a decal dict is provided but doesn't set "show", turn it on automatically
    if decal !== nothing
        decal_config = copy(decal)
        !haskey(decal_config, "show") && (decal_config["show"] = true)
    elseif decal_show
        decal_config = Dict{String,Any}("show" => true)
    else
        decal_config = nothing
    end

    ec.aria = Aria(enabled = enabled,
                   label = label_config,
                   decal = decal_config)
    return ec

end
