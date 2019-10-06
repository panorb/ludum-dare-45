extends KinematicBody2D
var speed = 500
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = Vector2(0,0)
	if get_node("../../AnimationPlayer").get_current_animation() == "idle":
		if get_node("CollisionShape2D/RayCast2D").is_colliding():
			pos += Vector2(-1,-1)
		
		
		get_node("../..").move_and_slide(pos*speed)
		pass


