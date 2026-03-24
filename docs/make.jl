using Documenter
using ECharts

# Tell ECharts to skip inlining echarts.min.js — it's loaded once as a page asset below.
ENV["ECHARTS_DOCS_BUILD"] = "true"

# Wrap echarts.min.js so it doesn't conflict with Documenter's RequireJS.
# Echarts detects `define` and tries to register as an anonymous AMD module,
# which RequireJS rejects. Hiding `define` during load prevents this.
let echarts_src = read(joinpath(@__DIR__, "../src/echarts.min.js"), String)
    wrapped = """
(function() {
    var _define = window.define;
    window.define = undefined;
    $echarts_src
    window.define = _define;
}());
"""
    write(joinpath(@__DIR__, "src/assets/echarts.min.js"), wrapped)
end

makedocs(
    sitename = "ECharts.jl",
    modules = [ECharts],
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", nothing) == "true",
        assets = ["assets/echarts.min.js"],
        size_threshold = 512 * 1024,
        size_threshold_warn = 256 * 1024,
    ),
    pages = [
        "Home" => "index.md",
        "Charts" => "charts.md",
        "Modifier Functions" => "functions.md",
        "API Reference" => "api.md",
    ],
    checkdocs = :exports,
    warnonly = true,
)

deploydocs(
    repo = "github.com/randyzwitch/ECharts.jl.git",
    devbranch = "master",
)

# siteinfo.js and versions.js are only generated during real deployments;
# create stubs so local previews don't log 404 errors for them.
if !isfile(joinpath(@__DIR__, "build/siteinfo.js"))
    write(joinpath(@__DIR__, "build/siteinfo.js"),
          "var DOCUMENTER_CURRENT_VERSION = \"dev\";\n" *
          "var DOCUMENTER_NEWEST = \"dev\";\n" *
          "var DOCUMENTER_STABLE = \"\";\n")
end
if !isfile(joinpath(@__DIR__, "versions.js"))
    write(joinpath(@__DIR__, "versions.js"),
          "var DOCUMENTER_VERSIONS = [\"dev\"];\n")
end
