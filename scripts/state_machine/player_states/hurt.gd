extends State
class_name HurtState

@export var fall_state: State

@export var knockback_force: Vector2
var counter_direction: int = 0

func enter() -> void:
	super()

func exit() -> void:
	counter_direction = 0
	super()

func process_physics(delta: float) -> State:
	
	parent.velocity.y -= knockback_force.y
	parent.velocity.x =  counter_direction * knockback_force.x
	animations.flip_h = counter_direction < 0
	parent.move_and_slide()

	if !parent.is_on_floor():
		return fall_state
	return null
