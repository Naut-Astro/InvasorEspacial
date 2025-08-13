extends GPUParticles2D

@onready var smokeGradient: Gradient = preload("res://Recursos/Smoke/smokecolorgradient.tres")

func _ready() -> void:
	smokeGradient.colors[0] = GlobalColors.smokeinitialcolor
	smokeGradient.colors[1] = GlobalColors.smokeendcolor
	

func _process(_delta: float) -> void:
	handlecolorchange()
	

func handlecolorchange():
	if GlobalColors.smokecolorchanged:
		smokeGradient.colors[0] = GlobalColors.smokeinitialcolor
		smokeGradient.colors[1] = GlobalColors.smokeendcolor
		GlobalColors.smokecolorchanged = false
	
