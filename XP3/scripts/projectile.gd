extends Area2D

# Bullet speed
var ispeed = 0
var dir = 0
var addSpeed = 0

# Bullet movement transform
func _physics_process(delta):
	ispeed = ispeed + addSpeed
	position += transform.x * ispeed * delta * dir
	
func _on_projectile_collided(collision):
	# KinematicCollision2D object emitted by character
	if collision.collider is TileMap:
		queue_free()
