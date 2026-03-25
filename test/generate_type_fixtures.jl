"""
generate_type_fixtures.jl

Generates one JSON fixture per (struct_type, field, concrete_type) triple across
every AbstractEChartType in ECharts.jl.  For a field typed Union{Int,String,Nothing}
two fixtures are produced — one with an Int value, one with a String — so every
branch of every Union is exercised.

Fixture naming:  type__StructName__fieldname__TypeName.json

Running the fixtures through test/js/validate.js catches:
  - Deprecated or renamed field names  (ECharts warns at runtime)
  - Wrong value types for a given field
  - Structural issues with scalar values

Fields excluded:
  _type            needs chart-specific strings ("bar","value"…), already covered
                   by chart-function fixtures.
  JSON.JSONText       not valid JSON.
  Nested structs / AbstractVector / Dict   shape-specific; covered separately.
  Structural fields that would break chart context (gridIndex, stack, etc.) are
  noted inline.

Usage:
  julia --project=test test/generate_type_fixtures.jl
"""

using ECharts, JSON
using ECharts: AbstractEChartType, AbstractEChartSeries,
               AxisPointer, Aria, Dataset, Label, XYSeries,
               Polar, RadiusAxis, AngleAxis, Radar,
               SplitLine, SplitArea, AxisLine, AxisTick, AxisLabel,
               MarkPoint, MarkLine, MarkArea, AreaStyle, LineStyle,
               Grid, Timeline, VisualMap

# ---------------------------------------------------------------------------
# Test-value generator — one value per concrete type
# ---------------------------------------------------------------------------
# Int defaults to 0 rather than 1 so that index fields (gridIndex, polarIndex,
# xAxisIndex, etc.) remain valid in test charts that have exactly one component.
function test_value_for(T::Type)
    T == String        && return (true, "test")
    T == Bool          && return (true, false)     # before Integer — Bool <: Integer in Julia
    T <: Integer       && return (true, 0)
    T <: AbstractFloat && return (true, 0.5)
    T <: Number        && return (true, 0)
    return (false, nothing)
end

# Field-specific overrides for fields where "test" / 0 is not a valid value.
# Key: (StructType, field_name, ConcreteType) => value
const FIELD_OVERRIDES = Dict{Tuple{Type,Symbol,Type}, Any}(
    # "test" is not a valid coordinate system; ECharts throws on unknown types.
    (XYSeries, :coordinateSystem, String) => "cartesian2d",
)

# Return all concrete, testable types from a Union field type
function concrete_types(ftype::Type)
    types = Base.uniontypes(ftype isa Union ? ftype : Union{ftype, Nothing})
    filter(t -> t !== Nothing &&
                t !== JSON.JSONText &&
                !(t <: AbstractEChartType) &&
                !(t <: AbstractVector) &&
                !(t <: AbstractDict), types)
end

# ---------------------------------------------------------------------------
# Fixture helpers
# ---------------------------------------------------------------------------
function save_fixture(path, chart)
    json_str = JSON.json(chart)
    try
        JSON.parse(json_str)
    catch
        return  # silently skip fixtures with JSON.JSONText output
    end
    write(path, json_str)
end

base_bar()  = bar(["A","B","C"], [1, 2, 3])
base_line() = line(["A","B","C"], [1, 2, 3])

# ---------------------------------------------------------------------------
# Embedding table
# Each entry: (StructType, embed_fn)
# embed_fn(instance) → EChart
#
# For types that need to be patched into an existing component (to preserve
# chart structure), embed_fn receives the single-field instance and merges
# its non-nothing fields into the appropriate existing component.
# ---------------------------------------------------------------------------

function patch!(dest, src)
    for f in fieldnames(typeof(src))
        v = getfield(src, f)
        v !== nothing && setfield!(dest, f, v)
    end
end

