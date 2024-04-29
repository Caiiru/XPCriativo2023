class_name Shot
extends Area2D

var direction : Vector2

func _process(delta : float) -> void:
	position += direction * 50.0 * delta


func _on_body_entered(body):
	if body is TileMap:
		queue_free()
