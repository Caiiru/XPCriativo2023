extends Node

@export var debugShoot : Shooter

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_key_pressed(KEY_U):
		debugShoot.power1 = 0
	if Input.is_key_pressed(KEY_I):
		debugShoot.power1 = 1
