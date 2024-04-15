class_name FireballScript
extends DamageSkillResource

var fireballInstance = preload("res://Entities/Player/Skills/Fireball/Fireball_Projectile.tscn")
var currentInstance:Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Create(scene:Node2D, startPosition:Vector2,dir:Vector2):
	currentInstance = fireballInstance.instantiate() as Node2D
	#print_debug("Create Fireball")
	scene.add_child(currentInstance)
	if(currentInstance):
		currentInstance.global_position = startPosition
		#instance.global.rotation = dir
		Rotate(dir)
		#print_debug(currentInstance.has_node("Transform2D"))
		# TO DO: Instantiate on player position
	
func Rotate(targetDirection:Vector2):
	var direction = ((currentInstance.global_position + targetDirection) - currentInstance.global_position)
	var angleTo = currentInstance.transform.x.angle_to(direction)
	currentInstance.rotate(sign(angleTo))
	print_debug(angleTo)
	pass
