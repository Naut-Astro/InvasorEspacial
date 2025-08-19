extends Area2D

@onready var bullet_trail: GPUParticles2D = $Sprite2D/BulletTrail

var speed: float = 435.5

func _ready() -> void:
	bullet_trail.emitting = true
	

func _process(delta: float) -> void:
	position.y -= speed * delta
	
