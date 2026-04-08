# geolines

```@docs
geolines
```

```@example
using ECharts

# Intercontinental flight routes from major hubs
start_lons = [-87.90, -73.78, 2.55,  13.29, 37.41, 139.78, 103.99, 151.18]
start_lats = [ 41.98,  40.64, 49.01, 52.37, 55.97,  35.55,   1.36, -33.95]
end_lons   = [  2.55,   2.55, 13.29,-87.90,-87.90, -87.90, -73.78,   2.55]
end_lats   = [ 49.01,  49.01, 52.37, 41.98, 41.98,  41.98,  40.64,  49.01]

ec = geolines(start_lons, start_lats, end_lons, end_lats; effect = true)
title!(ec, text = "Intercontinental Flight Routes", subtext = "Animated trail effect")
ec
```
