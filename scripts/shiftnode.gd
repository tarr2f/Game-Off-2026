extends CSGSphere3D

func _physics_process(delta: float) -> void:
	rotation_degrees = Vector3(randi_range(-180, 180), randi_range(-180, 180), randi_range(-180, 180))
