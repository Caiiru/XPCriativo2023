extends Node

var intValue = 0
#region Input Signal

signal in_changeElement(elementPosition,elementIndex) #sinal para receber a input de skill
signal in_playerPosition(position, scene) #sinal para passar a posição atual do player

#endregion

#region Output Signal
signal playerInputElement(valuePosition,valueIndex )
#endregion
 

func _ready(): 
	in_changeElement.connect(_on_changedElement) 
	in_playerPosition.connect(_on_player_position)
	pass
	
func _process(delta):
	pass
	
	
func _on_changedElement(elementPosition,elementIndex):
	var format_string = "Changed Element on Position {pos} with Element Index: {ind}"
	var actual_string = format_string.format({"pos":elementPosition})
	format_string = actual_string.format({"ind":elementIndex}) 
	emit_signal("playerInputElement",elementPosition,elementIndex)
	#tentar enviar agora um sinal para o hud com esses parametros 
	
func _on_player_position(position, scene):
	
	pass
