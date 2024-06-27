extends Node


func start_game() -> void:
	Engine.time_scale = 1
	# Stops the menu scene
	get_tree().change_scene_to_file("res://scenes/game.tscn")
