# parallel

```@docs
parallel
```

```@example
using ECharts

# Each row is a car model: [horsepower, mpg, weight (lbs/100), 0-60 mph (sec), price ($k)]
# High-performance cars: high HP, low mpg, heavy, fast, expensive
# Economy cars: low HP, high mpg, light, slower, cheap
# SUVs: moderate HP, low mpg, very heavy, moderate speed, moderate price
data = [
    310.0  18.0  43.0  5.2  52.0;   # Sports car A
    450.0  14.0  47.0  4.1  88.0;   # Sports car B
    275.0  20.0  39.0  5.8  45.0;   # Sports car C
    130.0  38.0  28.0  8.4  24.0;   # Economy A
    110.0  42.0  25.0  9.1  19.0;   # Economy B
    145.0  35.0  30.0  7.9  27.0;   # Economy C
    280.0  21.0  52.0  7.2  48.0;   # SUV A
    240.0  23.0  49.0  7.8  41.0;   # SUV B
    320.0  17.0  55.0  6.5  62.0;   # SUV C
]
dims = ["Horsepower", "MPG", "Weight (100 lbs)", "0-60 (sec)", "Price (\$k)"]
parallel(data, dims)
```
