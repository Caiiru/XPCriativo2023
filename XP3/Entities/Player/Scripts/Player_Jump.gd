class_name PlayerJump
extends Node

#region Imports
@export var stats:PlataformerMovementStats
@export var actor:CharacterBody2D
#endregion

var _time:float

#region Inputs

var JumpDown:bool
var JumpHeld:bool
#endregion

#region Collision Variables
var _grounded:bool
#endregion

#region Jump variables
var _jumpToConsume:bool = false
var _endedJumpEarly:bool = false
var _timeJumpWasPressed:float = -5
var _bufferedJumpUsable:bool = false
var hasBufferedJump:bool = false

var _coyoteUsable:bool = false
var canUseCoyote:bool = false

var _frameLeftGround:float = -3.40282347
#endregion

func _process(delta):
	GatherInput()
	_time+=delta
	
	print_debug(canUseCoyote)
	  
	

func GatherInput():
	JumpDown = Input.is_action_just_pressed("ui_accept")
	JumpHeld = Input.is_action_pressed("ui_accept")
	
	if(JumpDown):
		_jumpToConsume = true
		_timeJumpWasPressed = _time   
		
	hasBufferedJump = _bufferedJumpUsable && (_time < _timeJumpWasPressed + stats.jumpBuffering_time)
	canUseCoyote = _coyoteUsable && !_grounded && _time<_frameLeftGround + stats.coyote_time

func _physics_process(delta):
	CheckCollision()
	HandleJump()
	HandleGravity(delta)


func CheckCollision():
	var groundHit:bool = actor.is_on_floor()
	
	if(!_grounded && groundHit): #landed
		_grounded = true
		_endedJumpEarly = false 
		_bufferedJumpUsable = true
		_coyoteUsable = true
	else: if(_grounded && !groundHit): #left ground
		_grounded = false 
		_frameLeftGround = _time


func HandleJump():
	if(!_endedJumpEarly && !_grounded && !JumpHeld && actor.velocity.y < 0):
		_endedJumpEarly = true 
	if(!_jumpToConsume && !hasBufferedJump): return
	if(_grounded || canUseCoyote):
		ExecuteJump() 
	_jumpToConsume=false
	
func ExecuteJump(): 
	_endedJumpEarly = false
	_jumpToConsume = false
	_bufferedJumpUsable = false
	_coyoteUsable = false
	_timeJumpWasPressed = 0
	actor.velocity.y = -(stats.jumpForce * 5)
	

func HandleGravity(delta):
	if(_grounded && actor.velocity.y > 0):
		actor.velocity.y = stats.groundingForce
	else:
		var inAirGravity = stats.fallAcceleration
		if(_endedJumpEarly && actor.velocity.y < 0 ):
			inAirGravity *= stats.jumpEndEarlyGravityModifier  
		actor.velocity.y = move_toward(actor.velocity.y, stats.fallAcceleration, inAirGravity * get_physics_process_delta_time())
 
