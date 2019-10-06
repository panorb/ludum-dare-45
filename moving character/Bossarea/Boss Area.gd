extends Sprite
signal bossarea_entered
signal bossarea_left
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Area2D/CollisionShape2D").set_disabled(false)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	emit_signal("bossarea_entered")
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	emit_signal("bossarea_left")
	globals.position = get_node("../Player").position
	pass # Replace with function body.


func _on_Boss_hide():
	get_node("Area2D/CollisionShape2D").set_disabled(true)
	pass # Replace with function body.
