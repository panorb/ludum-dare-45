extends Camera2D
signal cam_pos_changed(cam_pos)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cam_pos = get_camera_position()
	emit_signal("cam_pos_changed", cam_pos)
