extends Node
class_name StateMachine

@export var initial_state: State

var current_state: State

func init(
	parent: CharacterBody2D,
	animations: AnimatedSprite2D,
	audio_player: AudioStreamPlayer,
	movement_component
) -> void:
	for child in get_children():
		if child is State:
			child.animations = animations
			if audio_player:
				child.audio_player = audio_player
			child.movement_component = movement_component
			child.parent = parent

	change_state(initial_state)


func change_state(new: State) -> void:
	# Changes the variable current_state based on the new variable
	if current_state:
		# Exits the current state based on its behaviour
		current_state.exit()
	
	current_state = new
	current_state.enter() # Enter the new state

func process_physics(delta: float) -> void:
	# Process the state physics based on its behavior/implementation
	var new_state = current_state.process_physics(delta)

	# Switch to a new state if necessary
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	# Process the state physics based on its behavior/implementation
	var new_state = current_state.process_input(event)

	# Switch to a new state if necessary
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	# Process the state physics based on its behavior/implementation
	var new_state = current_state.process_frame(delta)

	# Switch to a new state if necessary
	if new_state:
		change_state(new_state)
