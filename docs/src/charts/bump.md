# bump

```@docs
bump
```

```@example
using ECharts
years    = ["2019", "2020", "2021", "2022", "2023", "2024"]
# Subscriber counts (millions) — higher value = higher rank
netflix  = [167, 204, 222, 231, 260, 269]
disney   = [  0,  95, 130, 152, 150, 153]
amazon   = [150, 175, 200, 168, 200, 215]
hbomax   = [ 38,  61,  73, 122,  95, 110]
hulu     = [ 28,  39,  43,  48,  50,  51]
values   = hcat(netflix, disney, amazon, hbomax, hulu)
ec = bump(years, Float64.(values), names = ["Netflix", "Disney+", "Amazon", "HBO Max", "Hulu"])
title!(ec, text = "Streaming Service Subscribers", subtext = "Millions of paid subscribers")
ec
```

From a DataFrame:

```@example df
using ECharts, DataFrames
# TIOBE-style popularity index (% share) for top programming languages, 2019–2024
languages = ["Python", "Java", "C/C++", "JavaScript", "Go"]
years     = repeat(2019:2024, inner = 5)
ratings   = [ 8.5, 16.0, 15.2, 9.7, 1.2,
               9.7, 14.5, 15.8, 9.8, 1.5,
              11.3, 12.0, 14.1, 9.1, 1.8,
              13.2, 11.5, 13.6, 8.8, 2.4,
              14.8, 10.9, 12.4, 9.2, 2.9,
              16.1, 10.2, 11.8, 8.5, 3.5]
df = DataFrame(year = years, language = repeat(languages, outer = 6), rating = Float64.(ratings))
ec = bump(df, :year, :rating, :language)
title!(ec, text = "Programming Language Popularity", subtext = "TIOBE-style index share %, 2019–2024")
ec
```
