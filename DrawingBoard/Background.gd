extends ColorRect

func _ready():
	window_resized()

func window_resized():
	rect_size = get_viewport().size