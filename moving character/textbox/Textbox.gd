extends Node2D
var start_pos= 150
var infront = false
var npc_loaded = false
var got_item = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_File(data):
    var file = File.new()
    file.open("res://moving character/"+data+".txt", file.READ)
    var content = file.get_as_text()
    file.close()
    return content

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("interact") and infront:
		var contend = load_File("npc text2")
		var text = get_node("Text")
		text.set_text(contend)
		got_item = true
		get_node("Sprite").set_texture(preload("res://moving character/textures/Npc_happy.png"))

	
	pass



func _on_Player_cam_pos_changed(cam_pos):
	position.x = cam_pos.x
	position.y = cam_pos.y + 150 + start_pos
	pass # Replace with function body.

var boss_dialog_pos = 1

func _on_Boss_Area_bossarea_entered():
	var contend
	get_node("Sprite").set_texture(preload("res://moving character/textures/boss_face.png"))
	if got_item:
		contend = load_File("boss text2")
	else:
		contend = load_File("boss text" + boss_dialog_pos)
	
	if contend.startswith("+"):
		get_node("/root/DrawingManager").start_drawing_batch(contend.substr(1, contend.length()))
	
	start_pos = 0
	var text = get_node("Text")
	text.set_text(contend)
	
	pass # Replace with function body.


func _on_Boss_Area_bossarea_left():
	start_pos= 150
	pass # Replace with function body.


func _on_npc_area_npc_area_in():
	start_pos = 0

	var contend
	if not npc_loaded and not got_item:
		get_node("Sprite").set_texture(preload("res://moving character/textures/Npc.png"))
		contend = load_File("npc text1")
		npc_loaded = true
	else:
		get_node("Sprite").set_texture(preload("res://moving character/textures/Npc_happy.png"))
		contend = load_File("npc text2")
	
	var text = get_node("Text")
	text.set_text(contend)
	infront = true

	pass # Replace with function body.


func _on_npc_area_npc_area_out():
	start_pos= 150
	infront = false
	npc_loaded = false
	
	pass # Replace with function body.
