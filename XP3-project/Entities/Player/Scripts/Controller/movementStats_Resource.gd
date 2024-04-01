class_name PlataformerMovementStats
extends Resource

@export_group("Movement Variables")
@export var speed:float = 100

@export_group("Jump Variables")
@export var jump_height:float = 50
@export var jump_time_to_peak:float = 0.5
@export var jump_time_to_descent:float = 0.3
@export var coyote_time:float = 0.3
@export var jumpBuffering_time:float = 0.2

@export var groundingForce:float = -1.5
@export var jumpForce:float = 20
@export var jumpEndEarlyGravityModifier:float = 3
@export var fallAcceleration:float = 110