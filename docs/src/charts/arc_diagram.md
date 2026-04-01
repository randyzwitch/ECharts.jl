# arc_diagram

```@docs
arc_diagram
```

```@example
using ECharts
nodes = ["Alice", "Bob", "Carol", "Dave", "Eve"]
links = [["Alice","Bob"], ["Alice","Carol"], ["Bob","Dave"],
         ["Carol","Dave"], ["Carol","Eve"], ["Dave","Eve"]]
arc_diagram(nodes, links)
```

```@example
using ECharts
nodes = ["A", "B", "C", "D", "E"]
links = [["A","B"], ["B","C"], ["C","D"], ["D","E"], ["A","C"], ["B","D"]]
weights = [10.0, 7.0, 5.0, 8.0, 3.0, 6.0]
arc_diagram(nodes, links, weights)
```
