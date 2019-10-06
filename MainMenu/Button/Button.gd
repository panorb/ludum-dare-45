extends Control

export var game_start_batch : String = 'game_start_batch'
export var main_game_scene : PackedScene = preload("res://moving character/Movemant.tscn")
onready var animation_player = get_node("AnimationPlayer")
onready var globals = get_node("/root/Globals")
onready var drawing_manager = get_node('/root/DrawingManager')

func _ready():
	connect("mouse_entered", self, "_mouse_entered")
	connect("mouse_exited", self, "_mouse_exited")
	connect("gui_input", self, "_gui_input")

func _mouse_entered():
	animation_player.play("hover")

func _mouse_exited():
	animation_player.play_backwards("hover")

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if game_start_batch in globals.drawn:
			get_tree().change_scene_to(main_game_scene)
		else:
			drawing_manager.start_drawing_batch(game_start_batch)
		mouse_filter = Control.MOUSE_FILTER_IGNORE