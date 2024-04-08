extends Node

@export var SkillListRecipe:Array[Element] = []
@export var ElementsAvaible:Array[Element] = [] 
@export var firstElement:Element
@export var secondElement:Element


# Called when the node enters the scene tree for the first time. 
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GatherInput()
	pass
	
	
func GatherInput():
	if(Input.is_action_just_pressed("FireElement")):
		AddElement(ElementsAvaible[0])
		SignalManager.addElement.emit()
		pass
	if(Input.is_action_just_pressed("AirElement")):
		AddElement(ElementsAvaible[1])
		pass
	if(Input.is_action_just_pressed("WaterElement")):
		AddElement(ElementsAvaible[2])
		pass
	
	pass
	
func AddElement(element:Element):
	if(firstElement != null):
		firstElement = element
		print_debug("Ffire") 
		
		return
	if(secondElement !=null):
		secondElement=element
		return
	
	pass
