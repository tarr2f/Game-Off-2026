extends ColorRect

func _process(delta: float) -> void:
	match gungun.guntype:
		1:
			color = Color.ROYAL_BLUE
		2:
			color = Color.INDIAN_RED
		3:
			color = Color.LIGHT_GREEN
		4:
			color = Color.LIGHT_SKY_BLUE
		_:
			color = Color.WHITE
