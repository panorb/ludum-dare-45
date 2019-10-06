extends KinematicBody2D
signal cam_pos_changed(cam_pos)
var speed = 400

onready var run_sound = get_node("Run")
var life = 1
onready var globals = get_node("/root/Globals")
signal attack

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = globals.position
	if "armor" in globals.drawn:
		life = 3
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	var pos = Vector2(0,0)
	var dir
	if "shoes" in globals.drawn:
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
	
	if (pos.x > 0 or pos.y > 0):
		if not run_sound.playing:
			run_sound.play()
	else:
		if run_sound.playing:
			run_sound.stop()
		
	#randy is pretty stupid maybe consider removing it
	move_and_slide(pos*speed)
	if dir == "right":
		get_node( "PlayerSprite" ).set_flip_h( true )
		get_node( "Armor" ).set_flip_h( true )
		get_node( "Shoes" ).set_flip_h( true )
	elif dir == "left":
		get_node( "PlayerSprite" ).set_flip_h( false )
		get_node( "Armor" ).set_flip_h( false )
		get_node( "Shoes" ).set_flip_h( false )
	if "hat" in globals.drawn:
		if Input.is_action_pressed("attack"):
			get_node("Brush").set_flip_h(true)
			emit_signal("attack")
		else:
			get_node("Brush").set_flip_h(false)
	
	
	
func take_dmg():
	life-=1;
	if life <= 0:
		get_tree().change_scene("res://moving character/Movemant.tscn")
	pass


func _on_Camera2D_cam_pos_changed(cam_pos):
	emit_signal("cam_pos_changed", cam_pos)


func _on_Enemy_did_hit():
	self.take_dmg()
	pass # Replace with function body.


func _on_Enemy2_did_hit():
	self.take_dmg()
	pass # Replace with function body.


func _on_Enemy3_did_hit():
	self.take_dmg()
	pass # Replace with function body.


func _on_Enemy4_did_hit():
	self.take_dmg()
	pass # Replace with function body.


func _on_Boss_did_hit():
	self.take_dmg()
	pass # Replace with function body.
