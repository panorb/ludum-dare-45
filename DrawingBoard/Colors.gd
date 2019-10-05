extends Node

export var pickable_color_scene : PackedScene = preload("res://DrawingBoard/PickableColor/PickableColor.tscn")
var colors = [Color.red, Color.aqua, Color.beige, Color.yellow, Color.darkgreen]

func _ready():
	var x = 10;
	
	for color in colors:
		var pickable_color = pickable_color_scene.instance()
		pickable_color.init(color)
		pickable_color.position.x = x
		pickable_color.position.y = 32
		add_child(pickable_color)
		
		x += 74
		# colorRect.set_trans
		# colorSprite.texture = new Tex