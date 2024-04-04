class_name Player_Aim
extends Node

@export var stats:PlataformerMovementStats
var isAiming:bool = false
@export var playerDirection:Vector2 = Vector2.ZERO 
@export var AimSprite:Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body. 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	GatherInput()

func GatherInput():
	playerDirection.x = Input.get_axis("ui_left","ui_right")
	playerDirection.y = Input.get_axis("ui_down","ui_up")
	
	if (Input.is_action_just_pressed("PlayerAim") && stats.canMove == true):
		stats.canMove = false
		isAiming = true
	if(Input.is_action_just_released("PlayerAim") && stats.canMove == false):
		stats.canMove = true
		isAiming = false
		
	if(playerDirection.x < 0):
		pass
		
		
	
		
func Aim():
	if(isAiming):
		pass
