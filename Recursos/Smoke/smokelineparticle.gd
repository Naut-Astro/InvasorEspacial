extends GPUParticles2D

@onready var smokeGradient: Gradient = preload("res://Recursos/Smoke/smokecolorgradient.tres")


func _ready() -> void:
	SaveLoadManager._load()
	smokeGradient.colors[0] = SaveLoadManager.savedata.smokeinitialcolor
	smokeGradient.colors[1] = SaveLoadManager.savedata.smokeendcolor
	

func _process(_delta: float) -> void:
	handlecolorchange()
	

func handlecolorchange():
	if GlobalColors.smokecolorchanged:
		GlobalColors.smokecolorchanged = false
		smokeGradient.colors[0] = GlobalColors.smokeinitialcolor
		smokeGradient.colors[1] = GlobalColors.smokeendcolor
		SaveLoadManager.savedata.smokeinitialcolor = smokeGradient.colors[0]
		SaveLoadManager.savedata.smokeendcolor = smokeGradient.colors[1]
		SaveLoadManager._save()
	
