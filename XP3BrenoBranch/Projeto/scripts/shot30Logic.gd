class_name Shot30
extends Area2D

var direction : Vector2
var bounce = 4
var gravityValue = -200

func _physics_process(delta : float) -> void:
	position += direction * 150.0 * delta
	gravityValue = gravityValue + 10
	position.y += gravityValue * delta

func _on_body_entered(body):
	if body is TileMap && bounce != 0:
		bounce = bounce - 1
		gravityValue = -200
	elif body is TileMap && bounce == 0: queue_free()
