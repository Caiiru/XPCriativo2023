class_name Entity
extends Node

@export var stats:EntityResource
@export var actor:CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takeDamage(value):
	if((stats.current_HP - value) <= 0):
		stats.current_HP = 0
		Die()
	else:
		stats.current_HP -= value

func isDead() -> bool:
	if(stats.current_HP <=0):
		return true
	else:
		return false
		
func Cure(value):
	if(stats.current_HP+value >= stats.max_HP):
		stats.current_HP = stats.max_HP
	else :
		stats.current_HP += value
		
func Die():
	print_debug(actor.name + " is Dead")
	print_debug(isDead())
	pass
