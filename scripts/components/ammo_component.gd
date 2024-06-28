extends Node2D
class_name AmmoComponent

@export var MAX_AMMO: int = 10

var current_ammo: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_ammo = MAX_AMMO

func shoot() -> void:
	if current_ammo > 0:
		current_ammo -= 1

func reload() -> void:
	current_ammo = MAX_AMMO
