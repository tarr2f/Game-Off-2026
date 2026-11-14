extends Control

@onready var player: CharacterBody3D = $"../../PLayer"
@onready var main: Node3D = $"../.."
@onready var _main: Control = $"../_main"

@onready var resume: Button = $Resume
@onready var settings: Button = $Settings
@onready var menu: Button = $Menu

func _ready() -> void:
	resume.pressed.connect(goto_resume)
	menu.pressed.connect(goto_menu)

func goto_resume() -> void:
	run()

func goto_menu() -> void:
	main.unload_lvl()
	self.hide()
	main.show()

func run() -> void:
	if player.isplaying == true:
		self.show()
		player.isplaying = false
		player._physics_process(false)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		self.hide()
		player.isplaying = true
		player._physics_process(true)
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
