# Esse script é pra futuramente implementar scripts separados para cada tipo de projétil
extends Area2D

# Bullet speed
var ispeed = 0
var dir = 0
var ySpeed = 0
var bounceCounter = 0

# Bullet movement transform
func _physics_process(delta):
	ySpeed = ySpeed + 0.5
	position += transform.x * ispeed * delta * dir
	position += ySpeed * transform.y
	
func _on_projectile_collided(collision):
	if collision.collider is TileMap:
		ySpeed = -5
		bounceCounter = bounceCounter - 1
