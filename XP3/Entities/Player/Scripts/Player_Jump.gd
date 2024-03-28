class_name PlayerJump
extends Node

@export var player_movement_stats: PlataformerMovementStats
@export var actor:CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
 

@onready var jump_velocity:float = ((2.0 * player_movement_stats.jump_height) / player_movement_stats.jump_time_to_peak)*-1
@onready var jump_gravity:float = ((-2.0 * player_movement_stats.jump_height) / (player_movement_stats.jump_time_to_peak * player_movement_stats.jump_time_to_peak)) * -1
@onready var fall_gravity:float = ((-2.0 * player_movement_stats.jump_height) / (player_movement_stats.jump_time_to_descent * player_movement_stats.jump_time_to_descent))*-1


 

func get_gravity() -> float:
	if(actor.velocity.y < 0):
		return jump_gravity
	
	return fall_gravity

func _process(delta): 
	actor.velocity.y += get_gravity() * delta
	
	if(Input.is_action_just_pressed("ui_accept") && actor.is_on_floor() ):
		Jump()
  
	 

func Jump(): 
	actor.velocity.y = jump_velocity
 
