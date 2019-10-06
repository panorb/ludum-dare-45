extends Node2D

var mousePos = Vector2(-20, -20)
var selected_color = Color.red

var draw_point_ordered = false
var clear_ordered = false
var activity = 0

onready var draw_sound = get_node("../../Sounds/Drawing")
onready var clear_sound = get_node("../../Sounds/Clear")

func _physics_process(delta):
	activity -= 0.1
	if activity <= 2.2:
		draw_sound.volume_db = - (2.2 - activity)*12
	else:
		draw_sound.volume_db = -6
	
	if activity <= 0:
		draw_sound.stop()
	update()

func _draw():
	if draw_point_ordered:
		draw_circle(mousePos, 2, selected_color)
	
	if clear_ordered:
		draw_rect(Rect2(0, 0, 128, 128), Color(1, 0, 1, 1))
	
	draw_point_ordered = false
	clear_ordered = false

func _on_OutputBoard_pen_drawn(mousePos):
	if not draw_sound.playing:
		draw_sound.play()
	
	activity = 2.8
	self.mousePos = mousePos
	draw_point_ordered = true
	update()
	pass # Replace with function body.


func _on_Colors_draw_color_changed(selected_color):
	self.selected_color = selected_color


func _on_Colors_clear_ordered():
	clear_sound.play()
	clear_ordered = true
	update()
