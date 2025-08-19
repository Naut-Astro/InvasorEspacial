extends Node2D

const SMALLSMOKESPEED: float = 0.95
const BIGSMOKESPEED: float = 0.95
const BIGSMOKELIFETIME: float = 0.35

@onready var outline: Sprite2D = $Outline
@onready var fill: Sprite2D = $Fill
@onready var sprite: Node2D = $"."

@onready var lsmoke: GPUParticles2D = $ParticlesParent/leftSmoke
@onready var rsmoke: GPUParticles2D = $ParticlesParent/rightSmoke
@onready var csmoke1: GPUParticles2D = $"ParticlesParent/centerSmoke/1"
@onready var csmoke2: GPUParticles2D = $"ParticlesParent/centerSmoke/2"


func _ready() -> void:
	SaveLoadManager._load()
	updateColor()
	

func updateColor():
	fill.self_modulate = SaveLoadManager.savedata.shipfillcolor
	outline.self_modulate = SaveLoadManager.savedata.shipoutlinecolor
	

func _process(_delta: float) -> void:
	handlecolorchange()
	

func handlecolorchange() -> void:
	if GlobalColors.shipoutlinechanged:
		GlobalColors.shipoutlinechanged = false
		outline.self_modulate = GlobalColors.shipoutlinecolor
		SaveLoadManager.savedata.shipoutlinecolor = outline.self_modulate
		SaveLoadManager._save()
	if GlobalColors.shipfillchanged:
		GlobalColors.shipfillchanged = false
		fill.self_modulate = GlobalColors.shipfillcolor
		SaveLoadManager.savedata.shipfillcolor = fill.self_modulate
		SaveLoadManager._save()
	

func dynamicparticles(dir: Vector2) -> void:
	#Movimento horizontal ou dedicado pra cima
	if dir.x < 0:
		rsmoke.emitting = true
		lsmoke.emitting = false
	elif dir.x > 0:
		rsmoke.emitting = false
		lsmoke.emitting = true
	else: #Dedicado pra cima
		if dir.y < 0:
			rsmoke.emitting = true
			lsmoke.emitting = true
			rsmoke.speed_scale = 1.15
			lsmoke.speed_scale = 1.15
		else:
			rsmoke.emitting = false
			lsmoke.emitting = false
			rsmoke.speed_scale = SMALLSMOKESPEED
			lsmoke.speed_scale = SMALLSMOKESPEED
	
	#Movimento vertical
	if dir.y > 0:
		csmoke1.speed_scale = 0.75
		csmoke2.speed_scale = 0.75
		csmoke1.lifetime = 0.1
		csmoke2.lifetime = 0.1
	elif dir.y < 0:
		csmoke1.speed_scale = 1.15
		csmoke2.speed_scale = 1.15
		csmoke1.lifetime = BIGSMOKELIFETIME
		csmoke2.lifetime = BIGSMOKELIFETIME
	else:
		csmoke1.speed_scale = BIGSMOKESPEED
		csmoke2.speed_scale = BIGSMOKESPEED
		csmoke1.lifetime = BIGSMOKELIFETIME
		csmoke2.lifetime = BIGSMOKELIFETIME
	
