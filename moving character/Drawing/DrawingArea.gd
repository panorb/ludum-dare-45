extends Area2D

onready var drawing_manager = get_node("/root/DrawingManager")
export var batch_name : String
onready var globals = get_node("/root/Globals")

func _ready():
	get_node("CollisionShape2D").set_disabled(false)
	connect("body_entered", self, "_body_entered")

func _body_entered(body):
	globals.position = get_node("../../Player").position
	drawing_manager.start_drawing_batch(batch_name)
	get_node("CollisionShape2D").set_disabled(true)