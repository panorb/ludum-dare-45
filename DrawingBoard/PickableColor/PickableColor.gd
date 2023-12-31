extends Node2D

var color = Color.aqua
onready var color_rect = get_node('ColorRect')
onready var animation_player = get_node('AnimationPlayer')
signal draw_color_selected(color)
signal hovered

func init(color):
	self.color = color

func _ready():
	color_rect.connect('mouse_entered', self, '_mouse_entered')
	color_rect.connect('mouse_exited', self, '_mouse_exited')
	color_rect.connect('gui_input', self, '_gui_input')
	color_rect.color = color
	animation_player.play("__INIT__")

func _mouse_entered():
	emit_signal("hovered")
	animation_player.play("hover")

func _mouse_exited():
	animation_player.play_backwards("hover")

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		emit_signal('draw_color_selected', color)