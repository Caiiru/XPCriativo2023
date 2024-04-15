class_name Projectile_Behavior
extends Node2D

@export var ProjectileSpeed = 200
var projectile:Node2D
var direction:Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	projectile = get_parent() as Node2D
	if (projectile == null): 
		print_debug("Pai não encontrado")
	
	var angle = projectile.rotation_degrees 
	print_debug(projectile.global_position)
	direction.y = sin(angle)
	direction.x = cos(angle)
	print_debug(angle)
	print_debug(direction)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#projectile.global_position.x += + 200 * delta
	projectile.global_position += (direction * 0) * delta
	pass
