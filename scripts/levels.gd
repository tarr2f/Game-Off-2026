extends CanvasLayer

@onready var main = get_node("/root/main")

@onready var menu: Control = $".."
@onready var tutorial1: Button = $Tutorial1


@onready var back: Button = $Back

func _ready() -> void:
	back.pressed.connect(menu.goback.bind(self))
	tutorial1.pressed.connect(goto_debug)

func goto_debug() -> void:
	main.load_lvl("tutorial1")
