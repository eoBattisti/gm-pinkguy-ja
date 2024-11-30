extends Node2D

@onready var camera: Camera2D = $Camera2D
@onready var player: Player = $Player
@onready var screen_size: Vector2 = get_viewport().size

var notifier: VisibleOnScreenNotifier2D

func _ready() -> void:
	# Gets the VisibleOnScreenNotifier and connect the signal
	#notifier = player.get_child(player.get_child_count() - 1)
	#if notifier is VisibleOnScreenNotifier2D:
	#	notifier.screen_exited.connect(_on_player_exited_screen)
	pass


func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	#dwcamera.global_position.y -= 1
	pass

func _on_player_exited_screen() -> void:
	player.die()
