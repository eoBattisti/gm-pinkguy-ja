extends Node
class_name State

@export var animation_name: String
@export var sound_effect_resource: AudioStream

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var animations: AnimatedSprite2D
var parent: CharacterBody2D
var audio_player: AudioStreamPlayer
var movement_component


func enter() -> void:
	pass
	animations.play(animation_name)
	if audio_player:
		audio_player.stream = sound_effect_resource
		audio_player.play()


func exit() -> void:
	pass


func process_input(event: InputEvent) -> State:
	return null


func process_frame(delta: float) -> State:
	return null


func process_physics(delta: float) -> State:
	return null
