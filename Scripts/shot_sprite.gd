extends Sprite2D

@onready var bulletsparkle := preload("res://Recursos/Bullet/bulletprocessmaterial.tres")
@onready var bigbulletsparkle := preload("res://Recursos/Bullet/BIGbulletprocessmaterial.tres")
@onready var chargedbulletsparkle := preload("res://Recursos/Bullet/chargedbulletprocessmaterial.tres")
@onready var bigchargedbulletsparkle := preload("res://Recursos/Bullet/BIGchargedbulletprocessmaterial.tres")


func _ready() -> void:
	self.self_modulate = GlobalColors.shipshotcolor
	bulletsparkle.color = GlobalColors.shipshotcolor
	bigbulletsparkle.color = GlobalColors.shipshotcolor
	chargedbulletsparkle.color = GlobalColors.shipshotcolor
	bigchargedbulletsparkle.color = GlobalColors.shipshotcolor

func _process(_delta: float) -> void:
	handlecolorchange()
	

func handlecolorchange():
	if GlobalColors.shipshotchanged or GlobalColors.shipchargedshotchanged:
		if GlobalColors.shipshotchanged:
			GlobalColors.shipshotchanged = false
		elif GlobalColors.shipchargedshotchanged:
			GlobalColors.shipchargedshotchanged = false
		self.self_modulate = GlobalColors.shipshotcolor
		bulletsparkle.color = GlobalColors.shipshotcolor
		bigbulletsparkle.color = GlobalColors.shipshotcolor
		chargedbulletsparkle.color = GlobalColors.shipshotcolor
		bigchargedbulletsparkle.color = GlobalColors.shipshotcolor
	
