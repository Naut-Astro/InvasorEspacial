extends Node2D

@onready var space: TextureRect = $Space
@onready var stars: TextureRect = $Stars


func _ready() -> void:
	space.self_modulate = GlobalColors.bgcolor
	stars.self_modulate = GlobalColors.starcolor

func _process(_delta: float) -> void:
	handlecolorchange()
	

func handlecolorchange() -> void:
	if GlobalColors.starchanged:
		GlobalColors.starchanged = false
		stars.self_modulate = GlobalColors.starcolor
	if GlobalColors.bgchanged:
		GlobalColors.bgchanged = false
		space.self_modulate = GlobalColors.bgcolor
