extends Area2D

@onready var animation := $anim as AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation.play("default")
	if animation.animation_finished:
		queue_free()
	pass
