extends Control

@onready var start_button: Button = $MarginContainer/VBoxContainer/ButtonsVBox/StartButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.grab_focus()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/credits_menu.tscn")


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/options_menu.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
