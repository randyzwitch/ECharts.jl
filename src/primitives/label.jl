labelopts_spec =

[
(:show, Bool, false),
(:textStyle, TextStyle, nothing),
]

primitivefactory(:LabelOpts, labelopts_spec)

label_spec =

[
(:normal, LabelOpts, nothing),
(:emphasis, LabelOpts, nothing)
]

primitivefactory(:Label, label_spec)
