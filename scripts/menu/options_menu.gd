extends Control

@onready var back_button: Button = $MarginContainer/VBoxContainer/ButtonVBox/BackButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_button.grab_focus()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
