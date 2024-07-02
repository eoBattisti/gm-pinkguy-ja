extends State
class_name EnemyMoveState

@export var move_speed: float = 100


func process_frame(delta: float) -> State:
	var screen_size: Vector2 = get_viewport().get_visible_rect().size
	var pos_diff: float = screen_size.x - parent.position.x 
	
	# If the enemy can fly we prevent it to move out of the screen_size
	if movement_component.can_fly:
		if ((parent.direction == 1 and pos_diff <= 30)
			or (parent.direction == -1 and pos_diff >= 370 )):
			parent.direction *= -1

	return null

func process_physics(delta: float) -> State:
	if !movement_component.can_fly:
		parent.velocity.y += gravity * delta

	if movement_component._detected_player_right() or movement_component._detected_player_left():
		parent.direction *= -1
	
	if !movement_component.can_fly and movement_component._detected_enemy_fall():
		parent.direction *= -1

	var movement = parent.direction * move_speed

	animations.flip_h = movement < 05
	parent.velocity.x = movement
	parent.move_and_slide()
	return null
