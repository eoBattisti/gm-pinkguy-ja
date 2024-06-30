extends CanvasLayer

@export var player: Player

@onready var height_label: Label = $Control/MarginContainer/HBoxContainer/HeightLabel
@onready var score_label: Label = $Control/MarginContainer/HBoxContainer/ScoreLabel
@onready var max_height_label: Label = $Control/MarginContainer/HBoxContainer/MaxHeightLabel
@onready var ammo_label: Label = $Control/MarginContainer/HBoxContainer/AmmoLabel

var ammo_component: AmmoComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var weapon = player.find_child("Weapon")
	ammo_component = weapon.find_child("AmmoComponent")
	if ammo_component:
		ammo_label.text = "A: " + str(ammo_component.current_ammo) + "/" + str(ammo_component.MAX_AMMO) 
	score_label.text = "S: " + str(GameManager.score)
	height_label.text = "H: " + str(GameManager.height)
	max_height_label.text = "MX: " + str(GameManager.max_height)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_label.text = "S: " + str(GameManager.score)
	height_label.text = "H: " + str(GameManager.height)
	max_height_label.text = "MX: " + str(GameManager.max_height)
	if ammo_component:
		ammo_label.text = "A: " + str(ammo_component.current_ammo) + "/" + str(ammo_component.MAX_AMMO) 
	
