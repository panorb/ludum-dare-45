extends Node

var drawings = {}
onready var globals = get_node("/root/Globals")

export var startup_batch : String = "startup_batch"
export var main_menu_scene : PackedScene = preload("res://MainMenu/MainMenu.tscn")
export var main_game_scene : PackedScene = preload("res://moving character/Movemant.tscn")
export var drawing_board_scene : PackedScene = preload("res://DrawingBoard/DrawingBoard.tscn")

var cur_batch_name = "error_batch"
var cur_batch_lines = 'PLACEHOLDER:PLACEHOLDER:PLACEHOLDER:#000000'

var cur_identifier = 'PLACEHOLDER'
var cur_task = 'PLACEHOLDER'
var cur_description = 'PLACEHOLDER'
var cur_colors = []

func _ready():
	start_drawing_batch("startup_batch")

func has_drawing(identifier):
	return drawings.has(identifier)

func get_drawing(identifier):
	return drawings[identifier]

func start_drawing_batch(name):
	if name in globals.drawn:
		return
	
	var file = File.new()
	
	if file.file_exists("res://DrawingManager/" + name + ".txt"):
		cur_batch_name = name
		file.open("res://DrawingManager/" + name + ".txt", file.READ)
	else:
		cur_batch_name = "error_batch"
		file.open("res://DrawingManager/error_batch.txt", file.READ)
	
	cur_batch_lines = file.get_as_text().split('\n')
	file.close()
	
	handle_line()
	get_tree().change_scene_to(drawing_board_scene)
	globals.drawn.append(name)

func handle_line():
	var line = cur_batch_lines[0]
	cur_batch_lines.remove(0)
	
	var line_parts = line.split(':')
	var identifier = line_parts[0]
	var task = line_parts[1]
	var description = line_parts[2].split(';')
	
	var colors = []
	var color_strings = line_parts[3].split(';')
	for color_string in color_strings:
		if color_string[0] == '#':
			colors.append(Color(color_string))
		else:
			var color_rgb_strings = color_string.split(',')
			colors.append(Color(float(color_rgb_strings[0]), float(color_rgb_strings[1]), float(color_rgb_strings[2]), 1.0))
	
	self.cur_identifier = identifier
	self.cur_task = task
	self.cur_description = description
	self.cur_colors = colors

func _drawing_board_ready():
	var drawing_board = get_node('/root/DrawingBoard')
	drawing_board.init(cur_task, cur_description, cur_colors)
	drawing_board.connect('drawing_done', self, '_drawing_done')
	drawing_board.connect('transition_finished', self, '_transition_finished')

func _drawing_done(drawing_texture):
	drawings[cur_identifier] = drawing_texture
	get_tree().call_group('Drawings', '_drawing_changed', cur_identifier, drawing_texture)
	
	var drawing_board = get_node('/root/DrawingBoard')
	drawing_board.disconnect('drawing_done', self, '_drawing_done')
	
	if cur_batch_lines:
		get_tree().reload_current_scene()
		handle_line()
	else:
		drawing_board.play_transition()

func _transition_finished():
	var drawing_board = get_node('/root/DrawingBoard')
	drawing_board.queue_free()
	
	if cur_batch_name == startup_batch:
		get_tree().change_scene_to(main_menu_scene)
	else:
		get_tree().change_scene_to(main_game_scene)