extends Control

@onready var player: CharacterBody3D = $"../../PLayer"

@onready var menu: Control = $".."
@onready var level_con: Node3D = $"../../level_con"

@onready var debug: Button = $Debug
@onready var back: Button = $Back

const DEBUG = preload("uid://btu530iyamiyy")

func _ready() -> void:
	back.pressed.connect(menu.goback.bind(self))
	debug.pressed.connect(goto_debug)

func goto_debug() -> void:
	load_lvl(DEBUG)

func load_lvl(scene: PackedScene) -> void:
	for child in level_con.get_children():
		child.queue_free()
	self.hide()
	level_con.add_child(scene.instantiate())
	player._spawn()
