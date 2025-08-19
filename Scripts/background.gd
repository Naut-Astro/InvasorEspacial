extends Node2D

@onready var space: TextureRect = $Space
@onready var stars: TextureRect = $Stars


func _ready() -> void:
	SaveLoadManager._load()
	space.self_modulate = SaveLoadManager.savedata.bgcolor
	stars.self_modulate = SaveLoadManager.savedata.starcolor
	

func _process(_delta: float) -> void:
	handlecolorchange()
	

func handlecolorchange() -> void:
	if GlobalColors.starchanged:
		GlobalColors.starchanged = false
		stars.self_modulate = GlobalColors.starcolor
		SaveLoadManager.savedata.starcolor = stars.self_modulate
		SaveLoadManager._save()
	if GlobalColors.bgchanged:
		GlobalColors.bgchanged = false
		space.self_modulate = GlobalColors.bgcolor
		SaveLoadManager.savedata.bgcolor = space.self_modulate
		SaveLoadManager._save()
	
