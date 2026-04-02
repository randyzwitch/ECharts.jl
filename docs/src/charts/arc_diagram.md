# arcdiagram

```@docs
arcdiagram
```

```@example
using ECharts
# Fellowship of the Ring — characters who share significant scenes
characters = ["Frodo", "Sam", "Gandalf", "Aragorn", "Legolas",
              "Gimli", "Boromir", "Pippin", "Merry", "Faramir"]
links = [["Frodo","Sam"],     ["Frodo","Gandalf"],  ["Frodo","Aragorn"],
         ["Frodo","Pippin"],  ["Frodo","Merry"],    ["Sam","Gandalf"],
         ["Gandalf","Aragorn"],["Aragorn","Legolas"],["Aragorn","Gimli"],
         ["Aragorn","Boromir"],["Legolas","Gimli"],  ["Pippin","Merry"],
         ["Boromir","Faramir"],["Frodo","Boromir"]]
ec = arcdiagram(characters, links)
title!(ec, text = "The Lord of the Rings — Character Co-appearances")
ec
```

With edge weights representing number of shared scenes:

```@example weighted
using ECharts
characters = ["Frodo", "Sam", "Gandalf", "Aragorn", "Legolas", "Gimli"]
links      = [["Frodo","Sam"],      ["Frodo","Gandalf"],   ["Frodo","Aragorn"],
              ["Gandalf","Aragorn"],["Aragorn","Legolas"],  ["Aragorn","Gimli"],
              ["Legolas","Gimli"],  ["Sam","Gandalf"]]
weights    = [42.0, 28.0, 15.0, 20.0, 18.0, 16.0, 14.0, 12.0]
ec = arcdiagram(characters, links, weights)
title!(ec, text = "Fellowship — Shared Scene Count")
ec
```
