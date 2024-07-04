extends Node

var score: int = 0
var height: int = 0
var max_height: int = 0

func start_game() -> void:
	Engine.time_scale = 1
	score = 0
	height = 0
	max_height = 0
	pass

func add_score() -> void:
	score += 1

func set_height(value: int) -> void:
	height = value * -1
	if height > max_height:
		max_height = height
