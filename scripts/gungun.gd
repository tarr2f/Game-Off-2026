extends Node

var guntype: int = 0

func shoot(ray: RayCast3D) -> void:
	if ray.is_colliding() and Input.is_action_just_pressed("shoot"):
		if ray.get_collider() is RigidBody3D:
			ray.get_collider().freeze = not ray.get_collider().freeze
			print("object shot")
		else:
			print("DEBUG || " and ray.get_collider())
