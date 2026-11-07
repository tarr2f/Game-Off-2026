extends CharacterBody3D

@onready var cam_node: Node3D = $CamNode
@onready var ray_cast_3d: RayCast3D = $CamNode/RayCast3D

var def_speed = 5.0
var speed = 5.0
const jump_vel = 6.5
var mouse_sens: float = 0.005

var peak_beefal: float = 0.0
var bouceclamp: float = 35
var repulsion_force: float = 5.0

var spd_multipl = 3

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_motion: Vector2 = event.relative
		rotate_y(-(mouse_motion.x * mouse_sens))
		cam_node.rotate_x(-(mouse_motion.y * mouse_sens))
		cam_node.rotation.x = deg_to_rad(clamp(rad_to_deg(cam_node.rotation.x), -90, 90))
	if Input.is_action_just_pressed("use"):
		print("DEBUG // velocity: ", velocity)
	if Input.is_action_just_pressed("use"):
		spd_multipl = spd_multipl + 1
		print(spd_multipl)

func _process(delta: float) -> void:
	gungun.shoot(ray_cast_3d)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * 1.75 * delta
		if velocity.y < 0.0:
			peak_beefal = velocity.y
	else:
		if velocity.y <= 0.0:
			peak_beefal = 0.0

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

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider:
			if collider.is_in_group("boucy"):
				if collision.get_normal().dot(Vector3.UP) > 0.5:
					if peak_beefal < 0.0:
						velocity.y = clampf(peak_beefal * -1, 0, bouceclamp)
					else:
						peak_beefal = 0
			
			if collider.is_in_group("speedy"):
				speed = def_speed * 2
			else:
				speed = def_speed

			# TODO: fix it
			if collider.is_in_group("repulsion"):
				var grav_area = collider.get_node_or_null("GravArea")
				if grav_area:
					var repulsion_dir = global_position - grav_area.global_position
					repulsion_dir.y = 0.0
					var repulsion_vec = repulsion_dir.normalized() * repulsion_force
					velocity = velocity + repulsion_vec

	move_and_slide()
