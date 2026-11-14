extends Node3D

@onready var player: CharacterBody3D = $PLayer
@onready var level_con: Node3D = $level_con
@onready var menu: Control = $Menu
@onready var _main: Control = $Menu/_main
@onready var crosshair: ColorRect = $PLayer/CanvasLayer/ColorRect

func load_lvl(scene: String) -> void:
	var scene_pth = "res://scenes/" + scene + ".tscn"
	for child in level_con.get_children():
		child.queue_free()
	for child in menu.get_children():
		child.hide()
	level_con.add_child(load(scene_pth).instantiate())
	if level_con.get_child_count() > 0:
		print_rich("[color=green]Scene:[/color] changed to ", scene_pth)
		player._spawn()

func unload_lvl() -> void:
	for child in level_con.get_children():
		child.queue_free()
	if level_con.get_child_count() < 1:
		print_rich("[color=green]Scene:[/color] current unloaded")
	_main.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	crosshair.visible = false
