# ECharts.jl Test Suite

## Overview

Testing for ECharts.jl has two distinct layers:

1. **Julia tests** (`runtests.jl`, `plots.jl`, `options.jl`, `render.jl`) — standard Julia `@test` coverage for chart construction, option setting, and rendering output.

2. **JavaScript validation** — verifies that the JSON produced by Julia structs is actually accepted as valid by Apache ECharts v5 itself. This catches things the Julia type system cannot: deprecated field names, wrong value types for a given field, and structural issues that only manifest at runtime in the browser.

## Why JS validation?

ECharts does not throw on invalid options — it logs warnings via `console.warn`. A chart with a deprecated field (e.g., `barBorderColor`, renamed to `borderColor` in v5) will silently render incorrectly. The only reliable way to catch these issues is to feed the JSON to a real ECharts instance and intercept those warnings.

This suite was built when upgrading ECharts.jl to v5, and is most useful when:
- Updating to a new ECharts JS version (field renames, deprecations)
- Adding or modifying Julia struct definitions in `src/definetypes.jl`
- Debugging why a chart looks wrong in the browser

## Files

| File | Purpose |
|------|---------|
| `generate_fixtures.jl` | Generates one JSON fixture per chart-function variant (bar, line, scatter, etc.) |
| `generate_type_fixtures.jl` | Generates one JSON fixture per `(struct, field, concrete_type)` triple — covers every branch of every `Union` field across every `AbstractEChartType` |
| `fixtures/` | Generated JSON files (git-ignored); recreate with the generators above |
| `js/validate.js` | Node.js script that feeds each fixture to `echarts.setOption()` and fails on any warnings |
| `js/package.json` | npm dependencies: `echarts` and `jsdom` |

## Running

```bash
# 1. Generate fixtures (Julia)
julia --project=test test/generate_fixtures.jl
julia --project=test test/generate_type_fixtures.jl

# 2. Install JS deps (once)
cd test/js && npm install

# 3. Validate fixtures against ECharts v5
cd test/js && npm test
```

## Type fixture design

`generate_type_fixtures.jl` uses Julia reflection to enumerate every field of every `AbstractEChartType` struct. For a field typed `Union{Int, String, Nothing}`, two fixtures are produced — one with an `Int` value, one with a `String` — so every branch of every `Union` is exercised independently.

Key design decisions:
- **`Int` defaults to `0`** (not `1`) so index fields like `gridIndex`, `xAxisIndex`, `polarIndex` remain valid in single-component test charts.
- **`Bool` is checked before `Integer`** because `Bool <: Integer` in Julia — without this, `Bool` fields would receive an `Int` test value.
- **`FIELD_OVERRIDES`** handles fields where the generic default (`"test"` / `0`) is not a valid ECharts value (e.g., `coordinateSystem` must be `"cartesian2d"`).
- **`JSFunction` fields are skipped** — they produce raw JavaScript, not valid JSON, and cannot be validated this way.
- **Nested structs, Vectors, and Dicts are skipped** — shape-specific; covered by the chart-function fixtures instead.

## Known exclusions

- **`bubble` and `corrplot` chart fixtures** are not generated because these charts use `JSFunction` for dynamic symbol sizing, producing non-valid JSON.
- **Radar tick-readability warning** (`"The ticks may be not readable when set"`) is suppressed in `validate.js` — this is an ECharts internal aesthetic hint that fires regardless of chart spec correctness.
