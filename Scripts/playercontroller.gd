extends CharacterBody2D

var speed := 245
var dir

func _process(_delta: float) -> void:
	movement()
	activateparticles()
	

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
	if dir.x > 0:
		pass #ativar chama esquerda
		
