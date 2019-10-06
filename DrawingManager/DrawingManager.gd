extends Node

var drawings = {}

var main_game_scene_path = "res://moving character/Movemant.tscn"
var drawing_board_scene_path = "res://DrawingBoard/DrawingBoard.tscn"
var cur_batch_lines

var cur_identifier
var cur_task
var cur_description

func _ready():
	start_drawing_batch("startup_batch")

func has_drawing(identifier):
	return drawings.has(identifier)

func get_drawing(identifier):
	return drawings[identifier]

func start_drawing_batch(name):
	var file = File.new()
	
	if file.file_exists("res://DrawingManager/" + name + ".txt"):
		file.open("res://DrawingManager/" + name + ".txt", file.READ)
	else:
		file.open("res://DrawingManager/error_batch.txt", file.READ)
	
	cur_batch_lines = file.get_as_text().split('\n')
	file.close()
	
	print(cur_batch_lines)
	
	handle_line()
	get_tree().change_scene(drawing_board_scene_path)

func handle_line():
	var line = cur_batch_lines[0]
	cur_batch_lines.remove(0)
	
	var line_parts = line.split(':')
	var identifier = line_parts[0]
	var task = line_parts[1]
	var description = line_parts[2].split(';')
	
	self.cur_identifier = identifier
	self.cur_task = task
	self.cur_description = description

func _drawing_board_ready():
	print('c')
	var drawing_board = get_node('/root/DrawingBoard')
	drawing_board.init(cur_task, cur_description)
	drawing_board.connect('drawing_done', self, '_drawing_done')
	drawing_board.connect('transition_finished', self, '_transition_finished')

func _drawing_done(drawing_texture):
	print('dc')
	drawings[cur_identifier] = drawing_texture
	get_tree().call_group('Drawings', '_drawing_changed', cur_identifier, drawing_texture)
	
	var drawing_board = get_node('/root/DrawingBoard')
	drawing_board.disconnect('drawing_done', self, '_drawing_done')
	
	if cur_batch_lines:
		get_tree().reload_current_scene()
		handle_line()
	else:
		print('finished batch, returning')

func _transition_finished():
	get_tree().change_scene(main_game_scene_path)