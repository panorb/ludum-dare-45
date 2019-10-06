extends Node2D

var oldMousePos = Vector2(-20, -20)
var mousePos = Vector2(-20, -20)
var selected_color = Color.red

var draw_point_ordered = false
var clear_ordered = false
var activity = 0

onready var draw_sound = get_node("../../Sounds/Drawing")
onready var eraser_sound = get_node("../../Sounds/Eraser")
onready var clear_sound = get_node("../../Sounds/Clear")
onready var sound = draw_sound setget ,sound_get


func is_eraser():
	return selected_color == Color(1, 0, 1, 1)

func sound_get():
	if is_eraser():
		return eraser_sound
	else:
		return draw_sound

func _physics_process(delta):
	activity -= 0.1
	if activity <= 2.2:
		if is_eraser():
			self.sound.volume_db = - (2.2 - activity)*12 -14
		else:
			self.sound.volume_db = - (2.2 - activity)*12
	else:
		if is_eraser():
			self.sound.volume_db = -20
		else:
			self.sound.volume_db = -6
	if activity <= 0:
		self.sound.stop()
	update()

func _draw():
	if draw_point_ordered:
		if oldMousePos == Vector2(-20, -20):
			oldMousePos = mousePos
		draw_circle(mousePos, 2, selected_color)
		draw_line(oldMousePos, mousePos, selected_color, 4)
	
	if clear_ordered:
		var rng = RandomNumberGenerator.new()
		draw_rect(Rect2(0, 0, 128, 128), Color(rng.randf(), randf(), randf(), 1))
		# draw_rect(Rect2(0, 0, 128, 128), Color(1, randf(), randf(), 1))
	
	draw_point_ordered = false
	clear_ordered = false

func _on_OutputBoard_pen_drawn(mousePos):
	if not self.sound.playing:
		self.sound.play()
	
	activity = 2.8
	self.oldMousePos = self.mousePos
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


func _on_OutputBoard_pen_release():
	oldMousePos = Vector2(-20, -20)
	mousePos = Vector2(-20, -20)
