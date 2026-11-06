extends Node

var guntype: int = 0

func shoot(ray: RayCast3D) -> void:
	if ray.is_colliding() and Input.is_action_just_pressed("shoot"):
		if ray.get_collider() is RigidBody3D:
			match guntype:
				1:
					ray.get_collider().freeze = not ray.get_collider().freeze
					print("object frozen")
				_:
					print("if its set to do nothing, nothing happens") 
					# TODO - add stuff

# omega debug - remove in playable build of game
func _process(float) -> void:
	if Input.is_action_just_pressed("ui_page_up"):
		guntype = guntype + 1
	if Input.is_action_just_pressed("ui_page_down"):
		guntype = guntype - 1
