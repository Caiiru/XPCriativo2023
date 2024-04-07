@tool

class_name DamageSkillResource
extends SkillResource

@export var damage:int
@export var fireRate:int #how much spawn in one second
@export var type: DamageSkillType

enum DamageSkillType{
	BALL,
	LASER
}



