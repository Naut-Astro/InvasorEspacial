extends Node

const SAVEFILE = "user://saves/savefile.tres"

var savedata:= SaveDataRes.new()

func _ready():
	DirAccess.make_dir_absolute("user://Saves")
	

func _save():
	ResourceSaver.save(savedata, SAVEFILE)
	

func _load():
	if FileAccess.file_exists(SAVEFILE):
		savedata = ResourceLoader.load(SAVEFILE).duplicate(true)
	
