class_name Projectile_Behavior
extends Node2D

var direction:Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	direction = get_parent() as Node2D
	if (direction != null):
		print_debug(direction)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
