extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var colors_node = get_node('Handle/Colors')
onready var board_viewport = get_node('Board')
onready var animation_player = get_node('AnimationPlayer')
onready var task_label = get_node('Task')

signal drawing_done(drawing_texture)
signal transition_finished

func init(task, description, colors):
	task_label.text = task
	colors_node.colors = colors
	colors_node.create_tools()

# Called when the node enters the scene tree for the first time.
func _ready():
	connect('ready', get_node('/root/DrawingManager'), '_drawing_board_ready')
	animation_player.play("__INIT__")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("change_scene1"):
		get_tree().change_scene("res://moving character/Movemant.tscn")
	pass

func _on_DoneButton_done_pressed():
	var image_texture = ImageTexture.new()
	image_texture.create_from_image(board_viewport.get_texture().get_data(), 3)
	
	emit_signal('drawing_done', image_texture)
	
	animation_player.play("fade_away")
	yield(get_tree().create_timer(1.5), 'timeout')
	emit_signal('transition_finished')
