class_name Shooter
extends Node2D
# Cena
@export var scene10 : PackedScene
@export var scene20 : PackedScene
@export var scene30 : PackedScene
@export var Player : player

var reload = 0 # Tempo de espera para o jogador atirar novamente
var reloadType = 0 # Os tipos são usados como uma globalização dos vários tempos de espera
var power1 = 3 # slot 1 de power ups
var power2 = 0 # slot 2 de power ups

# Função de atirar
func shoot(direction : Vector2) -> void:
	# tiro de fogo 1-0
	if power1 == 1 && power2 == 0:
		reloadType = 1
		var new_shot := scene10.instantiate() as Shot10
		if new_shot:
			new_shot.direction = Vector2(Player.dir, 0.0)
			new_shot.position = Player.position
			get_tree().root.add_child(new_shot)
			
	# tiro de vento 2-0
	if power1 == 2 && power2 == 0:
		reloadType = 2
		var new_shot := scene20.instantiate() as Shot20
		if new_shot:
			new_shot.direction = Vector2(Player.dir, 0.0)
			new_shot.position = Player.position
			get_tree().root.add_child(new_shot)
	
	# tiro de água 3-0
	if power1 == 3 && power2 == 0:
		reloadType = 3
		var new_shot := scene30.instantiate() as Shot30
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
		if reloadType == 3: reload = 30
