extends Node

signal addElement()

func _ready(): 
	pass
	
func _process(delta):
	addElement.emit()
	pass
	
 

