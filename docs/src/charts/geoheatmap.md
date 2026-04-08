# geoheatmap

```@docs
geoheatmap
```

```@example
using ECharts

# Earthquake epicentres with magnitude as intensity
lons = [139.7, -118.2, 37.6,  151.2, 103.8, -99.1, -43.2, 28.9,
        121.5, -58.4,  72.8,  -77.0,  2.3,  55.3, 144.8, -70.7,
        -46.6, 106.8,  23.7,   12.5]
lats = [35.7,   34.1,  55.8,  -33.9,   1.4,  19.4, -22.9,  41.0,
        25.0,  -34.6,  19.1,   -4.3,  48.9,  25.2,  13.4, -33.4,
        -23.5,  -6.2,  37.9,   41.9]
magnitudes = [7.2, 6.1, 5.8, 6.5, 6.0, 7.4, 5.5, 6.8,
              6.3, 5.9, 6.7, 5.4, 5.2, 6.1, 7.8, 6.4,
              5.7, 6.9, 5.3, 6.6]

ec = geoheatmap(lons, lats, magnitudes; blur_size = 40)
title!(ec, text = "Global Earthquake Epicentres", subtext = "Point size ~ magnitude")
ec
```
