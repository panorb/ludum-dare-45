extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	if "shoes" in globals.drawn:
		self.hide()
	else:
		self.show()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
