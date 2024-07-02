extends Control

@onready var max_height_value: Label = $MarginContainer/VBoxContainer/StatusVBox/MaxHeightHBox/MaxHeightValue
@onready var height_value: Label = $MarginContainer/VBoxContainer/StatusVBox/HeightHBox/HeightValue
@onready var score_value: Label =  $MarginContainer/VBoxContainer/StatusVBox/ScoreHBox/ScoreValue
@onready var restart_button: Button =  $MarginContainer/VBoxContainer/ButtonsVBox/RestartButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_height_value.text = str(GameManager.max_height)
	height_value.text = str(GameManager.height)
	score_value.text = str(GameManager.score)
	restart_button.grab_focus()


func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
