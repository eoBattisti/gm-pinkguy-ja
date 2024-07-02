extends State
class_name HurtState

@export var fall_state: State

@export var knockback_force: Vector2
@export var knockback_wait_time: float = 0.2 # Seconds

var counter_direction: int = 0
var wait_time: float = 0 

func enter() -> void:
	wait_time = knockback_wait_time
	super()

func exit() -> void:
	counter_direction = 0
	super()

func process_physics(delta: float) -> State:
	
	parent.velocity.y -= knockback_force.y
	parent.velocity.x =  counter_direction * knockback_force.x
	animations.flip_h = counter_direction < 0
	parent.move_and_slide()

	wait_time -= delta
	if wait_time <= 0:
		return fall_state
	return null
