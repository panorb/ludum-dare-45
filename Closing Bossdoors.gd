extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Boss_close_doors():
	self.show()
	pass # Replace with function body.


func _on_Boss_hide():
	self.hide()
	pass # Replace with function body.
