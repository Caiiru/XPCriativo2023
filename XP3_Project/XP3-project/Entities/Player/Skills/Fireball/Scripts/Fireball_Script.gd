class_name FireballScript
extends DamageSkillResource

var fireballInstance = preload("res://Entities/Player/Skills/Fireball/Fireball_Projectile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Create(scene:Node2D, startPosition:Vector2):
	var instance := fireballInstance.instantiate() as Node2D
	print_debug("Create Fireball")
	scene.add_child(instance)
	if(instance):
		instance.global_position = startPosition
		print_debug(instance.has_node("Transform2D"))
		# TO DO: Instantiate on player position
	
