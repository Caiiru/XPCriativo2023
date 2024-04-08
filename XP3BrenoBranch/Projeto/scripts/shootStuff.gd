class_name Shooter
extends Node2D
# Cena
@export var scene : PackedScene
@export var Player : player

var reload = 0 # Tempo de espera para o jogador atirar novamente
var reloadType = 0 # Os tipos são usados como uma globalização dos vários tempos de espera
var power1 = 1
var power2 = 0
# Função de atirar
func shoot(direction : Vector2) -> void:
	# tiro de fogo 1-0
	if power1 == 1 && power2 == 0:
		reloadType = 1
		var new_shot := scene.instantiate() as Shot10
		if new_shot:
			new_shot.direction = Vector2(Player.dir, 0.0)
			new_shot.position = Player.position
			get_tree().root.add_child(new_shot)
			
	# tiro de vento 2-0
	if power1 == 2 && power2 == 0:
		reloadType = 2
		var new_shot := scene.instantiate() as Shot20
		if new_shot:
			new_shot.direction = Vector2(Player.dir, 0.0)
			new_shot.position = Player.position
			get_tree().root.add_child(new_shot)
	
# recarregamento dos vários projéteis
func _process(_delta : float) -> void:
	reload = reload - 1
	if Input.is_action_pressed("shootInput") and reload <= 0:
		shoot(Vector2(1.0, 0.0))
		if reloadType == 1: reload = 60
		if reloadType == 2: reload = 120
