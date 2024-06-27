extends Node2D

@export var in_game_music: AudioStream

@onready var pause_menu: Control = %PauseMenu

var paused: bool = false

func _ready() -> void:
	GameManager.start_game()
	MusicManager.set_new_stream(MusicManager.MusicType.INGAME)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_game()


func pause_game() -> void:
	if paused:
		pause_menu.hide()
		MusicManager.set_new_stream(MusicManager.MusicType.INGAME)
		Engine.time_scale = 1
	else:
		pause_menu.show()
		MusicManager.set_new_stream(MusicManager.MusicType.MENU)
		Engine.time_scale = 0
	
	paused = !paused
