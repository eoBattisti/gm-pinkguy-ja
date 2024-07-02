extends Node

var score: int = 0
var height: int = 0
var max_height: int = 0

func start_game() -> void:
	#Engine.time_scale = 1
	# Stops the menu scene
	pass

func add_score() -> void:
	score += 1

func set_height(value: int) -> void:
	height = value * -1
