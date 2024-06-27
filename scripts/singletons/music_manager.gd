extends Node2D

# Transition durations in seconds
@export var transition_duration: float = 1
@export var transition_delay: float = 1

@export var musics: Array[AudioStream] = []

@onready var audio_player: AudioStreamPlayer = $AudioPlayer

var current_stream: int

enum MusicType { MENU, INGAME }

func _ready() -> void:

	# Starts the Geral AudioPlayer
	current_stream = MusicType.MENU
	audio_player.stream = musics[current_stream]
	audio_player.play()


func change_volume(value: float) -> void:
	audio_player.set_volume_db(linear_to_db(value))


func set_new_stream(new: MusicType) -> void:

	if current_stream != new:
		audio_player.stop()
		audio_player.stream = musics[new]
		current_stream = new
		change_volume(1)
		audio_player.play()
