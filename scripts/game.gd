extends Node2D

@export var in_game_music: AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.set_new_stream(MusicManager.MusicType.INGAME)
