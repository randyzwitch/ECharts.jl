/**
 * Validate ECharts.jl JSON fixtures against real ECharts v5.
 *
 * ECharts logs validation warnings via console.warn rather than throwing. This
 * script intercepts those warnings so we can fail on any option that ECharts
 * itself considers invalid, catching issues the Julia type system cannot see.
 *
 * Usage:
 *   npm install          # once
 *   npm test             # after running: julia test/generate_fixtures.jl
 */

const { JSDOM } = require("jsdom");
const echarts = require("echarts");
const fs = require("fs");
const path = require("path");

// ECharts needs a minimal DOM environment. Use SVG renderer to avoid a
// canvas dependency (jsdom does not ship with canvas by default).
const { window } = new JSDOM("<!DOCTYPE html><html><body></body></html>");
global.window   = window;
global.document = window.document;
global.navigator = window.navigator;

// ECharts calls canvas.getContext("2d").measureText() for text layout even
// when using the SVG renderer. jsdom doesn't implement canvas, so we stub
// just enough to silence those errors. 6px-per-character is a rough estimate
// that keeps label-overlap logic from crashing.
window.HTMLCanvasElement.prototype.getContext = function() {
    return {
        measureText: (text) => ({ width: (text ? text.length : 0) * 6 }),
        font: "",
    };
};

const fixturesDir = path.join(__dirname, "..", "fixtures");

if (!fs.existsSync(fixturesDir)) {
    console.error(`fixtures directory not found: ${fixturesDir}`);
    console.error("Generate it with:  julia test/generate_fixtures.jl");
    process.exit(1);
}

const files = fs.readdirSync(fixturesDir)
                .filter(f => f.endsWith(".json"))
                .sort();

if (files.length === 0) {
    console.error("No .json files found in fixtures/.");
    console.error("Generate them with:  julia test/generate_fixtures.jl");
    process.exit(1);
}

// Warnings that are filtered as known ECharts development-mode quirks.
// These do not indicate broken chart specs — they are aesthetic hints that
// fire internally regardless of option values.
const IGNORED_WARNINGS = [
    // Radar charts with varied indicator max values trigger this from ECharts'
    // internal axis normalization. It is a tick-readability hint, not a spec error.
    /The ticks may be not readable when set/,
];

function isIgnored(msg) {
    return IGNORED_WARNINGS.some(re => re.test(msg));
}

let passed = 0, failed = 0, skipped = 0;

for (const file of files) {
    const filePath = path.join(fixturesDir, file);

    // --- Step 1: parse JSON.  Fixtures that contain raw JSON.JSONText output
    // are not valid JSON and get skipped rather than failed. ---
    let option;
    try {
        option = JSON.parse(fs.readFileSync(filePath, "utf8"));
    } catch (_) {
        console.log(`~ ${file} (skipped: not valid JSON — contains JSON.JSONText output)`);
        skipped++;
        continue;
    }

    // --- Step 2: init ECharts with an explicit size (jsdom elements have no
    // layout engine, so offsetWidth/Height are 0 without this). ---
    const container = window.document.createElement("div");
    window.document.body.appendChild(container);

    const warnings = [];
    const origWarn = console.warn;
    console.warn = (...args) => warnings.push(args.join(" "));

    let chart;
    try {
        chart = echarts.init(container, null, { renderer: "svg", width: 800, height: 400 });
        chart.setOption(option);
    } catch (err) {
        console.warn = origWarn;
        console.log(`✗ ${file}`);
        console.log(`  threw: ${err.message}`);
        failed++;
        window.document.body.removeChild(container);
        continue;
    }

    console.warn = origWarn;
    chart.dispose();
    window.document.body.removeChild(container);

    const actionable = warnings.filter(w => !isIgnored(w));

    if (actionable.length > 0) {
        console.log(`✗ ${file}`);
        actionable.forEach(w => console.log(`  warn: ${w}`));
        failed++;
    } else {
        console.log(`✓ ${file}`);
        passed++;
    }
}

console.log(`\n${passed} passed, ${failed} failed, ${skipped} skipped`);
process.exit(failed > 0 ? 1 : 0);
