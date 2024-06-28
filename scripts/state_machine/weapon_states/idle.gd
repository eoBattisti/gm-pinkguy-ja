extends State

@export var reload_state: State
@export var shooting_state: State

func enter() -> void:
	super()


func process_input(event: InputEvent) -> State:

	if event.is_action_pressed("reload"):
		return reload_state

	if event.is_action_pressed("shoot"):
		return shooting_state

	return null
