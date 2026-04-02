# populationpyramid

```@docs
populationpyramid
```

```@example
using ECharts
ages   = ["0–4","5–9","10–14","15–19","20–24","25–29","30–34","35–39",
          "40–44","45–49","50–54","55–59","60–64","65–69","70–74","75+"]
# US population estimates, 2023 (hundreds of thousands)
male   = [338, 323, 318, 324, 352, 381, 376, 352, 326, 315, 302, 279, 245, 203, 157, 198]
female = [323, 310, 305, 311, 338, 366, 362, 340, 316, 308, 299, 281, 252, 218, 176, 284]
ec = populationpyramid(ages, male, female)
title!(ec, text = "US Population Pyramid", subtext = "Estimated, 2023 (hundreds of thousands)")
ec
```

```@example
using ECharts, DataFrames
df = DataFrame(
    age    = ["0–4","5–9","10–14","15–19","20–24","25–29","30–34","35–39",
              "40–44","45–49","50–54","55–59","60–64","65–69","70–74","75+"],
    male   = [338, 323, 318, 324, 352, 381, 376, 352, 326, 315, 302, 279, 245, 203, 157, 198],
    female = [323, 310, 305, 311, 338, 366, 362, 340, 316, 308, 299, 281, 252, 218, 176, 284],
)
populationpyramid(df, :age, :male, :female)
```
