extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var state_machine: StateMachine = $StateMachine
@onready var movement_component: Node2D = $MovementComponent


func _ready() -> void:
	state_machine.init(self, movement_component)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
