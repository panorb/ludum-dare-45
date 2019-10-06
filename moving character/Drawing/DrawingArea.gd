extends Area2D

onready var drawing_sprite = get_node("Drawing")
onready var drawing_manager = get_node("/root/DrawingManager")
export var batch_name : String
export var drawing_identifier : String = 'Sheep'

func _ready():
	drawing_sprite.drawing_identifier = drawing_identifier
	connect("body_entered", self, "_body_entered")

func _body_entered(body):
	drawing_manager.start_drawing_batch(batch_name)