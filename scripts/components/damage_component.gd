extends Node2D
class_name DamageComponent

@export var DAMAGE: int = 0

func damage(body: Node2D) -> void:
	var health_component: HealthComponent = body.get_node("HealthComponent")
	if health_component:
		health_component.damage(DAMAGE)
	
