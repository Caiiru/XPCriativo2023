extends Node

@export var elements_display:Node2D

signal elements_changed(elementPosition,elementIndex)
# Called when the node enters the scene tree for the first time.
func _ready():
	elements_changed.connect(_on_elements_changed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_elements_changed(elementPosition,elementIndex):
	pass


func _on_signal_manager_change_element(elementPosition, elementIndex):
	print_debug("dentro da hud ")
	# TO DO : Arrumar isso, a ideia é pegar o signal recebido pelo "Signal Manager" e passar pelo HUD Controller
	# e posteriormente enviar ao display_skill com as informações necessarias
	pass # Replace with function body.
