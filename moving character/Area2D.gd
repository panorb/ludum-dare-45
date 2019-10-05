extends Area2D
signal is_on_boss

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func body_shape_entered ( int body_id, PhysicsBody2D body, int body_shape, int area_shape ):


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var is_on = false
	if 
	
	
	emit_signal("is_on_boss", is_on)
	pass
