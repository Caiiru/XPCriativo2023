extends Node

@export var heartObject = preload("res://Entities/Player/UI/Hud/Heart/heart.tscn")
@export var player:EntityResource 
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var heartIllustration = get_child(0)
	heartIllustration.queue_free()
	
	var howMuchHeartCreate = player.max_HP/2
	for n in range(howMuchHeartCreate):
		spawnHeart(n)
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnHeart(value:int):  
	var instance = heartObject.instantiate()
	add_child(instance) 
	value +=1
	instance.position = Vector2(value * 20, 20)
	pass
