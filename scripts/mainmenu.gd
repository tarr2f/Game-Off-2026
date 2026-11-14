extends Control

@onready var levels: Button = $_main/Levels
@onready var settings: Button = $_main/Settings
@onready var exit: Button = $_main/Exit

@onready var _main: Control = $_main
@onready var _levels: Control = $_levels
@onready var _deblevels: Control = $"_deblevels"


func _ready() -> void:
	exit.pressed.connect(on_exit)
	levels.pressed.connect(jump_levels)

func on_exit() -> void:
	get_tree().quit()

func jump_levels() -> void:
	if Input.is_action_pressed("alt"):
		_deblevels.show()
	_levels.show()
	_main.hide()

func goback(current: Control) -> void:
	current.hide()
	_main.show()
