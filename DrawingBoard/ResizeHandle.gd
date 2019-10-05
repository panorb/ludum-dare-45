extends CenterContainer

func _ready():
	window_resize()
	get_viewport().connect("size_changed", self, "window_resize")

func window_resize():
	rect_size = get_viewport().size