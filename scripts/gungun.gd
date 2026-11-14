extends Node

var guntype: int = 0
const modecount = 3

# NOTE: dont do more then 1 cause it breaks
var propbounce: float = 1.0

func shoot(ray: RayCast3D) -> void:
	if ray.is_colliding() and Input.is_action_just_pressed("shoot"):
		if ray.get_collider() is RigidBody3D:
			var target = ray.get_collider()
			match guntype:
				1:
					target.freeze = not ray.get_collider().freeze
					print("object frozen")
				2:
					groupswch(target, "speedy")
				3:
					groupswch(target, "boucy")
					toggle_bouncyprop(target)
				4:
					groupswch(target, "repulsion")
				_:
					print("if its set to do nothing, nothing happens") 
					# TODO - add stuff and remember to change modecount you idiot

# HACK: omega debug - remove in playable build of game
func _process(float) -> void:
	if Input.is_action_just_pressed("wheel_up"):
		guntype = clamp(guntype + 1, 0, modecount)
		print("mode: ", guntype)
	if Input.is_action_just_pressed("wheel_down"):
		guntype = clamp(guntype - 1, 0, modecount)
		print("mode: ", guntype)

func groupswch(target: RigidBody3D, group: String) -> void:
	if target.is_in_group(group):
		target.remove_from_group(group)
		print("object de", group + "d")
	else:
		target.add_to_group(group)
		print("object ", group + "d")

func toggle_bouncyprop(target: RigidBody3D) -> void:
	if target.is_in_group("prop") and target.physics_material_override:
		if target.physics_material_override.bounce == propbounce:
			target.physics_material_override.bounce = 0.0
		else:
			target.physics_material_override.bounce = propbounce
