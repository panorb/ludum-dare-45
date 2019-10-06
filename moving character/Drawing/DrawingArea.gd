extends Area2D

onready var drawing_manager = get_node("/root/DrawingManager")
export var batch_name : String

func _ready():
	connect("body_entered", self, "_body_entered")

func _body_entered(body):
	drawing_manager.start_drawing_batch(batch_name)