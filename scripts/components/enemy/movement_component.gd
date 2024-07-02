extends Node

@export var can_fly: bool = false
@export var raycast_right: RayCast2D
@export var raycast_down_right: RayCast2D
@export var raycast_left: RayCast2D
@export var raycast_down_left: RayCast2D

func _detected_player_right() -> bool:
	return raycast_right.is_colliding() and raycast_right.get_collider() is Player

func _detected_player_left() -> bool:
	return raycast_left.is_colliding() and raycast_left.get_collider() is Player  

func _detected_enemy_fall() -> bool:
	return !raycast_down_left.is_colliding() or !raycast_down_right.is_colliding()
