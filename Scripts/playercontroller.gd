extends CharacterBody2D

const SHOT = preload("res://Cenas/tiro.tscn")
const BIGSHOT = preload("res://Cenas/tiro_carregado.tscn")

@onready var sprite: Node2D = $ShipSprite
@onready var gun: Marker2D = $Marker2D

var speed := 245
var dir
var chargethreshold := 0.5
var fullchargetime := 1.35


func _process(_delta: float) -> void:
	movement()
	activateparticles()
	shoot()
	

func movement() -> void:
	dir = Input.get_vector("Left","Right","Up","Down")
	velocity = dir * speed
	
	if velocity.y < 0:
		if velocity.x == 0: #Movimento dedicado para cima
			velocity.y = velocity.y - 30
		else:
			velocity.y = velocity.y + 15
	elif velocity.y > 0:
		velocity.y = velocity.y - 35
	
	move_and_slide()
	

func activateparticles() -> void:
	sprite.dynamicparticles(dir)
	

func shoot() -> void:
	if Input.is_action_just_pressed("Shoot"):
		var shot = SHOT.instantiate()
		shot.global_position = gun.global_position
		add_sibling(shot)
	
