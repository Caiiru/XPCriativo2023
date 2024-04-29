class_name Shot20
extends Area2D

var direction : Vector2

var speed = 0
func _physics_process(delta : float) -> void:
	speed = speed + 30
	position += direction * (50.0 + speed) * delta

func _on_body_entered(body):
	if body is TileMap:
		queue_free()
