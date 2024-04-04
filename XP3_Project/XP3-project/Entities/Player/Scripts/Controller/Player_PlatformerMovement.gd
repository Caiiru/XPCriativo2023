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
		playerInputs.y = Input.get_axis("ui_down","ui_up")
	elif(!stats.canMove && !stats.isJumping):
		playerInputs = Vector2.ZERO
	
	Move(playerInputs)

func Move(dir:Vector2): 
	actor.velocity = Vector2((dir.x*stats.speed), actor.velocity.y)
	
	
	#Change Sprite Direction
	
	if(actor.velocity.x > 0): 
		sprite.flip_h = 1

	if(actor.velocity.x<0): 
		sprite.flip_h = 0
	
