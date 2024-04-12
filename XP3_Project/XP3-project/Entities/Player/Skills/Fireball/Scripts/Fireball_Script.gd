class_name FireballScript
extends DamageSkillResource

var fireballInstance = preload("res://Entities/Player/Skills/Fireball/Fireball_Projectile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Create(startPosition:Vector2):
	var instance = fireballInstance.instantiate()
	print_debug("Create Fireball")
	SignalManager.add_child(instance)
	if(instance):
		print_debug(instance.has_node("Transform2D"))
		instance.transform.x = Vector2(startPosition.x,0)
		instance.transform.y = Vector2(0,startPosition.y) 
		# TO DO: Instantiate on player position
	
