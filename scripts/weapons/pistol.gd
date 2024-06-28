extends Node2D

@export var BULLET: PackedScene = preload("res://scenes/shooting/bullet.tscn")

@export var ammo_component: AmmoComponent
@export var reloading_time: float = 1.0

var is_reloading: bool = false

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())


func _unhandled_input(event: InputEvent) -> void:

	if event.is_action_pressed("reload") and !is_reloading:
		is_reloading = true
		await get_tree().create_timer(reloading_time).timeout
		ammo_component.reload()
		is_reloading = false

	if event.is_action_pressed("shoot") and !is_reloading:
		shoot()


func shoot() -> void:
	if ammo_component.current_ammo > 0:
		ammo_component.shoot()
		var b = BULLET.instantiate()
		b.global_position = global_position + Vector2(0, 0.5)
		get_tree().get_root().add_child(b)
