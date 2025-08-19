extends CharacterBody2D

const SHOT = preload("res://Cenas/tiro.tscn")
const BIGSHOT = preload("res://Cenas/tiro_carregado.tscn")

@onready var sprite: Node2D = $ShipSprite
@onready var gun: Marker2D = $Marker2D

var speed := 245
var dir

var chargethreshold := 0.25
var fullchargetime := 1.35
var shotcooldown := 0.0
var canshoot := true
var autofire := false
var shotbuttonheld := false
var charging := false
var chargetime := 0.0
var sparkledonce := false


func _process(delta: float) -> void:
	movement()
	activateparticles()
	shoot(delta)
	

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
	applybounds()
	

func applybounds():
	position.x = clamp(position.x, 40, GlobalScreenCfg.currentres.x - 40)
	position.y = clamp(position.y, 140, GlobalScreenCfg.currentres.y - 40)

func activateparticles() -> void:
	sprite.smokeparticles(dir)
	

func shoot(delta) -> void:
	if not autofire:
		shotcooldown -= delta
		if shotcooldown <= 0:
			canshoot = true
		
		if Input.is_action_just_pressed("Shoot"):
			shotbuttonheld = true
			chargetime = 0.0
			
		
		if shotbuttonheld and Input.is_action_pressed("Shoot"):
			chargetime += delta
			
			if chargetime >= chargethreshold:
				chargingeffects(true)
				if not charging:
					charging = true
			
		
		if Input.is_action_just_released("Shoot") and shotbuttonheld and canshoot:
			if charging and chargetime + chargethreshold >= fullchargetime:
				chargeshot()
				shotcooldown = 0.35
				pass
			else:
				quickshot()
				shotcooldown = 0.2
				pass
			
			
			charging = false
			shotbuttonheld = false
			canshoot = false
			sparkledonce = false
			chargingeffects(false)
		
	

func chargingeffects(active: bool):
	if active:
		if chargetime + chargethreshold < fullchargetime:
			sprite.chargingsparkle.emitting = true
		elif sparkledonce == false:
			sprite.chargingsparkle.emitting = false
			sprite.chargedsparkle.emitting = true
			sparkledonce = true
	else:
		sprite.chargingsparkle.emitting = false
		sprite.chargedsparkle.emitting = false

func chargeshot():
	var bs = BIGSHOT.instantiate()
	bs.global_position = gun.global_position
	add_sibling(bs)
	

func quickshot():
	var qs = SHOT.instantiate()
	qs.global_position = gun.global_position
	add_sibling(qs)
