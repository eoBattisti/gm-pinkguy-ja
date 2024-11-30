extends Node2D
class_name Platform

enum PlatformType { GRASS, RED_SAND, SAND, ICE }

@export var resource: BasePlatformResource

@onready var sprite_2d: Sprite2D = $AnimatableBody2D/Sprite2D
@onready var animatable_body_2d: AnimatableBody2D = $AnimatableBody2D
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.frame = resource.type
	if resource.movable:
		_start_tween()

func _start_tween() -> void:
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(animatable_body_2d, "position", resource.offset, resource.duration / 2)
	tween.tween_property(animatable_body_2d, "position", Vector2.ZERO, resource.duration / 2)
