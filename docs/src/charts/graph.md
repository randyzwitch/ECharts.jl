# graph

```@docs
graph
```

```@example
using ECharts
nodes = ["Python", "NumPy", "Pandas", "Matplotlib", "Scikit-learn",
         "TensorFlow", "PyTorch", "Jupyter", "FastAPI", "Requests"]
links = [["Python","NumPy"],       ["Python","Pandas"],      ["Python","Matplotlib"],
         ["Python","Scikit-learn"],["Python","TensorFlow"],  ["Python","PyTorch"],
         ["Python","Jupyter"],     ["Python","FastAPI"],     ["Python","Requests"],
         ["NumPy","Pandas"],       ["NumPy","Scikit-learn"], ["Pandas","Matplotlib"],
         ["TensorFlow","Jupyter"], ["PyTorch","Jupyter"]]
ec = graph(nodes, links)
title!(ec, text = "Python Data Science Ecosystem")
ec
```
