extends AnimationPlayer

var frames = 0;
signal got_awaken
var got_awaken = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.play("a sleep")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	frames+=1
	if get_node("../CollisionShape2D/RayCast2D").is_colliding() || get_node("../CollisionShape2D/RayCast2D2").is_colliding() || get_node("../CollisionShape2D/RayCast2D3").is_colliding() || get_node("../CollisionShape2D/RayCast2D4").is_colliding() || get_node("../CollisionShape2D/RayCast2D5").is_colliding() || get_node("../CollisionShape2D/RayCast2D6").is_colliding() || get_node("../CollisionShape2D/RayCast2D7").is_colliding() || get_node("../CollisionShape2D/RayCast2D8").is_colliding():
		if self.get_current_animation() == "a sleep":
			self.play("wakeup")
		else:
			self.play("idle")
		frames = 0
		if not got_awaken:
			emit_signal("got_awaken")
			got_awaken = true
	else:
		if self.get_current_animation() == "a sleep":
			pass
		elif (self.get_current_animation() == "wakeup" or self.get_current_animation() == "idle" ) and  (frames*delta) >= 3 :
			self.play("go to sleep")
		elif (frames*delta) >= 3:
			self.play("a sleep")
