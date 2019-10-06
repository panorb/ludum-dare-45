extends KinematicBody2D
signal close_doors
var speed = 500

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("attack"):
		self.hide()
	var pos = Vector2(0,0)
	if get_node("AnimationPlayer").get_current_animation() == "idle":
		if get_node("CollisionShape2D/RayCast2D").is_colliding():
			pos += Vector2(-1,-1)
		
		
		self.move_and_slide(pos*speed)
		pass

func _on_AnimationPlayer_got_awaken():
	emit_signal("close_doors")
	pass # Replace with function body.
