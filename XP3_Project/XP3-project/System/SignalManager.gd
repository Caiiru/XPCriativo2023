extends Node

var intValue = 0
signal changeElement(elementPosition,elementIndex)

@export var HUD:Node

func _ready(): 
	changeElement.connect(_on_changedElement) 
	pass
	
func _process(delta):
	pass
	
	
func _on_changedElement(elementPosition,elementIndex):
	var format_string = "Changed Element on Position {pos} with Element Index: {ind}"
	var actual_string = format_string.format({"pos":elementPosition})
	format_string = actual_string.format({"ind":elementIndex})
	
	print_debug(format_string)
