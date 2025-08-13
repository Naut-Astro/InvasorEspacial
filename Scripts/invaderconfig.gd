extends Node2D

@onready var starR: SpinBox = $Menu/Stars/Linhas/HBoxContainer/R
@onready var starG: SpinBox = $Menu/Stars/Linhas/HBoxContainer/G
@onready var starB: SpinBox = $Menu/Stars/Linhas/HBoxContainer/B
@onready var starA: HSlider = $Menu/Stars/Linhas/A

@onready var skyR: SpinBox = $Menu/Sky/Linhas/HBoxContainer/R
@onready var skyG: SpinBox = $Menu/Sky/Linhas/HBoxContainer/G
@onready var skyB: SpinBox = $Menu/Sky/Linhas/HBoxContainer/B

@onready var shipOutlineR: SpinBox = $Menu/Ship/Linhas/HBoxContainer2/R
@onready var shipOutlineG: SpinBox = $Menu/Ship/Linhas/HBoxContainer2/G
@onready var shipOutlineB: SpinBox = $Menu/Ship/Linhas/HBoxContainer2/B
@onready var shipOutlineA: HSlider = $Menu/Ship/Linhas/A2

@onready var shipFillR: SpinBox = $Menu/Ship/Linhas/HBoxContainer3/R
@onready var shipFillG: SpinBox = $Menu/Ship/Linhas/HBoxContainer3/G
@onready var shipFillB: SpinBox = $Menu/Ship/Linhas/HBoxContainer3/B
@onready var shipFillA: HSlider = $Menu/Ship/Linhas/A3

@onready var shipShotR: SpinBox = $Menu/Ship/Linhas/HBoxContainer4/R
@onready var shipShotG: SpinBox = $Menu/Ship/Linhas/HBoxContainer4/G
@onready var shipShotB: SpinBox = $Menu/Ship/Linhas/HBoxContainer4/B

@onready var smoke1R: SpinBox = $Menu/Ship/Linhas/HBoxContainer5/R
@onready var smoke1G: SpinBox = $Menu/Ship/Linhas/HBoxContainer5/G
@onready var smoke1B: SpinBox = $Menu/Ship/Linhas/HBoxContainer5/B

@onready var smoke2R: SpinBox = $Menu/Ship/Linhas/HBoxContainer6/R
@onready var smoke2G: SpinBox = $Menu/Ship/Linhas/HBoxContainer6/G
@onready var smoke2B: SpinBox = $Menu/Ship/Linhas/HBoxContainer6/B


@onready var resOptBut: OptionButton = $Menu/Res/Linhas/OptionButton
@onready var screenOptBut: OptionButton = $Menu/Res/Linhas/OptionButton2


func _ready() -> void:
	initColorvalues()
	addResolutions()
	addScreenmodes()
	updateResolutionvalue()

func initColorvalues() -> void: #Deixar os botões com valor inicial correto
	starR.value = int(255 * GlobalColors.starcolor[0])
	starG.value = int(255 * GlobalColors.starcolor[1])
	starB.value = int(255 * GlobalColors.starcolor[2])
	starA.value = int(255 * GlobalColors.starcolor[3])
	
	skyR.value = int(255 * GlobalColors.bgcolor[0])
	skyG.value = int(255 * GlobalColors.bgcolor[1])
	skyB.value = int(255 * GlobalColors.bgcolor[2])
	
	shipOutlineR.value = int(255 * GlobalColors.shipoutlinecolor[0])
	shipOutlineG.value = int(255 * GlobalColors.shipoutlinecolor[1])
	shipOutlineB.value = int(255 * GlobalColors.shipoutlinecolor[2])
	shipOutlineA.value = int(255 * GlobalColors.shipoutlinecolor[3])
	
	shipFillR.value = int(255 * GlobalColors.shipfillcolor[0])
	shipFillG.value = int(255 * GlobalColors.shipfillcolor[1])
	shipFillB.value = int(255 * GlobalColors.shipfillcolor[2])
	shipFillA.value = int(255 * GlobalColors.shipfillcolor[3])
	
	shipShotR.value = int(255 * GlobalColors.shipshotcolor[0])
	shipShotG.value = int(255 * GlobalColors.shipshotcolor[1])
	shipShotB.value = int(255 * GlobalColors.shipshotcolor[2])
	
	smoke1R.value = int(255 * GlobalColors.smokeinitialcolor[0])
	smoke1G.value = int(255 * GlobalColors.smokeinitialcolor[1])
	smoke1B.value = int(255 * GlobalColors.smokeinitialcolor[2])
	
	smoke2R.value = int(255 * GlobalColors.smokeendcolor[0])
	smoke2G.value = int(255 * GlobalColors.smokeendcolor[1])
	smoke2B.value = int(255 * GlobalColors.smokeendcolor[2])
	

func addResolutions() -> void: #Adicionar resoluções no menu dropdown
	for re in GlobalScreenCfg.resolutions:
		resOptBut.add_item(re)
	

func updateResolutionvalue() -> void: #Deixar o menu de resolução com valor inicial correto
	var windowsize: String = str(get_window().size.x, "x", get_window().size.y)
	var resIndex = GlobalScreenCfg.resolutions.keys().find(windowsize)
	resOptBut.selected = resIndex
	

func addScreenmodes() -> void: #Adicionar modos de tela no menu dropdown
	for mode in GlobalScreenCfg.windowmodes:
		screenOptBut.add_item(mode)
	

