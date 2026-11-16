extends CanvasLayer

@onready var main: Node3D = $"../.."

@onready var resume: Button = $Resume
@onready var settings: Button = $Settings
@onready var menu: Button = $Menu

func _ready() -> void:
	resume.pressed.connect(goto_resume)
	menu.pressed.connect(goto_menu)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		run()

func goto_resume() -> void:
	run()

func goto_menu() -> void:
	main.unload_lvl()
	get_tree().paused = false
	self.hide()
	main.show()

func run() -> void:
	if get_tree().paused == false:
		# show menu and pause game
		get_tree().paused = true
		self.show()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif get_tree().paused == true:
		# hide menu and resume game
		self.hide()
		get_tree().paused = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
