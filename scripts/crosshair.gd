extends ColorRect

func _process(delta: float) -> void:
	match gungun.guntype:
		1:
			color = Color.ROYAL_BLUE
		2:
			color = Color.INDIAN_RED
		_:
			color = Color.WHITE
