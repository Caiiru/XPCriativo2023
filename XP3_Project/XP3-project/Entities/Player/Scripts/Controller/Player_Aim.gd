class_name Player_Aim
extends Node

@export var stats:PlataformerMovementStats
var isAiming:bool = false
@export var aimingDirection:Vector2 = Vector2.ZERO 
@export var AimObject:Node2D
@export var actor:CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body. 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	GatherInput()

func GatherInput():
	aimingDirection.x = Input.get_axis("ui_left","ui_right")
	aimingDirection.y = Input.get_axis("ui_down","ui_up")
	if (Input.is_action_just_pressed("PlayerAim") && stats.canMove == true):
		stats.canMove = false
		isAiming = true
	if(Input.is_action_just_released("PlayerAim") && stats.canMove == false):
		stats.canMove = true
		isAiming = false
		
	if(stats.direction != aimingDirection.x && isAiming && aimingDirection.x != 0):
		stats.direction = aimingDirection.x	
		actor.apply_scale(Vector2(-1,1))
		
	Aim()
		
func Aim():
	if(isAiming):
		AimObject.look_at(actor.transform.get_origin() + Vector2(aimingDirection.x, -aimingDirection.y))
	else:
		AimObject.look_at(actor.transform.get_origin() + Vector2(stats.direction,0))
	pass