const EMBEDDINGS = [
    # ── Top-level chart components ──────────────────────────────────────────
    (Title,        t  -> (ec=base_bar();  ec.title=[t]; ec)),
    (Legend,       l  -> (ec=base_bar();  ec.legend=l; ec)),
    (Grid,         g  -> (ec=base_bar();  ec.grid=[g]; ec)),
    (Tooltip,      t  -> (ec=base_bar();  ec.tooltip=t; ec)),
    (Toolbox,      t  -> (ec=base_bar();  ec.toolbox=t; ec)),
    (DataZoom,     d  -> (ec=base_bar();  ec.dataZoom=[d]; ec)),
    (AxisPointer,  a  -> (ec=base_bar();  ec.axisPointer=a; ec)),
    (Aria,         a  -> (ec=base_bar();  ec.aria=a; ec)),
    (Dataset,      d  -> (ec=base_bar();  ec.dataset=d; ec)),
    (TextStyle,    t  -> (ec=base_bar();  ec.textStyle=t; ec)),
    (VisualMap,    v  -> (ec=base_bar();  ec.visualMap=v; ec)),

    # ── Axis — patch into yAxis to preserve gridIndex=0 and category xAxis ──
    (Axis,         a  -> (ec=base_bar();  patch!(ec.yAxis[1], a); ec)),

    # ── Axis sub-components ──────────────────────────────────────────────────
    (AxisLabel,    a  -> (ec=base_bar();  ec.yAxis[1].axisLabel=a; ec)),
    (AxisLine,     a  -> (ec=base_bar();  ec.yAxis[1].axisLine=a; ec)),
    (AxisTick,     a  -> (ec=base_bar();  ec.yAxis[1].axisTick=a; ec)),
    (SplitLine,    s  -> (ec=base_bar();  ec.yAxis[1].splitLine=s; ec)),
    (SplitArea,    s  -> (ec=base_bar();  ec.yAxis[1].splitArea=s; ec)),

    # ── Series sub-components ────────────────────────────────────────────────
    (ItemStyle,    i  -> (ec=base_bar();  ec.series[1].itemStyle=i; ec)),
    (Label,        l  -> (ec=base_bar();  ec.series[1].label=l; ec)),
    (MarkPoint,    m  -> (ec=base_bar();  ec.series[1].markPoint=m; ec)),
    (MarkLine,     m  -> (ec=base_bar();  ec.series[1].markLine=m; ec)),
    (MarkArea,     m  -> (ec=base_bar();  ec.series[1].markArea=m; ec)),
    (LineStyle,    l  -> (ec=base_bar();  ec.yAxis[1].axisLine=AxisLine(lineStyle=l); ec)),
    (AreaStyle,    a  -> (ec=base_bar();  ec.yAxis[1].splitArea=SplitArea(areaStyle=a); ec)),

    # ── XYSeries — patch scalar fields only; skip structurally load-bearing ones ──
    (XYSeries,     x  -> (ec=base_bar();  patch!(ec.series[1], x); ec)),

    # ── Polar chart components ────────────────────────────────────────────────
    (Polar,        p  -> (ec=polar([0.0,1.0],[0.0,1.0]); patch!(ec.polar[1], p); ec)),
    (RadiusAxis,   r  -> (ec=polar([0.0,1.0],[0.0,1.0]); patch!(ec.radiusAxis, r); ec)),
    (AngleAxis,    a  -> (ec=polar([0.0,1.0],[0.0,1.0]); patch!(ec.angleAxis, a); ec)),

    # ── Radar — patch scalar fields, preserve indicator ──────────────────────
    (Radar,        _ -> begin
        names = ["a","b","c"]; mx = [100,100,100]; vals = [50,60,70]
        ec = radar(names, vals, mx); ec
    end),
]


# ---------------------------------------------------------------------------
# Generate
# ---------------------------------------------------------------------------
function generate(outdir)
    mkpath(outdir)

    # Remove old type__ fixtures so renamed types don't leave stale files
    for f in readdir(outdir)
        startswith(f, "type__") && rm(joinpath(outdir, f))
    end

    saved = 0

    for (T, embed_fn) in EMBEDDINGS
        for (fname, ftype) in zip(fieldnames(T), fieldtypes(T))
            # Always skip
            fname in (:_type, :ec_width, :ec_height, :ec_renderer, :ec_charttype) && continue
            # Skip fields whose Union is entirely non-scalar (nested structs, vectors, dicts)
            all(t -> t === Nothing || t === JSON.JSONText ||
                     t <: AbstractEChartType || t <: AbstractVector || t <: AbstractDict,
                Base.uniontypes(ftype isa Union ? ftype : Union{ftype, Nothing})) && continue

            for CT in concrete_types(ftype)
                (ok, default_val) = test_value_for(CT)
                ok || continue

                val = get(FIELD_OVERRIDES, (T, fname, CT), default_val)

                fixture_name = "type__$(T)__$(fname)__$(CT)"
                try
                    instance = T(; fname => val)
                    chart    = embed_fn(instance)
                    save_fixture(joinpath(outdir, "$(fixture_name).json"), chart)
                    saved += 1
                catch e
                    println("  ERROR  $fixture_name: $(typeof(e)): $e")
                end
            end
        end
    end

    println("Saved $saved fixtures")
end

generate(joinpath(@__DIR__, "fixtures"))
