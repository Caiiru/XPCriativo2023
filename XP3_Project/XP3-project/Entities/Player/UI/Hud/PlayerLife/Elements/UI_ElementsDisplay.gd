extends Node
 
@export var Elements:Array[Element] = []
@export var firstElementSprite:Sprite2D
@export var secondElementSprite:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.connect("playerInputElement",_handleWithPlayerInputElement)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _ChangeElement(): 
	pass
	
func _handleWithPlayerInputElement(valuePosition,valueIndex):  
	if(valueIndex == -1):
		firstElementSprite.texture = null
		secondElementSprite.texture = null 
	else:
		if(valuePosition == 1):
			firstElementSprite.texture = Elements[valueIndex].sprite
		if(valuePosition == 2):
			secondElementSprite.texture = Elements[valueIndex].sprite
	
	pass
