extends Node

var colors = [Color.red, Color.aqua, Color.beige, Color.yellow, Color.darkgreen]

func _ready():
	var x = 10;
	
	for color in colors:
		var colorRect = ColorRect.new()
		colorRect.color = color
		colorRect.rect_position = Vector2(x, 0)
		colorRect.rect_size = Vector2(40, 40)
		add_child(colorRect)
		x += 50
		# colorRect.set_trans
		# colorSprite.texture = new Tex