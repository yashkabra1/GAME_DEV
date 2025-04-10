extends Control



@onready var join_button = $join_Button as Button
@onready var back_button = $back_Button as Button
@onready var join = preload("res://multiplayer/multiplayer.tscn") as PackedScene
@onready var back = load("res://main menu/multiplayer.tscn") as PackedScene

func _ready():
	join_button.pressed.connect(on_join)
	back_button.pressed.connect(on_back)
	
func _input(event):
	if event.is_action_pressed("esc"):
		on_back()

func on_join():
	get_tree().change_scene_to_packed(join)

func on_back():
	get_tree().change_scene_to_packed(back)
