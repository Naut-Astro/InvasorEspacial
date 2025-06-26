extends Node2D

@onready var starR: SpinBox = $Menu/Stars/Linhas/HBoxContainer/R
@onready var starG: SpinBox = $Menu/Stars/Linhas/HBoxContainer/G
@onready var starB: SpinBox = $Menu/Stars/Linhas/HBoxContainer/B
@onready var starA: HSlider = $Menu/Stars/Linhas/A

@onready var skyR: SpinBox = $Menu/Sky/Linhas/HBoxContainer/R
@onready var skyG: SpinBox = $Menu/Sky/Linhas/HBoxContainer/G
@onready var skyB: SpinBox = $Menu/Sky/Linhas/HBoxContainer/B

@onready var resOptBut: OptionButton = $Menu/Res/Linhas/OptionButton
@onready var screenOptBut: OptionButton = $Menu/Res/Linhas/OptionButton2


func _ready() -> void:
	initColorvalues()
	addResolutions()
	addScreenmodes()
	updateResolutionvalue()

func initColorvalues() -> void:
	starR.value = int(255 * GlobalColors.starcolor[0])
	starG.value = int(255 * GlobalColors.starcolor[1])
	starB.value = int(255 * GlobalColors.starcolor[2])
	starA.value = int(255 * GlobalColors.starcolor[3])
	
	skyR.value = int(255 * GlobalColors.bgcolor[0])
	skyG.value = int(255 * GlobalColors.bgcolor[1])
	skyB.value = int(255 * GlobalColors.bgcolor[2])
	

func addResolutions() -> void:
	for re in GlobalScreenCfg.resolutions:
		resOptBut.add_item(re)
	

func addScreenmodes() -> void:
	for mode in GlobalScreenCfg.windowmodes:
		screenOptBut.add_item(mode)
	

func updateResolutionvalue() -> void:
	var windowsize: String = str(get_window().size.x, "x", get_window().size.y)
	var resIndex = GlobalScreenCfg.resolutions.keys().find(windowsize)
	resOptBut.selected = resIndex
	

#Estrelas
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

#Céu
func _on_skyR_value_changed(value: float) -> void:
	GlobalColors.bgcolor[0] = skyR.value/255
	GlobalColors.bgchanged = true
func _on_skyG_value_changed(value: float) -> void:
	GlobalColors.bgcolor[1] = skyG.value/255
	GlobalColors.bgchanged = true
func _on_skyB_value_changed(value: float) -> void:
	GlobalColors.bgcolor[2] = skyB.value/255
	GlobalColors.bgchanged = true

#Resolução e Tela Cheia
func _on_resolution_item_selected(index: int) -> void:
	var key = resOptBut.get_item_text(index)
	GlobalScreenCfg.currentres = GlobalScreenCfg.resolutions[key]
	GlobalScreenCfg.alterScreen()
	
func _on_windowmode_item_selected(index: int) -> void:
	if index > 0:
		var key = screenOptBut.get_item_text(index)
		GlobalScreenCfg.currentwindowmode = GlobalScreenCfg.windowmodes[key]
		GlobalScreenCfg.alterScreen()
