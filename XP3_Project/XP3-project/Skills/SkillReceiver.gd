extends Node2D
 
@export var skillData:Skill
# Called when the node enters the scene tree for the first time.
func _ready(): 
	SignalManager.in_createNewSkill.connect(_on_create_new_skill)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
 
func _on_create_new_skill(_skillData:Skill, startPosition:Vector2, direction:Vector2):
	skillData = _skillData
	pass
