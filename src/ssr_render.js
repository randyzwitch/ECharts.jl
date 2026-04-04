// Server-side SVG rendering for ECharts.jl via NodeJS.jl.
// Reads a JSON payload from stdin, renders to SVG, writes SVG to stdout.
//
// Payload shape:
//   { "option": <ECharts setOption object>,
//     "width":  <int>,
//     "height": <int>,
//     "theme":  <theme object or null> }

const path = require('path');
const echarts = require(path.join(__dirname, 'echarts.min.js'));

const chunks = [];
process.stdin.on('data', d => chunks.push(d));
process.stdin.on('end', () => {
    const { option, width, height, theme } = JSON.parse(Buffer.concat(chunks).toString('utf8'));

    const chart = echarts.init(null, theme || null, {
        renderer: 'svg',
        ssr: true,
        width: width,
        height: height
    });

    chart.setOption(option);
    process.stdout.write(chart.renderToSVGString());
    chart.dispose();
});
