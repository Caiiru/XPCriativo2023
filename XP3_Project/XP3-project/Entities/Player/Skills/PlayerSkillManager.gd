extends Node

@export var SkillListRecipe:Array[Skill] = []
@export var ElementsAvaible:Array[Element] = [] 
@export var firstElement:Element
@export var secondElement:Element

var player:CharacterBody2D

# Called when the node enters the scene tree for the first time. 
func _ready():
	pass # Replace with function body.
	firstElement = ElementsAvaible[3] ##none
	secondElement = ElementsAvaible[3] ##none
	
	player = get_parent()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	GatherInput()
	pass
	
	
func GatherInput():
	if(Input.is_action_just_pressed("FireElement")):
		AddElement(1)
		pass
	if(Input.is_action_just_pressed("AirElement")):
		AddElement(0)
		pass
	if(Input.is_action_just_pressed("WaterElement")):
		AddElement(2)
		pass
	
	if(Input.is_action_just_pressed("UseSkill")): 
		useSkill(player.global_position)
	pass
	
func AddElement(elementIndex:int):
	if(firstElement == ElementsAvaible[3]):
		firstElement = ElementsAvaible[elementIndex]
		SignalManager.changeElement.emit(1,elementIndex) 
		return
	elif(secondElement == ElementsAvaible[3]):
		secondElement= ElementsAvaible[elementIndex]
		SignalManager.changeElement.emit(2,elementIndex)
		return
		
	else:
		firstElement = ElementsAvaible[3]
		secondElement = ElementsAvaible[3]
		SignalManager.changeElement.emit(1,-1)
		SignalManager.changeElement.emit(2,-1) 
	pass
	
	
func useSkill(startPosition:Vector2):
	if(secondElement != null):
		for skill in SkillListRecipe:
			if(firstElement != skill.firstElement || secondElement != skill.secondElement):
				return 
			skill.Create(startPosition)
			pass
		
			break
		return
	pass
