extends Control


@onready var host_button = $MarginContainer/HBoxContainer/VBoxContainer/host as Button
@onready var Join_button = $MarginContainer/HBoxContainer/VBoxContainer/join as Button
@onready var back_button = $MarginContainer/HBoxContainer/VBoxContainer/back as Button
@onready var host = preload("res://main menu/host.tscn") as PackedScene
@onready var join = preload("res://main menu/join.tscn") as PackedScene
@onready var back = load("res://main menu/main_menu_1.tscn") as PackedScene

func _ready():
	host_button.button_down.connect(on_host)
	Join_button.button_down.connect(on_join)
	back_button.button_down.connect(on_back)

func _input(event):
	if event.is_action_pressed("esc"):
		on_back()

func on_host():
	get_tree().change_scene_to_packed(host)
	
func on_join():
	get_tree().change_scene_to_packed(join)
	
func on_back():
	get_tree().change_scene_to_packed(back)
