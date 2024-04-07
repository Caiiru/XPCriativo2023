extends Node

@export var SkillListRecipe = []

@export var firstElement:SkillResource.SkillElement
@export var secondElement:SkillResource.SkillElement

# Called when the node enters the scene tree for the first time. 
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GatherInput()
	pass
	
	
func GatherInput():
	if(Input.is_action_just_pressed("FireElement")):
		print_debug("Fire")
		pass
	if(Input.is_action_just_pressed("AirElement")):
		print_debug("Air")
		pass
	if(Input.is_action_just_pressed("WaterElement")):
		print_debug("Water")
		pass
	
	pass
	
func AddElement(element:SkillResource.SkillElement):
	if(firstElement == SkillResource.SkillElement.NONE):
		firstElement = element
		return
		pass
	if(secondElement == SkillResource.SkillElement.NONE):
		secondElement = element
		return
	pass
