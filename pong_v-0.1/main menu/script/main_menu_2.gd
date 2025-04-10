extends Control

@onready var arcade_button = $MarginContainer/HBoxContainer/VBoxContainer/arcade_button as Button
@onready var ai_button = $MarginContainer/HBoxContainer/VBoxContainer/ai_button as Button
@onready var back_button = $MarginContainer/HBoxContainer/VBoxContainer/back_Button as Button
@onready var arcade = preload("res://main.tscn") as PackedScene
@onready var ai = preload("res://ai/ai.tscn") as PackedScene
@onready var back = load("res://main menu/main_menu_1.tscn") as PackedScene

func _ready():
	arcade_button.pressed.connect(on_arcade)
	ai_button.pressed.connect(on_ai)
	back_button.pressed.connect(on_back)
	
func _input(event):
	if event.is_action_pressed("esc"):
		on_back()

func on_arcade():
	get_tree().change_scene_to_packed(arcade)

func on_ai():
	get_tree().change_scene_to_packed(ai)
	
func on_back():
	get_tree().change_scene_to_packed(back)
