extends Area2D

# Bullet speed
var ispeed = 0
var dir = 0
var addSpeed = 0
var gravityBullet = false
var ySpeed = 0
var bounceCounter = 0

# Bullet movement transform
func _physics_process(delta):
	ispeed = ispeed + addSpeed
	ySpeed = ySpeed + 0.5
	position += transform.x * ispeed * delta * dir
	# Confirme se a bala tem gravidade também
	if gravityBullet == true: position += ySpeed * transform.y

func _on_projectile_collided(collision):
	# KinematicCollision2D object emitted by character
	if gravityBullet == false:
		if collision.collider is TileMap:
			queue_free()
	else:
		ySpeed = -5
		bounceCounter = bounceCounter - 1


func _on_body_entered(body):
	if body is TileMap:
		pass # Replace with function body.
