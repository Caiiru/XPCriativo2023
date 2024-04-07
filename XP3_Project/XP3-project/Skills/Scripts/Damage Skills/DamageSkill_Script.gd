class_name DamageSkill_Script
extends Skill
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(stats.type == stats.DamageSkillType.BALL):
		BallType_process()
		pass
	
	pass
	
func OnCreate():
	
	pass
	
func Use(startPos:Vector2, dir:Vector2):
	
	pass
	
func BallType_process():
	pass
