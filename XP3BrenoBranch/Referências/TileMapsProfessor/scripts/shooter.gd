extends Node2D

@export var scene : PackedScene

func shoot(direction : Vector2) -> void:
	var new_shot := scene.instantiate() as Shot
	if new_shot:
		new_shot.direction = direction
		get_tree().root.add_child(new_shot)

func _process(delta : float) -> void:
	if Input.is_action_just_pressed("shoot_right"):
		shoot(Vector2(1.0, 0.0))
	if Input.is_action_just_pressed("shoot_left"):
		shoot(Vector2(-1.0, 0.0))
