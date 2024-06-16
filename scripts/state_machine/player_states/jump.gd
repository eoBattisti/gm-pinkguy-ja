extends State
class_name JumpState

@export var fall_state: State
@export var idle_state: State
@export var move_state: MoveState

@export var jump_height : float = 30
@export var jump_time_to_peak : float = 0.5

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0


func enter() -> void:
	super()
	parent.velocity.y = jump_velocity

func process_physics(delta: float) -> State:
	parent.velocity.y += jump_gravity * delta

	if parent.velocity.y < 0:
		return fall_state

	var movement = movement_component.get_move_direction() * move_state.move_speed
	
	parent.move_and_slide()

	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	
	return null
