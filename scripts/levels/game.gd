extends Node2D

@export var in_game_music: AudioStream

@onready var player: Player = $Player
@onready var hud: CanvasLayer = $HUD
@onready var pause_menu: CanvasLayer = $Player/Camera2D/PauseMenu
@onready var viewport_size = get_viewport_rect().size

signal player_died

var paused: bool = false
var mouse_cursor = load("res://assets/sprites/cross.png")

func _ready() -> void:
	player_died.connect(_on_player_died)
	Input.set_custom_mouse_cursor(mouse_cursor, Input.CURSOR_ARROW, Vector2(8, 8))
	GameManager.start_game()
	MusicManager.set_new_stream(MusicManager.MusicType.INGAME)

func _process(_delta: float) -> void:
	if player:
		GameManager.set_height(player.global_position.y)
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_game()

func pause_game() -> void:
	if paused:
		get_tree().paused = false
		Input.set_custom_mouse_cursor(mouse_cursor, Input.CURSOR_ARROW, Vector2(8,8))
		pause_menu.hide()
		hud.show()
		MusicManager.set_new_stream(MusicManager.MusicType.INGAME)
		Engine.time_scale = 1
	else:
		get_tree().paused = true
		Input.set_custom_mouse_cursor(null)
		hud.hide()
		pause_menu.show()
		MusicManager.set_new_stream(MusicManager.MusicType.MENU)
		Engine.time_scale = 0
	
	paused = !paused

func _on_player_died() -> void:
	hud.hide()
	get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://scenes/menus/game_over_menu.tscn")
