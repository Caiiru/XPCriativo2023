extends Entity

@export var attack:bool = false
@export var damageToTake:int

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(attack):
		attack = false
		takeDamage(damageToTake)
	pass
