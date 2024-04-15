extends Node

@export var actor:CharacterBody2D   
@export var stats:PlataformerMovementStats
@export var sprite:Sprite2D
@export var raycast2D:RayCast2D
@export var raycast2D2:RayCast2D

# Se Sprite de Ronda, começa virado para a esquerda, inverter este valor;
var speed = 50.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Se Sprite de Ronda, começa virado para a esquerda, inverter este valor;
var facing_right = true

func _physics_process(delta):
	if not actor.is_on_floor():
		actor.velocity.y += gravity * delta
	
	# Se a primeira Raycast NÃO DETECTAR uma colisão abaixo do inimigo,
	# e o mesmo ainda estiver no chão, chama a função flip.
	if !raycast2D.is_colliding() && actor.is_on_floor():
		flip()
	
	# Se a segunda Raycast DETECTAR uma colisão ao lado do inimigo
	# (na direção que ele já está percorrendo) e o mesmo ainda estiver no chão,
	# chama a função flip
	if raycast2D2.is_colliding() && actor.is_on_floor():
		flip()
	
	actor.velocity.x = speed
	actor.move_and_slide()

# Inverte a direção do movimento, e o characterBody no axis X
func flip():
	facing_right = !facing_right
	
	actor.scale.x = abs(actor.scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1
