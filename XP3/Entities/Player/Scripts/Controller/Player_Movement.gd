extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const jump_fallMultiplier = 2.5
const jump_lowJumpMultiplier = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		Jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
 

func Jump():
	if(velocity.y < 0):
		velocity += JUMP_VELOCITY * Vector2.UP * gravity * (jump_fallMultiplier-1) * get_process_delta_time()
	elif (velocity.y > 0 && !Input.is_action_just_pressed("ui_accept")):
			velocity += Vector2.UP * gravity * (jump_lowJumpMultiplier-1) * get_process_delta_time()
	
