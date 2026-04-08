# geoscatter

```@docs
geoscatter
```

```@example
using ECharts

# Major world cities
lons = [2.35, -0.12, 13.40,  37.62, 139.69, -87.63, -43.17, 151.21,
       28.95, 72.88, 116.40, -99.13, 103.82, -58.38, 31.24,  121.47]
lats = [48.85, 51.51, 52.52, 55.75,  35.69,  41.85, -22.91, -33.87,
        41.01, 19.08, 39.90,  19.43,  1.35, -34.60, 30.06,  31.23]
population = [2.2, 9.0, 3.6, 12.5, 13.9, 2.7, 13.4, 5.3,
              15.5, 20.7, 21.5, 21.6, 5.9, 15.1, 10.1, 26.3]  # millions

ec = geoscatter(lons, lats, population; symbol_size = 15)
title!(ec, text = "World Cities by Population", subtext = "Colour = population (millions)")
ec
```
