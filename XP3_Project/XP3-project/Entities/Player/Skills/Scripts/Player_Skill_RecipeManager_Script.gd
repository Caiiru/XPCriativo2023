class_name RecipeManager
extends Node

@export var RecipeList:Array[Recipe] = []

var InputManager:Node2D

#Signal to receive two elements
signal _inputTwoElements(firstElement, secondElement)

#Signal to output one recipe / skill

# Called when the node enters the scene tree for the first time.
func _ready():
	_inputTwoElements.connect(_on_element_was_inputed)
	InputManager = get_parent().get_node("PlayerSkillInputManager")
	if(InputManager):
		print_debug("Manager find")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_element_was_inputed(_firstElement, _secondElement):
	print_debug("Recipe pen es")
	for recipe in RecipeList:
		if(recipe.FirstElement == _firstElement && recipe.SecondElement == _secondElement):
			InputManager._inputSkill.emit(recipe.skill) 
			break
		else:
			print_debug("no skill")
	pass
