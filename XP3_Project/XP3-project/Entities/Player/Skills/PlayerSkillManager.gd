extends Node

@export var SkillListRecipe:Array[SkillResource] = []
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
		AddElement(0)
		pass
	if(Input.is_action_just_pressed("AirElement")):
		AddElement(1)
		pass
	if(Input.is_action_just_pressed("WaterElement")):
		AddElement(2)
		pass
	
	if(Input.is_action_just_pressed("UseSkill")):
		useSkill()
	pass
	
func AddElement(elementIndex:int):
	if(firstElement == null):
		firstElement = ElementsAvaible[elementIndex]
		SignalManager.changeElement.emit(1,elementIndex)
		return
	else:
		if(secondElement ==null):
			secondElement= ElementsAvaible[elementIndex]
			SignalManager.changeElement.emit(2,elementIndex)
			return
	pass
	
	
func useSkill():
	if(secondElement != null):
		return
	pass
