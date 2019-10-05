extends Node2D
var start_pos= 160

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
	var contend = load_File("test_lul")
	var text = get_node("Text")
	text.set_text(contend)

	
	pass



func _on_Player_cam_pos_changed(cam_pos):
	position.x = cam_pos.x
	position.y = cam_pos.y + 280 + start_pos
	pass # Replace with function body.


func _on_Boss_Area_bossarea_entered():
	start_pos = 0
	pass # Replace with function body.


func _on_Boss_Area_bossarea_left():
	start_pos= 160
	pass # Replace with function body.
