@tool

class_name DamageSkillResource
extends Skill

@export var damage:int
@export var type: DamageSkillType
@export var wasCreated:bool

enum DamageSkillType{
	BALL,
	LASER
}



