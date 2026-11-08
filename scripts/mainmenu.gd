extends Control

@onready var levels: Button = $Levels
@onready var settings: Button = $Settings
@onready var exit: Button = $Exit

const DEBUG = preload("uid://btu530iyamiyy")

func _ready() -> void:
	exit.pressed.connect(on_exit)
	levels.pressed.connect(on_levels)

func on_exit() -> void:
	get_tree().quit()

func on_levels() -> void:
	get_tree().change_scene_to_file("res://Scenes/debug.tscn")
