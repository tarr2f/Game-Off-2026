extends Control

@onready var player: CharacterBody3D = $"../PLayer"

@onready var levels: Button = $_main/Levels
@onready var settings: Button = $_main/Settings
@onready var exit: Button = $_main/Exit

@onready var _main: Control = $_main
@onready var _levels: Control = $_levels
@onready var _deblevels: Control = $"_deblevels"
@onready var _pause: Control = $_pause

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc") and player.isplaying == true:
		_pause.run()

func _ready() -> void:
	exit.pressed.connect(on_exit)
	levels.pressed.connect(jump_levels)
	_pause.hide()

func on_exit() -> void:
	get_tree().quit()

func jump_levels() -> void:
	if Input.is_action_pressed("alt"):
		_deblevels.show()
	else: _levels.show()
	_main.hide()

func goback(current: Control) -> void:
	current.hide()
	_main.show()
