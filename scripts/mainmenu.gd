extends Control

@onready var levels: Button = $_main/Levels
@onready var settings: Button = $_main/Settings
@onready var exit: Button = $_main/Exit

@onready var _main: Control = $_main
@onready var _levels: Control = $_levels


func _ready() -> void:
	exit.pressed.connect(on_exit)
	levels.pressed.connect(jump_levels)
	_levels.hide()
	

func on_exit() -> void:
	get_tree().quit()

func jump_levels() -> void:
	_main.hide()
	_levels.show()

func goback(current: Control) -> void:
	current.hide()
	_main.show()
