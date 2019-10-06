extends Control

onready var animation_player = get_node("AnimationPlayer")

func _ready():
	connect("mouse_entered", self, "_mouse_entered")
	connect("mouse_exited", self, "_mouse_exited")

func _mouse_entered():
	animation_player.play("hover")

func _mouse_exited():
	animation_player.play_backwards("hover")