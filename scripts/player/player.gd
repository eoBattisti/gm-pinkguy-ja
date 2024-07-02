extends CharacterBody2D
class_name Player

signal hurt

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var state_machine: StateMachine = $StateMachine
@onready var movement_component: Node2D = $MovementComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var hurt_state: HurtState = $StateMachine/Hurt

func _ready() -> void:
	hurt.connect(_on_player_hurt)
	state_machine.init(self, animated_sprite_2d, audio_stream_player, movement_component)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_player_hurt(counter_direction: int) -> void:
	hurt_state.counter_direction = counter_direction
	state_machine.change_state(hurt_state)

func die():
	get_tree().change_scene_to_file("res://scenes/menus/game_over_menu.tscn")
