extends Sprite
signal npc_area_in
signal npc_area_out
onready var globals = get_node("/root/Globals")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	globals.position=get_node("../Player").position
	emit_signal("npc_area_in")
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	emit_signal("npc_area_out")
	pass # Replace with function body.
