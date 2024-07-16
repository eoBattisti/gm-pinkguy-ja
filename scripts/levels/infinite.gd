extends Node2D

@export_group("Spawning Platforms")
## Max X distance value to spawn platforms
@export var MAX_X_OFFSET: float = 50

## Min X distance value to spawn platforms
@export var MIN_X_OFFSET: float = 50

## Max Y distance value to spawn platforms
@export var MAX_Y_OFFSET: float = 70

## Max Y distance value to spawn platforms
@export var MIN_Y_OFFSET: float = 35

## Array of platforms to be randomly spawned
@export var platforms: Array[Platform]

@onready var camera: Camera2D = $Camera2D
@onready var player: Player = $Player
@onready var screen_size: Vector2 = get_viewport().size

var notifier: VisibleOnScreenNotifier2D
var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var last_platform_position: Vector2 = Vector2.ZERO
var next_spawn_time: float = 0


func _ready() -> void:
	rng.randomize()
	# Gets the VisibleOnScreenNotifier and connect the signal
	notifier = player.get_child(player.get_child_count() - 1)
	if notifier is VisibleOnScreenNotifier2D:
		notifier.screen_exited.connect(_on_player_exited_screen)


func _get_random_position() -> Vector2:
	var min_x: float
	var max_x: float

	if last_platform_position.x + MAX_X_OFFSET < screen_size.x:
		max_x = last_platform_position.x + MAX_X_OFFSET
	else: 
		max_x = screen_size.x

	if last_platform_position.x - MIN_X_OFFSET > 0:
		min_x = last_platform_position.x - MIN_X_OFFSET
	else:
		min_x = 0

	var x = rng.randi_range(min_x, max_x)
	var y = last_platform_position.y - rng.randi_range(MIN_Y_OFFSET, MAX_Y_OFFSET)
	return Vector2(x, y)


func _spawn_platforms() -> void:
	var new_platform = platforms[0].duplicate() as Platform
	if last_platform_position == Vector2.ZERO:
		new_platform.position = Vector2(200, -75)
	else:
		new_platform.position = _get_random_position()
	add_child(new_platform)
	last_platform_position = new_platform.position
	next_spawn_time += 100


func _get_platform() -> Platform:
	return null


func _process(delta: float) -> void:
	camera.global_position.y -= 0.5

	if Time.get_ticks_msec() > next_spawn_time:
		_spawn_platforms()


func _on_player_exited_screen() -> void:
	player.die()
