extends Node
class_name HealthComponent

@export var MAX_HEALTH: float
@export var healthbar: HealthbarComponent

var current_health: float

func _ready() -> void:
	current_health = MAX_HEALTH
	healthbar.init(MAX_HEALTH)

func damage(damage: int) -> void:
	current_health -= damage
	
	healthbar.handle_damage(damage)

	if current_health <= 0:
		var parent: CharacterBody2D = get_parent()
		parent.queue_free()
