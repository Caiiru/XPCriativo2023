class_name PlatformerMovement
extends Node

@export var actor:CharacterBody2D   
@export var stats:PlataformerMovementStats
@export var sprite:Sprite2D

var playerInputs:Vector2

func _ready(): 
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	actor.move_and_slide() 
	GatherInput()

func GatherInput():
	if(stats.canMove): 
		playerInputs.x = Input.get_axis("ui_left","ui_right") 
	elif(!stats.canMove && !stats.isJumping):
		playerInputs = Vector2.ZERO
	
	#Check if the player is inputing a diferent direction than before
	if(playerInputs.x != 0 && stats.direction != playerInputs.x): 
		stats.direction = playerInputs.x
		actor.apply_scale(Vector2(-1,1))
		
		
	Move(playerInputs)
	


func Move(dir:Vector2): 
	actor.velocity = Vector2((dir.x*stats.speed), actor.velocity.y)
	