#Alterar cores das Estrelas
func _on_starR_value_changed(value: float) -> void:
	GlobalColors.starcolor[0] = starR.value/255
	GlobalColors.starchanged = true
func _on_starG_value_changed(value: float) -> void:
	GlobalColors.starcolor[1] = starG.value/255
	GlobalColors.starchanged = true
func _on_starB_value_changed(value: float) -> void:
	GlobalColors.starcolor[2] = starB.value/255
	GlobalColors.starchanged = true
func _on_starA_value_changed(value: float) -> void:
	GlobalColors.starcolor[3] = starA.value/255
	GlobalColors.starchanged = true

#Alterar cor do Céu
func _on_skyR_value_changed(value: float) -> void:
	GlobalColors.bgcolor[0] = skyR.value/255
	GlobalColors.bgchanged = true
func _on_skyG_value_changed(value: float) -> void:
	GlobalColors.bgcolor[1] = skyG.value/255
	GlobalColors.bgchanged = true
func _on_skyB_value_changed(value: float) -> void:
	GlobalColors.bgcolor[2] = skyB.value/255
	GlobalColors.bgchanged = true

#Alterar Resolução e Tela Cheia
func _on_resolution_item_selected(index: int) -> void:
	var key = resOptBut.get_item_text(index)
	GlobalScreenCfg.currentres = GlobalScreenCfg.resolutions[key]
	GlobalScreenCfg.alterScreen()
func _on_windowmode_item_selected(index: int) -> void:
	if index > 0:
		var key = screenOptBut.get_item_text(index)
		GlobalScreenCfg.currentwindowmode = GlobalScreenCfg.windowmodes[key]
		GlobalScreenCfg.alterScreen()

#Alterar Cor do Outline da Nave
func _on_shipOutlineR_value_changed(value: float) -> void:
	GlobalColors.shipoutlinecolor[0] = shipOutlineR.value/255
	GlobalColors.shipoutlinechanged = true
func _on_shipOutlineG_value_changed(value: float) -> void:
	GlobalColors.shipoutlinecolor[1] = shipOutlineG.value/255
	GlobalColors.shipoutlinechanged = true
func _on_shipOutlineB_value_changed(value: float) -> void:
	GlobalColors.shipoutlinecolor[2] = shipOutlineB.value/255
	GlobalColors.shipoutlinechanged = true
func _on_shipOutlineA_value_changed(value: float) -> void:
	GlobalColors.shipoutlinecolor[3] = shipOutlineA.value/255
	GlobalColors.shipoutlinechanged = true

#Alterar cor do preenchimento da Nave
func _on_shipFillR_value_changed(value: float) -> void:
	GlobalColors.shipfillcolor[0] = shipFillR.value/255
	GlobalColors.shipfillchanged = true
func _on_shipFillG_value_changed(value: float) -> void:
	GlobalColors.shipfillcolor[1] = shipFillG.value/255
	GlobalColors.shipfillchanged = true
func _on_shipFillB_value_changed(value: float) -> void:
	GlobalColors.shipfillcolor[2] = shipFillB.value/255
	GlobalColors.shipfillchanged = true
func _on_shipFillA_value_changed(value: float) -> void:
	GlobalColors.shipfillcolor[3] = shipFillA.value/255
	GlobalColors.shipfillchanged = true

#Alterar cor dos tiros
func _on_shipShotR_value_changed(value: float) -> void:
	GlobalColors.shipshotcolor[0] = shipShotR.value/255
	GlobalColors.shipshotchanged = true
	GlobalColors.shipchargedshotchanged = true
func _on_shipShotG_value_changed(value: float) -> void:
	GlobalColors.shipshotcolor[1] = shipShotG.value/255
	GlobalColors.shipshotchanged = true
	GlobalColors.shipchargedshotchanged = true
func _on_shipShotB_value_changed(value: float) -> void:
	GlobalColors.shipshotcolor[2] = shipShotB.value/255
	GlobalColors.shipshotchanged = true
	GlobalColors.shipchargedshotchanged = true

#Alterar cor inicial da fumaça
func _on_smoke1R_value_changed(value: float) -> void:
	GlobalColors.smokeinitialcolor[0] = smoke1R.value/255
	GlobalColors.smokecolorchanged = true
func _on_smoke1G_value_changed(value: float) -> void:
	GlobalColors.smokeinitialcolor[1] = smoke1G.value/255
	GlobalColors.smokecolorchanged = true
func _on_smoke1B_value_changed(value: float) -> void:
	GlobalColors.smokeinitialcolor[2] = smoke1B.value/255
	GlobalColors.smokecolorchanged = true

#Alterar cor final da fumaça
func _on_smoke2R_value_changed(value: float) -> void:
	GlobalColors.smokeendcolor[0] = smoke2R.value/255
	GlobalColors.smokecolorchanged = true
func _on_smoke2G_value_changed(value: float) -> void:
	GlobalColors.smokeendcolor[1] = smoke2G.value/255
	GlobalColors.smokecolorchanged = true
func _on_smoke2B_value_changed(value: float) -> void:
	GlobalColors.smokeendcolor[2] = smoke2B.value/255
	GlobalColors.smokecolorchanged = true


func _process(_delta: float) -> void:
	if GlobalColors.updateoutlinealpha == true:
		shipOutlineA.value = 255 * GlobalColors.shipoutlinecolor[3]
		GlobalColors.updateoutlinealpha = false
	
