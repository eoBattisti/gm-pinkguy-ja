extends State
class_name EnemyMoveState

@export var move_speed: float = 100

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta

	if movement_component._detected_player_right():
		parent.direction = 1
	
	if movement_component._detected_player_left():
		parent.direction = -1
	

	if movement_component._detected_enemy_fall():
		parent.direction *= -1

	var movement = parent.direction * move_speed

	animations.flip_h = movement < 05
	parent.velocity.x = movement
	parent.move_and_slide()
	return null

func process_frame(delta: float) -> State:
	if parent.direction:
		pass
	return null
