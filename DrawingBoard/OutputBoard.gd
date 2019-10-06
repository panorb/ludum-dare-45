extends Area2D

onready var output_sprite = get_node('Output')
onready var collision_shape = get_node('CollisionShape2D').shape
signal pen_release
signal pen_drawn(mousePos)

func _ready():
	window_resized()

func window_resized():
	 position = get_viewport().size / 2.0

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		var mousePos = collision_shape.extents - (position - get_global_mouse_position())
		mousePos = mousePos / output_sprite.scale
		
		if (mousePos.x > -2 and mousePos.x <= 129 and mousePos.y > -2 and mousePos.y <= 129):
			emit_signal('pen_drawn', mousePos)

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed() == false:
		emit_signal('pen_release')
