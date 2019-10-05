extends Area2D

var color = Color.aqua
onready var display = get_node('Display')
onready var animation_player = get_node('AnimationPlayer')

func init(color):
	self.color = color

func _ready():
	print("why")
	connect('mouse_entered', self, '_mouse_entered')
	connect('mouse_exited', self, '_mouse_exited')
	display.color = color
	animation_player.play("__INIT__")

func _mouse_entered():
	print('wew')
	animation_player.play("hover_over")
	pass

func _mouse_exited():
	animation_player.play("__INIT__")
	pass
