extends Node2D
class_name PlatformSpawner

@export_group("Spawning Settings")

## Max X distance value to spawn platforms
@export var MAX_X_OFFSET: float = 50

## Min X distance value to spawn platforms
@export var MIN_X_OFFSET: float = 50

## Max Y distance value to spawn platforms
@export var MAX_Y_OFFSET: float = 83

## Max Y distance value to spawn platforms
@export var MIN_Y_OFFSET: float = 75

@export_group("Platform Settings")

## Array of platforms to be randomly spawned
@export var platforms: Array[Platform]

@export var player: Player

@onready var screen_size: Vector2 = get_viewport_rect().size

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var last_platform_position: Vector2 = Vector2.ZERO
var next_spawn_time: float = 0

var number_of_platforms_on_screen: int = 0
var platform_pool: Array[Platform] = []


func _ready() -> void:
	rng.randomize()
	number_of_platforms_on_screen = floor(screen_size.y / MAX_Y_OFFSET)

	# We need to populate the platform pool first
	for platform in platforms:
		# Create N times new platforms
		for i in number_of_platforms_on_screen + 1:
			var new_platform: Platform = platform.duplicate() as Platform
			platform_pool.append(new_platform)

func _process(delta: float) -> void:
	if Time.get_ticks_msec() > next_spawn_time:
		_spawn_platforms()

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
	# We cant spawn a platform without the minimun of one platform in the pool
	if platform_pool.is_empty():
		return

	# We do not need to spawn a platform if the number max of platforms on the screen are already there
	if get_child_count() >= number_of_platforms_on_screen:
		return

	# We get a random platform
	var new_platform: Platform = _get_platform()
	if new_platform == null:
		return

	if last_platform_position == Vector2.ZERO:
		new_platform.position = Vector2(200, -75)
	else:
		new_platform.position = _get_random_position()

	self.add_child(new_platform)
	new_platform.visible = true
	last_platform_position = new_platform.position
	
	# Validate if the signal has already been connected in the object
	if not new_platform.visible_on_screen_notifier_2d.screen_exited.is_connected(_on_platform_exited_screen):
		new_platform.visible_on_screen_notifier_2d.screen_exited.connect(_on_platform_exited_screen.bind(new_platform))

	next_spawn_time += 1000


func _get_platform() -> Platform:
	var valid_platforms = []
	# Generate a new list with only valid platforms based on the player height
	for platform in platform_pool:
		# We invert the simbols because godot y axis is negative
		if (platform.resource.min_spawn_height > player.position.y
			and  platform.resource.max_spawn_height < player.position.y):
			valid_platforms.append(platform)
	
	# Pick a random platorm from the list
	var new_platform: Platform = valid_platforms.pick_random()
	var platform_index: int = platform_pool.find(new_platform)
	# Remove it from the pool
	platform_pool.pop_at(platform_index)

	return new_platform

func _on_platform_exited_screen(platform: Platform) -> void:
	# Remove the platform parent, so it's possible to readd it to this same parent n times
	remove_child(platform)
	# Each time the platform is off the screen we add it to the pool again
	platform.visible_on_screen_notifier_2d.screen_exited.disconnect(_on_platform_exited_screen)
	platform_pool.append(platform)
	
