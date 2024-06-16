extends State
class_name EnemyMoveState

@export var move_speed: float = 100
var direction: float = 1

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta

	if movement_component._detected_player_right():
		direction = 1
	elif movement_component._detected_player_left():
		direction = -1
	elif movement_component._detected_enemy_fall():
		direction *= -1

	var movement = direction * move_speed

	#animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	return null
