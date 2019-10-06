extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animation_player = get_node('AnimationPlayer')

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("__INIT__")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("change_scene1"):
		get_tree().change_scene("res://moving character/Movemant.tscn")
	pass


func _on_DoneButton_done_pressed():
	animation_player.play("fade_away")
