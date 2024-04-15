class_name ElementsInputManager
extends Node2D


@export var ElementsAvaible:Array[Element] = [] 

@export var firstElement:Element
@export var secondElement:Element

var facingDirection:Vector2
var aimObject:Player_Aim

var player:CharacterBody2D
var recipeList:Node2D

signal _inputSkill(_skill)

# Called when the node enters the scene tree for the first time.
func _ready():
	_inputSkill.connect(_onSkillReceived)
	
	firstElement = ElementsAvaible[3] ## none
	secondElement = ElementsAvaible[3] ## none
	recipeList = get_parent().get_node("PlayerSkillRecipeManager")
	if(recipeList != null):
		print_debug("Recipe List Checked")
	else:
		print_debug("not found recipe list")
		
	
	player = get_parent()
	
	aimObject = get_node_or_null("../MovementScripts/Aim") as Player_Aim 
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GatherInput()
	emitPlayerPosition()
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
func emitPlayerPosition():
	SignalManager.in_playerPosition.emit(player.global_position, get_tree().current_scene)
	pass
	
func AddElement(elementIndex:int):
	if(firstElement == ElementsAvaible[3]):
		firstElement = ElementsAvaible[elementIndex]
		SignalManager.in_changeElement.emit(1,elementIndex) 
		return
	elif(secondElement == ElementsAvaible[3]):
		secondElement= ElementsAvaible[elementIndex]
		SignalManager.in_changeElement.emit(2,elementIndex)
		return
		
	else:
		resetSelectedElements()
	pass
	
	
func useSkill(startPosition:Vector2):
	if(secondElement != ElementsAvaible[3]):
		#envia o sinal para a recipe list e recebe como sinal de skill
		recipeList._inputTwoElements.emit(firstElement,secondElement)
	
	resetSelectedElements()
	#print_debug(facingDirection)
	#
	#if(secondElement != null):
		#for skill in SkillListRecipe:
			#if(firstElement != skill.firstElement || secondElement != skill.secondElement):
				#return   
			#
			#skill.Create(get_tree().current_scene, startPosition,facingDirection)
			#resetSelectedElements()
			#pass
		#
			#break
		#return
	#pass

func resetSelectedElements():
	SignalManager.in_changeElement.emit(1,-1)
	SignalManager.in_changeElement.emit(2,-1) 
	firstElement = ElementsAvaible[3]
	secondElement = ElementsAvaible[3]
	

func _onSkillReceived(_skill:Skill):
	facingDirection = aimObject.aimingDirection
	_skill.Create(get_tree().current_scene, player.global_position, facingDirection)
	pass
