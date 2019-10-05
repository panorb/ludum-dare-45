extends Node2D

func _physics_process(delta):
	update()

var mousePos = Vector2(-20, -20)

func _draw():
	draw_circle(mousePos, 2, Color.red)

func _on_OutputBoard_pen_drawn(mousePos):
	self.mousePos = mousePos
	update()
	pass # Replace with function body.
