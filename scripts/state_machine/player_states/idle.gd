extends State
class_name IdleState

@export var fall_state: State
@export var jump_state: State
@export var move_state: State


func enter() -> void:
	super()
	parent.velocity.x = 0


func process_input(event: InputEvent) -> State:

	if movement_component.get_move_direction() != 0:
		return move_state
	
	if movement_component.wants_jump():
		return jump_state

	return null


func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()

	if !parent.is_on_floor():
		return fall_state
	return null
