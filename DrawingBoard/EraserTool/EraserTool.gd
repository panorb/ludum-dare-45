extends Node2D

var color = Color(1, 0, 1, 1)
onready var control = get_node('Control')
onready var sprite = get_node('Sprite')
onready var animation_player = get_node('AnimationPlayer')
signal draw_color_selected(color)
signal hovered

func _ready():
	control.connect('mouse_entered', self, '_mouse_entered')
	control.connect('mouse_exited', self, '_mouse_exited')
	control.connect('gui_input', self, '_gui_input')
	animation_player.play("__INIT__")

func _mouse_entered():
	emit_signal("hovered")
	animation_player.play("hover")

func _mouse_exited():
	animation_player.play_backwards("hover")

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		emit_signal('draw_color_selected', color)