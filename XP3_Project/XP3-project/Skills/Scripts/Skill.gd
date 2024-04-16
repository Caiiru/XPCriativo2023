class_name Skill
extends Resource

@export var Name:String
@export var cooldown:int #Cooldown for skill in seconds
@export var SkillType:Skill_Type



@export var firstElement:Element
@export var secondElement:Element 

signal _SkillCreated

func Create(scene:Node2D, playerPosition:Vector2, direction:Vector2):
	_SkillCreated.emit() 
	pass
 
	

enum Skill_Type{DAMAGE, DEFENSE, UTILITY} 
 
