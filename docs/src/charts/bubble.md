# bubble

```@docs
bubble
```

```@example
using ECharts, Random
Random.seed!(13579)
xval = rand() .* (0:1000:30000)
yval = 60 .+ (rand(31) * 20)
sizeval = shuffle!(6000 .* (rand(31) * 50))
bubble(xval, yval, sizeval, scale = true)
```
