extends Control


@onready var create_button = $create_button as Button
@onready var back_button = $back_Button as Button
@onready var create = preload("res://multiplayer/multiplayer.tscn") as PackedScene
@onready var back = load("res://main menu/multiplayer.tscn") as PackedScene

func _ready():
	create_button.pressed.connect(on_create)
	back_button.pressed.connect(on_back)
	
func _input(event):
	if event.is_action_pressed("esc"):
		on_back()

func on_create():
	get_tree().change_scene_to_packed(create)

func on_back():
	get_tree().change_scene_to_packed(back)
