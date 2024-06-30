extends Area2D
class_name Bullet

@export var speed = 750

@onready var damage_component: DamageComponent = $DamageComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	randomize()
	
	direction = global_position.direction_to(get_global_mouse_position())
	var angle = direction.angle()
	rotation_degrees = rad_to_deg(angle)

func _physics_process(delta: float) -> void:
	translate(direction * delta * speed)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		damage_component.damage(body)
		GameManager.add_score()
		animation_player.play("explode")
	animation_player.play("exlode")
