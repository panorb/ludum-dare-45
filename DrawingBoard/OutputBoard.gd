extends Sprite

func _ready():
	window_resized()
	# get_viewport().connect("size_changed", self, "window_resized")
	
func window_resized():
	 position = get_viewport().size / 2.0