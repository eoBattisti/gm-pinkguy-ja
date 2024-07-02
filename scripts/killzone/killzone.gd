extends Area2D
class_name Killzone

@export var strength: float = 100

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
