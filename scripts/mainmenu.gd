extends Control

@onready var levels: Button = $_main/Levels
@onready var settings: Button = $_main/Settings
@onready var exit: Button = $_main/Exit

@onready var _main: CanvasLayer = $_main
@onready var _levels: CanvasLayer = $_levels
@onready var _deblevels: CanvasLayer = $_deblevels
@onready var _pausemenu: CanvasLayer = $"../_pausemenu"

func _ready() -> void:
	exit.pressed.connect(on_exit)
	levels.pressed.connect(jump_levels)
	
	_pausemenu.hide()
	_deblevels.hide()
	_levels.hide()

func on_exit() -> void:
	print("exiting...")
	get_tree().quit()
# NOTE: keep print in cause it apperently makes the func work

func jump_levels() -> void:
	if Input.is_action_pressed("alt"):
		_deblevels.show()
	else: _levels.show()
	_main.hide()

func goback(current: CanvasLayer) -> void:
	current.hide()
	_main.show()
