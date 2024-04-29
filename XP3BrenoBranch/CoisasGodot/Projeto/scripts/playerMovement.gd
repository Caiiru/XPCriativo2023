extends CharacterBody2D
class_name player

const xSpeed = 200.0
const ySpeed = -280.0
var dir = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("regularJump") and is_on_floor():
		velocity.y = ySpeed

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("right"):
		dir = 1
		velocity.x = dir * xSpeed
	elif Input.is_action_pressed("left"):
		dir = -1
		velocity.x = dir * xSpeed
	else: velocity.x = 0

	move_and_slide()
