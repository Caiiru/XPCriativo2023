extends CharacterBody2D

@export var target: Node2D
@export var sprite:Sprite2D
# Velocidade se trata da velocidade do inimigo; 
var speed = 60
# Aceleração se trata do quanto ele vai ser afetado ao fazer curvas e afins.
var acceleration = 7

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta):
	var direction = Vector2.ZERO
	# Gera o pathfinding até o Target (Player), utilizando a NavigationRegion2D
	# como base para área total do cálculo + Terrain Sets do TileSet
	# Para localizar e desviar dos Colliders impostos pelo Tilemap
	direction = navigation_agent.get_next_path_position() - global_position
	direction = direction.normalized()
	# Velocity usa lerp para dar a sensação de que está voando mesmo,
	# fazendo curvas mais abertas, dependendo de sua aceleração.
	velocity = velocity.lerp(direction * speed, acceleration * delta)
	
	move_and_slide()


# Quando timer resetar (Default: 0,1 segundos)
# atualiza a posição do player para a navegação.
func _on_timer_timeout():
	navigation_agent.target_position = target.global_position
