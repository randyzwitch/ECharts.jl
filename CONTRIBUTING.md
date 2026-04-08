# Contributing to ECharts.jl

Thank you for your interest in contributing to ECharts.jl! This document describes the conventions, patterns, and expectations for contributions to this package.

## Table of Contents

- [AI-Assisted Contributions](#ai-assisted-contributions)
- [Package Architecture](#package-architecture)
- [Code Style](#code-style)
- [Naming Conventions](#naming-conventions)
- [Struct Definitions](#struct-definitions)
- [Adding a New Chart Type](#adding-a-new-chart-type)
- [Adding a Chart Modification Function](#adding-a-chart-modification-function)
- [Documentation](#documentation)
- [Testing](#testing)
- [JSON Serialization](#json-serialization)

---

## AI-Assisted Contributions

The use of AI coding tools (Claude, Copilot, Cursor, etc.) is encouraged when contributing to ECharts.jl. These tools can be helpful for generating boilerplate, drafting docstrings, and exploring the codebase.

However, every submitted pull request must have a **human sponsor** who:

- Has read and understands the code being submitted
- Is vouching for the correctness and quality of the contribution
- Is willing to shepherd the PR through review, address feedback, and iterate until it is merged or closed

PRs that appear to be unreviewed AI output — with no evidence the submitter understands the change — will be closed without review. The human sponsor does not need to be the original author of the code, but they must be an active participant in the PR process.

---

## Package Architecture

```
src/
  ECharts.jl              # Module entry point: exports and includes
  definetypes.jl          # All struct definitions
  render.jl               # HTML/JSON/SVG rendering
  from_json.jl            # JSON deserialization
  live.jl                 # Live/real-time chart support
  theme.jl                # Theme definitions
  chartopts/              # Mutating chart modification functions
  plots/                  # Chart creation functions

test/
  runtests.jl             # Test entry point (includes other files)
  plots.jl                # Chart creation tests
  options.jl              # Chart modification tests
  render.jl               # Rendering output tests
  test_from_json.jl       # JSON deserialization tests
  generate_fixtures.jl    # Generates JSON fixtures for JS validation
  js/validate.js          # Node.js script that validates fixtures against ECharts v6
  README.md               # Testing documentation and design decisions
```

New chart types go in `src/plots/`. New chart modification functions go in `src/chartopts/`. New struct types (ECharts.js option objects) go in `src/definetypes.jl`. Exports and includes must be added to `src/ECharts.jl`.

---

## Code Style

- **Indentation**: 4 spaces (no tabs)
- **Line length**: no hard limit, but prefer readable widths; align keyword arguments when wrapping
- **Type annotations**: use `Union` types to accept multiple input types and allow `nothing`
- **Comments**: sparse; only where logic is not self-evident
- **Mutating functions**: always return the modified `EChart` object to support chaining

---

## Naming Conventions

| Context | Convention | Example |
|---|---|---|
| Files and directories | `snake_case` | `xy_plot.jl`, `colorscheme.jl` |
| Structs and abstract types | `CamelCase` | `EChart`, `LineStyle`, `XYSeries` |
| Chart creation functions | lowercase | `line()`, `bar()`, `scatter()` |
| Mutating modification functions | lowercase with `!` | `smooth!()`, `legend!()`, `colorscheme!()` |
| Fields that shadow Julia reserved words | `_` prefix | `_type` (serializes as `type`) |
| Fields internal to ECharts.jl (not exported to echarts.js JSON) | `ec_` prefix | `ec_width`, `ec_height`, `ec_charttype` |

Fields with a `_` prefix have the prefix stripped when serialized to JSON. Fields with an `ec_` prefix are excluded from JSON output entirely.

---

## Struct Definitions

All structs are defined in `src/definetypes.jl`. Use the `@with_kw` macro from `Parameters.jl` for keyword constructors. All structs are mutable and annotate every field.

```julia
@with_kw mutable struct LineStyle <: AbstractEChartType
    color::Union{AbstractVector, String, Nothing} = nothing
    width::Union{Int, Nothing} = nothing
    _type::Union{String, Nothing} = nothing   # serializes as "type"
    shadowBlur::Union{Int, Nothing} = nothing
end
```

**Rules:**
- Inherit from `AbstractEChartType` for option objects and `AbstractEChartSeries` for series types
- Default all optional fields to `nothing`
- Use `Union{T, Nothing}` for every optional field
- Use `Union{String, AbstractVector, Nothing}` when a field accepts a single value or an array
- Field names must match the echarts.js option name exactly (with `_` prefix for reserved words)
- Add new structs in alphabetical order within their logical grouping

---

## Adding a New Chart Type

1. Create `src/plots/{chartname}.jl`
2. Implement four method signatures (see pattern below)
3. Add a `include("plots/{chartname}.jl")` line in `src/ECharts.jl`
4. Export the function in `src/ECharts.jl`
5. Add tests to `test/plots.jl`

**Four-method pattern** (all chart creation functions follow this shape):

````julia
"""
    chartname(x, y)

One-line description of the chart.

## Methods
```julia
chartname(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}})
chartname(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2})
chartname(df, x::Symbol, y::Symbol)
chartname(df, x::Symbol, y::Symbol, group::Symbol)
```

## Arguments
* `legend::Bool` : display legend?
* `scale::Bool = false` : show full Y-axis or truncated
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
Describe any method-specific defaults or behavior.
"""
function chartname(x::AbstractVector, y::AbstractVector{<:Union{Missing, Real}};
                   legend::Bool = false,
                   scale::Bool = false,
                   kwargs...)
    # implementation
end

function chartname(x::AbstractVector, y::AbstractArray{<:Union{Missing, Real},2};
                   legend::Bool = true,
                   scale::Bool = false,
                   kwargs...)
    # implementation
end

function chartname(df, x::Symbol, y::Symbol;
                   legend::Bool = false,
                   scale::Bool = false,
                   kwargs...)
    # delegate to vector method using _table_col()
end

function chartname(df, x::Symbol, y::Symbol, group::Symbol;
                   legend::Bool = true,
                   scale::Bool = false,
                   kwargs...)
    # delegate to vector method using _table_unstack()
end
````

**Common keyword arguments** shared across chart types:

| Argument | Type | Default | Description |
|---|---|---|---|
| `legend` | `Bool` | `false` (single series), `true` (multi-series) | Show legend |
| `scale` | `Bool` | `false` | Truncate Y-axis to data range |
| `kwargs...` | | | Pass-through to set any `EChart` field |

Most XY chart types delegate to `xy_plot()` in `src/plots/xy_plot.jl`. Use it as the implementation foundation when appropriate.

---

## Adding a Chart Modification Function

Modification functions mutate an existing `EChart` and live in `src/chartopts/`. They must always return the modified `EChart`.

Provide three method overloads: apply to all series, a single series by index, and a vector of series by index.

````julia
"""
    myoption!(ec[, series]; kwarg = default)

One-line description.

## Methods
```julia
myoption!(ec::EChart; kwarg::Type = default)
myoption!(ec::EChart, series::Int; kwarg::Type = default)
myoption!(ec::EChart, series::Vector{Int}; kwarg::Type = default)
```

## Arguments
* `kwarg::Type = default` : description
"""
function myoption!(ec::EChart; kwarg::Bool = true)
    for s in ec.series
        s.field = kwarg
    end
    return ec
end

function myoption!(ec::EChart, series::Int; kwarg::Bool = true)
    ec.series[series].field = kwarg
    return ec
end

function myoption!(ec::EChart, series::Vector{Int}; kwarg::Bool = true)
    for s in series
        myoption!(ec, s; kwarg = kwarg)
    end
    return ec
end
````

Add a `include("chartopts/{filename}.jl")` line and an export in `src/ECharts.jl`. Add tests to `test/options.jl`.

---

## Documentation

Every exported function requires a docstring. Follow this structure:

````julia
"""
    functionname(required_args)

One-sentence description.

## Methods
```julia
functionname(x::Type1)
functionname(x::Type2, y::Type2)
```

## Arguments
* `argname::Type = default` : description
* `kwargs` : varargs to set any field of resulting `EChart` struct

## Notes
Any non-obvious behavior, defaults that differ by method, or echarts.js quirks.
"""
````

**Rules:**
- The `## Methods` block shows all overloads with their full type signatures
- The single docstring above the first method documents all overloads
- `## Notes` is optional but required whenever defaults differ between methods or there is non-obvious behavior
- Document `kwargs` when present, even if just `kwargs : varargs to set any field of resulting EChart struct`
- Do not add inline comments to code that is already self-explanatory

---

## Testing

### Julia tests

Tests live in `test/plots.jl` (chart creation) and `test/options.jl` (chart modification). The entry point is `test/runtests.jl`.

The primary test assertion is a type check:

```julia
@test typeof(mychart) == EChart
```

Test every method overload separately. Use realistic data that exercises the code path:

```julia
# single vector
x = ["A", "B", "C"]
y = [1, 2, 3]
@test typeof(bar(x, y)) == EChart

# 2D array
y2 = [1 4; 2 5; 3 6]
@test typeof(bar(x, y2)) == EChart

# table interface
@test typeof(bar(df, :col_x, :col_y)) == EChart

# table with grouping
@test typeof(bar(df, :col_x, :col_y, :group)) == EChart
```

When testing modification functions, verify that the option was actually set on the chart object, not just that the return type is correct:

```julia
ec = line(x, y)
smooth!(ec)
@test ec.series[1].smooth == true
```

### JavaScript validation

`test/generate_fixtures.jl` generates JSON fixture files for each chart type. `test/js/validate.js` feeds these to the actual ECharts v6 library and intercepts `console.warn` calls that indicate invalid options.

When adding a new chart type, add it to `generate_fixtures.jl` so its JSON output is validated against echarts.js. See `test/README.md` for details on the fixture system and known design decisions (e.g., `Int` defaults, `Bool`/`Integer` ordering).

### Running tests

```julia
# From Julia REPL in the package directory
using Pkg
Pkg.test("ECharts")
```

```bash
# JavaScript validation (requires Node.js)
cd test/js
npm install
node validate.js
```

---

## JSON Serialization

ECharts.jl uses `JSON.jl` with custom `JSON.lower` methods defined in `src/ECharts.jl`. The serialization rules are:

| Value | Serialized as |
|---|---|
| `nothing` | omitted from output |
| `Missing` | `"-"` (ECharts.js missing marker) |
| `Symbol` | `String` |
| Field with `ec_` prefix | omitted from output |
| Field with `_` prefix | field name without `_` (e.g., `_type` → `"type"`) |

When adding new struct fields:
- Fields that map directly to echarts.js option names need no special handling
- Fields that shadow Julia reserved words must use the `_` prefix (e.g., `_type`, `_end`)
- Fields that are internal to ECharts.jl and should never appear in JSON must use the `ec_` prefix
- Do not override `JSON.lower` for new structs unless the default behavior is insufficient; the base `AbstractEChartType` implementation handles the common cases

For fields that accept raw JavaScript (e.g., formatter functions), wrap the string in `JSON.JSONText()` so it is not quoted in the output.
