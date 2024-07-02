extends Control

@onready var game = get_parent().get_parent().get_parent()
@onready var resume_button: Button = $MarginContainer/VBoxContainer/ButtonVBox/ResumeButton

func _on_resume_button_pressed() -> void:
	game.pause_game()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
