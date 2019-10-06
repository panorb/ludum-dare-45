extends KinematicBody2D
var speed = 500
signal did_hit
var is_colliding = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = Vector2(0,0)
	if get_node("RayCast2D").is_colliding():
		pos += Vector2(-1,1)
	if get_node("RayCast2D2").is_colliding():
		pos += Vector2(1,1)
	if get_node("RayCast2D3").is_colliding():
		pos += Vector2(-1,-1)
	if get_node("RayCast2D4").is_colliding():
		pos += Vector2(1,-1)
	self.move_and_slide(pos*speed)


func _on_Area2D_body_entered(body):
	is_colliding = true
	emit_signal("did_hit")
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	is_colliding = false
	pass # Replace with function body.

func _on_Player_attack():
	if is_colliding:
		self.hide()
	pass # Replace with function body.




