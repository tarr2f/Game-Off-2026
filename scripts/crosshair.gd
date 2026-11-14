extends ColorRect

func _process(delta: float) -> void:
	match gungun.guntype:
		1:
			color = Color.LIGHT_GREEN
		2:
			color = Color("#FF7525")
		3:
			color = Color("#2275FF")
		4:
			color = Color.LIGHT_SKY_BLUE
		_:
			color = Color.WHITE
