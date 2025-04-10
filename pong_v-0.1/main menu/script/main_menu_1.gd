extends Control

@onready var singleplayer_button = $MarginContainer/HBoxContainer/VBoxContainer/singleplayer_button as Button
@onready var multiplayer_button = $MarginContainer/HBoxContainer/VBoxContainer/multiplayer_button as Button
@onready var back_button = $MarginContainer/HBoxContainer/VBoxContainer/Back_button as Button
@onready var single = preload("res://main menu/main_menu_2.tscn") as PackedScene
@onready var multi = preload("res://main menu/multiplayer.tscn") as PackedScene
@onready var back = load("res://main menu/main_menu.tscn") as PackedScene

func _ready():
	singleplayer_button.pressed.connect(on_single)
	multiplayer_button.pressed.connect(on_multi)
	back_button.pressed.connect(on_back)
	
func _input(event):
	if event.is_action_pressed("esc"):
		on_back()

func on_single():
	get_tree().change_scene_to_packed(single)

func on_multi():
	get_tree().change_scene_to_packed(multi)
	
func on_back():
	get_tree().change_scene_to_packed(back)
