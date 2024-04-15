class_name FireballScript
extends DamageSkillResource

var fireballInstance = preload("res://Entities/Player/Skills/Fireball/Fireball_Projectile.tscn")
var currentInstance:Node2D
@export var projectileSpeed:float = 10; 
# Called when the node enters the scene tree for the first time.
func _ready():
	wasCreated=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

func Create(scene:Node2D, startPosition:Vector2,dir:Vector2):
	currentInstance = fireballInstance.instantiate() as Node2D
	scene.add_child(currentInstance)
	if(currentInstance):
		currentInstance.global_position = startPosition 
		Rotate(dir) 
		wasCreated=true
	
func Rotate(targetDirection:Vector2):
	currentInstance.look_at(currentInstance.global_position + Vector2(targetDirection.x, targetDirection.y))
	pass
	
 
		
