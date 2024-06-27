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
	audio_player.stream = musics[MusicType.MENU]
	audio_player.play()


func change_volume(value: float) -> void:
	audio_player.set_volume_db(linear_to_db(value))


func set_new_stream(new: MusicType) -> void:
	var tween = create_tween().bind_node(audio_player)
	tween.tween_method(change_volume, audio_player.volume_db, 0, transition_duration).set_delay(transition_delay)
	await tween.finished
	if current_stream != new:
		audio_player.stream = musics[new]
		current_stream = new
		audio_player.play()
		change_volume(1)
