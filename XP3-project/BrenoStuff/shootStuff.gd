extends Node2D

# Cena
@export var scene : PackedScene

var direction  = 1
var reload = 0
# Função de atirar
func shoot(direction : Vector2) -> void:
	var new_shot := scene.instantiate() as Shot
	if new_shot:
		new_shot.direction = direction
		get_tree().root.add_child(new_shot)

# Funcionamento Constante do Projeto
func _process(_delta : float) -> void:
	reload = reload - 1
	if Input.is_action_pressed("shootInput") and reload <= 0:
		shoot(Vector2(1.0, 0.0))
		reload = 30
