extends Node


func start_game() -> void:
	# Handle all the game start logic
	
	# Stops the menu scene
	Music.stop()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
