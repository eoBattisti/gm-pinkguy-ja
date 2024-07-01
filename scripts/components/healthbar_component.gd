extends Node2D
class_name HealthbarComponent

@export var texture: CompressedTexture2D
@export var spacing_to_dd: int = 5

var hearts: Array[Sprite2D]

func init(max_health: int) -> void:
	global_position.y = get_parent().position.y - 10
	global_position.x -= (spacing_to_dd * max_health) / 2
	var spacing = 0
	for i in max_health:
		var sprite: Sprite2D = Sprite2D.new()
		sprite.texture = texture
		sprite.position.x = spacing
		sprite.scale.x = 0.5
		sprite.scale.y = 0.5
		add_child(sprite)
		hearts.append(sprite)
		spacing += spacing_to_dd

func handle_damage(amount: int) -> void:
	for i in amount:
		var child = hearts.pop_back() as Sprite2D
		child.queue_free()
