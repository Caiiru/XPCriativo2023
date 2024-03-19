extends CharacterBody2D

const xspeed = 100.0
const jump_force = -280.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980

# Custom variables for project
var shootDelay = 0
var dir = 1

var Power1 = 0
var Power2 = 0

@onready var spriteDir := $anim as AnimatedSprite2D

# Export the projectile logic to playerControl
@export var projectile : PackedScene

func _physics_process(delta):
	# Generic Godot Platform Movement
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_key_pressed(KEY_S) and is_on_floor():
		velocity.y = jump_force

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * xspeed
	else:
		velocity.x = move_toward(velocity.x, 0, xspeed)
	
	move_and_slide()
	
	# Agora sim começa a alegria
	# Sprite direction
	if Input.is_key_pressed(KEY_RIGHT):
		spriteDir.scale.x = 1
		dir = 1
	if Input.is_key_pressed(KEY_LEFT):
		spriteDir.scale.x = -1
		dir = -1
		
	# If D is pressed, shoot
	if Input.is_key_pressed(KEY_D):
		shoot()
		# Also a timer for that
	if true:
		shootDelay = shootDelay - 1
	
	# Debug Keys
	if Input.is_key_pressed(KEY_U): Power1 = 0
	if Input.is_key_pressed(KEY_I): Power1 = 1
	if Input.is_key_pressed(KEY_O): Power1 = 2
	if Input.is_key_pressed(KEY_P): Power1 = 3
	
	if Input.is_key_pressed(KEY_H): Power2 = 0
	if Input.is_key_pressed(KEY_J): Power2 = 1
	if Input.is_key_pressed(KEY_K): Power2 = 2
	if Input.is_key_pressed(KEY_L): Power2 = 3

# Shoot function
func shoot():
	# Compare se o delay de tiros está zerado e qual Power Up vc possui
	
	# ~~ TIROS ISOLADOS ~~
	# Esses aqui só tem valor em um dos slots. Não nos dois.
	
	# Tiro de Fogo, velocidade constante e normal, dano moderado
	if shootDelay <= 0 and Power1 == 1 and Power2 == 0 or shootDelay <= 0 and Power1 == 0 and Power2 == 1:
		var p = projectile.instantiate()
		get_parent().add_child(p)
		if dir == 1: p.dir = 1
		else: p.dir = -1
		p.addSpeed = 0
		p.ispeed = 750
		p.scale.x = 1
		p.scale.y = 0.5
		p.global_position = $aim.global_position
		shootDelay = 30
		
	# Tiro de vento. Lento, mas acelera com o tempo e causa mais dano
	if shootDelay <= 0 and Power1 == 2 and Power2 == 0 or shootDelay <= 0 and Power1 == 0 and Power2 == 2:
		var p = projectile.instantiate()
		get_parent().add_child(p)
		if dir == 1: p.dir = 1
		else: p.dir = -1
		p.addSpeed = 25
		p.ispeed = 50
		p.scale.y = 0.5
		p.scale.x = 2
		p.global_position = $aim.global_position
		shootDelay = 50


func _on_projectile_tree_exited():
	pass # Replace with function body.
