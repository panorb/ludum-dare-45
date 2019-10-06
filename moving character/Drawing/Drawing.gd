extends Sprite

onready var drawing_manager = get_node('/root/DrawingManager')
export var drawing_identifier : String = 'Sheep'

func _ready():
	print("_ready")
	if drawing_manager.has_drawing(drawing_identifier):
		texture = drawing_manager.get_drawing(drawing_identifier)

func _drawing_changed(identifier, drawing):
	print("_drawing_changed")
	if self.drawing_identifier == identifier:
		texture = drawing