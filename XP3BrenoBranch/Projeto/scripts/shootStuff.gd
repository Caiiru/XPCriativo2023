class_name Shooter
extends Node2D

# Cena
@export var scene : PackedScene
@export var Player : player

var reload = 0
var power1 = 0
var power2 = 0
# Função de atirar
func shoot(direction : Vector2) -> void:
	if power1 == 1:
		var new_shot := scene.instantiate() as Shot10
		if new_shot:
			new_shot.direction = Vector2(Player.dir, 0.0)
			new_shot.position = Player.position
			get_tree().root.add_child(new_shot)
	
# Funcionamento Constante do Projeto
func _process(_delta : float) -> void:
	reload = reload - 1
	if Input.is_action_pressed("shootInput") and reload <= 0:
		shoot(Vector2(1.0, 0.0))
		reload = 30
