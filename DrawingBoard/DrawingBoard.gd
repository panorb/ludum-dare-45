extends Node2D

func _physics_process(delta):
	update()
	


func _draw():
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		var mousePos = get_viewport().get_mouse_position() + get_transform().x
		print("Mouse pos: %d, %d" % [mousePos.x, mousePos.y])
		draw_circle(mousePos, 2, Color.red)