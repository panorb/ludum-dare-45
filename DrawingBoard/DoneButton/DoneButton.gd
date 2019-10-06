extends Node2D

onready var particles = get_node('Particles2D')
onready var control = get_node('Control')
onready var animation_player = get_node('AnimationPlayer')
onready var button_sprite = get_node('Sprite')
onready var fairy_dust_sound = get_node('Sounds/FairyDust')
onready var success_sound = get_node('Sounds/Success')

signal done_pressed
var draw_value = 0.0 setget draw_value_set
var is_enabled = false

func draw_value_set(new_val):
	if new_val > 20.0:
		button_sprite.modulate = Color(1, 1, 1, 1)
		is_enabled = true
	if new_val > 50.0:
		particles.emitting = true
		particles.visible = true
	if new_val <= 3.0:
		fairy_dust_sound.stop()
		button_sprite.modulate = Color(1, 1, 1, 0.3)
		particles.emitting = false
		particles.visible = false
		is_enabled = false
	
	draw_value = new_val

func _ready():
	draw_value_set(0.0)
	control.connect('gui_input', self, '_gui_input')
	control.connect('mouse_entered', self, '_mouse_entered')
	control.connect('mouse_exited', self, '_mouse_exited')
	animation_player.play("__INIT__")
	

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and is_enabled:
		if not success_sound.playing:
			success_sound.play()
		emit_signal('done_pressed')

func _mouse_entered():
	if is_enabled:
		if not fairy_dust_sound.playing:
			fairy_dust_sound.play()
		animation_player.play("hover")
	particles.lifetime *= 2
	particles.speed_scale = 2
	

func _mouse_exited():
	if is_enabled:
		fairy_dust_sound.stop()
		animation_player.play_backwards("hover")
	particles.lifetime /= 2
	particles.speed_scale = 1

func _on_OutputBoard_pen_drawn(mousePos):
	self.draw_value = draw_value + 0.1


func _on_Colors_clear_ordered():
	self.draw_value = 100.0
