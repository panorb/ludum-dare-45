extends KinematicBody2D
signal close_doors
var speed = 200
signal did_hit
var is_colliding = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var pos = Vector2(0,0)
	if get_node("AnimationPlayer").get_current_animation() == "idle":
		if get_node("CollisionShape2D/RayCast2D").is_colliding():
			pos += Vector2(1,0)
		if get_node("CollisionShape2D/RayCast2D2").is_colliding():
			pos += Vector2(1,1)
		if get_node("CollisionShape2D/RayCast2D3").is_colliding():
			pos += Vector2(1,-1)
		if get_node("CollisionShape2D/RayCast2D4").is_colliding():
			pos += Vector2(0,1)
		if get_node("CollisionShape2D/RayCast2D5").is_colliding():
			pos += Vector2(0,-1)
		if get_node("CollisionShape2D/RayCast2D6").is_colliding():
			pos += Vector2(-1,0)
		if get_node("CollisionShape2D/RayCast2D7").is_colliding():
			pos += Vector2(-1,1)
		if get_node("CollisionShape2D/RayCast2D8").is_colliding():
			pos += Vector2(-1,-1)
		self.move_and_slide(pos*speed)
		pass

func _on_AnimationPlayer_got_awaken():
	emit_signal("close_doors")
	pass # Replace with function body.


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



