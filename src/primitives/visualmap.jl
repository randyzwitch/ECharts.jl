visualmap_spec =
[
    # (:zlevel, Int, 0),
    # (:z, Int, 4),
    # (:show, Bool, false),
	# (:orient, AbstractString, "horizontal"),
    # (:x, Union{AbstractString, Number}, nothing),
    # (:y, Union{AbstractString, Number}, nothing),
    # (:width, Number, nothing),
    # (:height, Number, nothing),
	# (:backgroundColor, AbstractString, nothing),
	# (:dataBackgroundColor, AbstractString, "#eee"),
	# (:fillerColor, AbstractString, "rgba(144,197,237,0.2)"),
	# (:handleColor, AbstractString, "rgba(70,130,180,0.8)"),
	# (:handleSize, Number, 8),
	# (:xAxisIndex, Union{Number, AbstractVector}, nothing),
	# (:yAxisIndex, Union{Number, AbstractVector}, nothing),
    (:_type, AbstractString, nothing),
    #(:start, Number, 60),
    #(:_end, Number, 80),
    # (:showDetail, Bool, true),
    # (:realtime, Bool, false),
    # (:zoomLock, Bool, false)

]

primitivefactory(:VisualMap, visualmap_spec)

# visualMap
# (u'type', u'continuous')
# (u'type', u'piecewise')
