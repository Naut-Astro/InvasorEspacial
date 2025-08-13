extends Node2D

@onready var outline: Sprite2D = $Outline
@onready var fill: Sprite2D = $Fill
@onready var sprite: Node2D = $"."

@onready var lsmoke: GPUParticles2D = $ParticlesParent/leftSmoke
@onready var rsmoke: GPUParticles2D = $ParticlesParent/rightSmoke
@onready var csmoke1: GPUParticles2D = $"ParticlesParent/centerSmoke/1"
@onready var csmoke2: GPUParticles2D = $"ParticlesParent/centerSmoke/2"


func _ready() -> void:
	outline.self_modulate = GlobalColors.shipoutlinecolor
	fill.self_modulate = GlobalColors.shipfillcolor
	

func _process(_delta: float) -> void:
	handlecolorchange()
	

func handlecolorchange() -> void:
	if GlobalColors.shipoutlinechanged:
		GlobalColors.shipoutlinechanged = false
		outline.self_modulate = GlobalColors.shipoutlinecolor
	if GlobalColors.shipfillchanged:
		GlobalColors.shipfillchanged = false
		fill.self_modulate = GlobalColors.shipfillcolor
	if GlobalColors.shipfillcolor[3] <= 0.55 && GlobalColors.shipoutlinecolor[3] <= 0.54:
		GlobalColors.shipoutlinecolor[3] = 0.55
		GlobalColors.shipoutlinechanged = true
		GlobalColors.updateoutlinealpha = true
	
