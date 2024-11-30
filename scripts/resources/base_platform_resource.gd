extends Resource
class_name BasePlatformResource

enum PlatformType { GRASS, RED_SAND, SAND, ICE }

@export_category("Base Platform Resource Settings")
@export_group("Base Settings")

## Determines the type of the platform based on the `PlatformType` enum.
@export var type: PlatformType = PlatformType.GRASS

@export_group("Movement Settings")

## Determines if a platform can move or not. Set it to `true` to instantiate a movable platform.
@export var movable: bool = false

## Determines the distance the platform will move.
@export var offset: Vector2 = Vector2(0, -320)

## Determine the duration that the platform will take to move from the start position
## to its offset position
@export var duration: float = 5.0

@export_group("Spawn Settings")

## Determines the minimal height to spawn the platform
@export var min_spawn_height: float

## Determines the maximun height to spawn the platform
@export var max_spawn_height: float
