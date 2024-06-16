extends CharacterBody2D
class_name Enemy

@onready var state_machine: StateMachine = $StateMachine
@onready var movement_component: Node = $MovementComponent

func _ready() -> void:
	state_machine.init(self, movement_component)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
