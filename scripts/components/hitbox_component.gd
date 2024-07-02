extends Area2D
class_name HitboxComponent

var parent: Enemy
var damage_component: DamageComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()
	if parent.find_child("DamageComponent"):
		damage_component = parent.find_child("DamageComponent")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if damage_component:
			damage_component.damage(body)
		body.hurt.emit(parent.direction)
