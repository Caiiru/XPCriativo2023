extends Node

var intValue = 0
signal changeElement(elementPosition,elementIndex) #sinal para receber a input de skill
signal playerInputElement(valuePosition,valueIndex )
@export var HUD:Script

func _ready(): 
	changeElement.connect(_on_changedElement) 
	pass
	
func _process(delta):
	pass
	
	
func _on_changedElement(elementPosition,elementIndex):
	var format_string = "Changed Element on Position {pos} with Element Index: {ind}"
	var actual_string = format_string.format({"pos":elementPosition})
	format_string = actual_string.format({"ind":elementIndex})
	#print_debug(format_string) 
	emit_signal("playerInputElement",elementPosition,elementIndex)
	#tentar enviar agora um sinal para o hud com esses parametros 
	
	
