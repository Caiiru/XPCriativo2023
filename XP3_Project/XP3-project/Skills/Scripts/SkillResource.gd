class_name SkillResource
extends Resource

@export var Name:String
@export var cooldown:int #Cooldown for skill in seconds
@export var SkillType:Skill_Type


@export var firstElement:Element
@export var secondElement:Element

enum Skill_Type{DAMAGE, DEFENSE, UTILITY} 
 
