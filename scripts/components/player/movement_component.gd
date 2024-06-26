extends Node2D

@export var parent: Player

# A set o functions that receives the player's input and is used in the FSM

func get_move_direction() -> float:
	return Input.get_axis("move_left", "move_right")

func wants_jump() -> bool:
	return Input.is_action_just_pressed("jump")

func get_direction() -> Vector2:
	return parent.global_position.direction_to(get_mouse_position())

func get_mouse_position() -> Vector2:
	return get_global_mouse_position()
