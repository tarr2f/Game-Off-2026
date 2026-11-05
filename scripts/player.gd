extends CharacterBody3D

@onready var cam_node: Node3D = $CamNode
@onready var ray_cast_3d: RayCast3D = $CamNode/RayCast3D

const speed = 5.0
const jump_vel = 6.5
var mouse_sens: float = 0.005

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_motion: Vector2 = event.relative
		rotate_y(-(mouse_motion.x * mouse_sens))
		cam_node.rotate_x(-(mouse_motion.y * mouse_sens))
		cam_node.rotation.x = deg_to_rad(clamp(rad_to_deg(cam_node.rotation.x), -90, 90))

func _process(delta: float) -> void:
	gungun.shoot(ray_cast_3d)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * 1.75 * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_vel

	var input_dir := Input.get_vector("left", "right", "forwards", "backwards")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
