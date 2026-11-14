extends Control

@onready var main = get_node("/root/main")

@onready var menu: Control = $".."

@onready var debug: Button = $Debug
@onready var back: Button = $Back

func _ready() -> void:
	back.pressed.connect(menu.goback.bind(self))
	debug.pressed.connect(goto_debug)

func goto_debug() -> void:
	main.load_lvl("debug")
