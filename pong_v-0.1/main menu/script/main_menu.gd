class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/EXIT_Button as Button
@onready var start = preload("res://main menu/main_menu_1.tscn") as PackedScene

func _ready():
	start_button.pressed.connect(on_start)
	exit_button.pressed.connect(on_exit)
	
func on_start():
	get_tree().change_scene_to_packed(start)
	
func on_exit():
	get_tree().quit()
