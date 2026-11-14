extends Node3D

@onready var player: CharacterBody3D = $PLayer
@onready var level_con: Node3D = $level_con
@onready var menu: Control = $Menu

func load_lvl(scene: String) -> void:
	var scene_pth = "res://scenes/" + scene + ".tscn"
	for child in level_con.get_children():
		child.queue_free()
	for child in menu.get_children():
		child.hide()
	level_con.add_child(load(scene_pth).instantiate())
	if level_con.get_child_count() > 0:
		player._spawn()
