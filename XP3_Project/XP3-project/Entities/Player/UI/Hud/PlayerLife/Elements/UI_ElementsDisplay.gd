extends Node

signal changeFirstElement(value)
signal changeSecondElement(value)

# Called when the node enters the scene tree for the first time.
func _ready():
	changeFirstElement.connect(_on_ChangedFirstElement)
	changeSecondElement.connect(_on_ChangedSecondElement)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _ChangeElement(): 
	pass
	
func _on_ChangedFirstElement(value):
	pass

func _on_ChangedSecondElement(value):
	pass
