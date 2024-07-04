extends Control

@onready var back_button: Button = $MarginContainer/VBoxContainer/ButtonVBox/BackButton
@onready var game_design: VBoxContainer = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/GameDesign
@onready var programmers: VBoxContainer = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/Programmers
@onready var testers_container: VBoxContainer = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/TestersContainer
@onready var assets_container: VBoxContainer = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/AssetsContainer

var assets_credits = [
	"Game Assets - VEXED", "UI/HUD - Vexed ", "UI/HUD - ansdor",
	"Font - Jimmy Campbell", "Music - Bossa Nova - Joth", 
	"Music - Leap - nene", "Sound Effects - SubspaceAudio"
]
var testers_credits = []
var game_design_credits = ["Nicolas Battisti"]
var programmers_credits = ["Nicolas Battisti"]

func _ready() -> void:
	populate_credits("Game Design", game_design, game_design_credits)
	populate_credits("Programmers", programmers, programmers_credits)
	populate_credits("Testers", testers_container, testers_credits)
	populate_credits("Thyrd Party Assets", assets_container, assets_credits)
	back_button.grab_focus()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func populate_credits(
	title: String,
	container: VBoxContainer,
	to_credit: Array
) -> void:
	var title_label = Label.new()
	title_label.text = title
	title_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title_label.add_theme_font_size_override("font_size" , 16)
	title_label.add_theme_color_override("font_color", Color("ff4ded"))
	container.add_child(title_label)
	for credit in to_credit:
		var label = Label.new()
		label.text = credit
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.add_theme_font_size_override("font_size" , 12)
		
		container.add_child(label)
