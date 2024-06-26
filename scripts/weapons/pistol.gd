extends Node2D

const BULLET: PackedScene = preload("res://scenes/shooting/bullet.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		var b = BULLET.instantiate()
		add_child(b)
		b.global_position = global_position + Vector2(0, 0.5)
		
