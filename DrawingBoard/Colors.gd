extends Node2D

export var pickable_color_scene : PackedScene = preload("res://DrawingBoard/PickableColor/PickableColor.tscn")
export var eraser_tool_scene : PackedScene = preload("res://DrawingBoard/EraserTool/EraserTool.tscn")
export var clear_tool_scene : PackedScene = preload("res://DrawingBoard/ClearTool/ClearTool.tscn")

onready var switch_sound = get_node("../../Sounds/Switch")

var colors = []
var selected_color
signal draw_color_changed(selected_color)
signal clear_ordered

func create_tools():
	for node in get_children():
		node.queue_free()
	
	var x = 36;
	
	selected_color = colors[0]
	emit_signal("draw_color_changed", selected_color)
	
	# Pickable colors
	for color in colors:
		var pickable_color = pickable_color_scene.instance()
		pickable_color.init(color)
		pickable_color.position.x = x
		pickable_color.position.y = 32
		pickable_color.connect('draw_color_selected', self, '_draw_color_selected')
		pickable_color.connect('hovered', self, '_hovered')
		add_child(pickable_color)
		
		x += 74
	
	# Eraser tool - Internally pink, alpha created by a shader
	var eraser_tool = eraser_tool_scene.instance()
	eraser_tool.position.x = x
	eraser_tool.position.y = 32
	eraser_tool.connect('draw_color_selected', self, '_draw_color_selected')
	eraser_tool.connect('hovered', self, '_hovered')
	add_child(eraser_tool)
	
	x += 74
	
	# Clear All Tool
	var clear_tool = clear_tool_scene.instance()
	clear_tool.position.x = x
	clear_tool.position.y = 32
	clear_tool.connect('clear_ordered', self, '_clear_ordered')
	clear_tool.connect('hovered', self, '_hovered')
	add_child(clear_tool)

#func _ready():
#	recreate_tools()

func _draw_color_selected(color):
	emit_signal("draw_color_changed", color)

func _clear_ordered():
	emit_signal("clear_ordered")

func _hovered():
	switch_sound.play()
