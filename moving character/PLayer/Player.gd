extends KinematicBody2D
signal cam_pos_changed(cam_pos)
var speed = 400

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	var pos = Vector2(0,0)
	var dir
	if Input.is_action_pressed("interact"):
		speed = 700
	if Input.is_action_pressed("move_up"):
			pos.y-=1
	if Input.is_action_pressed("move_down"):
			pos.y+=1
	if Input.is_action_pressed("move_left"):
			pos.x-=1
			dir = "left"
	if Input.is_action_pressed("move_right"):
			pos.x+=1
			dir = "right"
	pos = Vector2(pos.x,pos.y)
	#randy is pretty stupid maybe consider removing it
	move_and_slide(pos*speed)
	if dir == "right":
		get_node( "PlayerSprite" ).set_flip_h( true )
	elif dir == "left":
		get_node( "PlayerSprite" ).set_flip_h( false )
	pass
	
	
	

func _on_Camera2D_cam_pos_changed(cam_pos):
	emit_signal("cam_pos_changed", cam_pos)
