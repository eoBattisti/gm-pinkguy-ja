extends Node2D

@export var BULLET: PackedScene = preload("res://scenes/shooting/bullet.tscn")

@export var ammo_component: AmmoComponent
@export var reloading_time: float = 1.0
@export var fire_rate: float = 0.3

@export_category("Sound Effects")
@export var out_of_ammo_sfx: AudioStream
@export var shoot_sfx: AudioStream
@export var reload_sfx: AudioStream

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var is_reloading: bool = false
var can_fire: bool = true

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("shoot") and !is_reloading and can_fire:
		shoot()
		can_fire = false

		await get_tree().create_timer(fire_rate).timeout
		can_fire = true

func _unhandled_input(event: InputEvent) -> void:

	if event.is_action_pressed("reload") and !is_reloading:
		is_reloading = true
		audio_stream_player.stream = reload_sfx
		audio_stream_player.play()
		await get_tree().create_timer(reloading_time).timeout
		ammo_component.reload()
		is_reloading = false

func shoot() -> void:
	if ammo_component.current_ammo > 0:
		ammo_component.shoot()
		var b = BULLET.instantiate()
		b.global_position = global_position + Vector2(0, 0.5)
		audio_stream_player.stream = shoot_sfx
		audio_stream_player.play()
		get_tree().get_root().add_child(b)
	else:
		audio_stream_player.stream = out_of_ammo_sfx
		audio_stream_player.play()
