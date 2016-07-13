visualmap_spec =
[
    # (:zlevel, Int, 0),
    # (:z, Int, 4),
    # (:show, Bool, false),
	# (:orient, String, "horizontal"),
    # (:x, Union{String, Number}, nothing),
    # (:y, Union{String, Number}, nothing),
    # (:width, Number, nothing),
    # (:height, Number, nothing),
	# (:backgroundColor, String, nothing),
	# (:dataBackgroundColor, String, "#eee"),
	# (:fillerColor, String, "rgba(144,197,237,0.2)"),
	# (:handleColor, String, "rgba(70,130,180,0.8)"),
	# (:handleSize, Number, 8),
	# (:xAxisIndex, Union{Number, AbstractVector}, nothing),
	# (:yAxisIndex, Union{Number, AbstractVector}, nothing),
    (:_type, String, nothing),
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
