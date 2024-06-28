extends State
class_name FallState

@export var idle_state: State
@export var move_state: MoveState
@export var jump_state: State

@export var early_fall_gravity: float = 1.5
@export var jump_time_to_descent : float = 0.4

@onready var coyote_timer: Timer = $CoyoteTimer
@onready var fall_gravity : float = ((-2.0 * jump_state.jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

#var fall_fast: bool = false

func enter() -> void:
	super()
	#fall_fast = false
	coyote_timer.start()

func process_input(event: InputEvent) -> State:

	if !coyote_timer.is_stopped() and movement_component.wants_jump():
		jump_state.enter()

	# TODO: Implement fall fast mechanic
	#if event.is_action_released("jump"):
		#fall_fast = true

	return null


func process_physics(delta: float) -> State:
	parent.velocity.y += fall_gravity * delta
	
	var movement = movement_component.get_move_direction() * move_state.move_speed

	animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()

	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	return null
