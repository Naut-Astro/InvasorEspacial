extends CanvasLayer

const DEFAULTRESOLUTION := Vector2i(1280,720)
const DEFAULTWINDOWMODE := DisplayServer.WINDOW_MODE_WINDOWED
const resolutions = {
	"1920x1080": Vector2i(1920,1080),
	"1600x900": Vector2i(1600,900),
	"1440x810": Vector2i(1440,810),
	"1280x720": Vector2i(1280,720),
	"1024x576": Vector2i(1024,576),
	"800x450": Vector2i(800,450)
}
const windowmodes = {
	"Tela Cheia": DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN,
	"Janela sem bordas": DisplayServer.WINDOW_MODE_FULLSCREEN,
	"Janela": DisplayServer.WINDOW_MODE_WINDOWED
}

var currentres = resolutions["1280x720"]
var currentwindowmode = windowmodes["Janela"]

func _ready() -> void:
	SaveLoadManager._load()
	currentres = SaveLoadManager.savedata.currentres
	currentwindowmode = SaveLoadManager.savedata.currentwindowmode
	alterScreen()
	

func alterScreen() -> void:
	get_window().set_size(currentres)
	DisplayServer.window_set_mode(currentwindowmode)
	centerwindow()
	SaveLoadManager.savedata.currentres = currentres
	SaveLoadManager.savedata.currentwindowmode = currentwindowmode
	SaveLoadManager._save()

func centerwindow() -> void:
	var screencenter = DisplayServer.screen_get_position() + DisplayServer.screen_get_size()/2
	var windowsize = get_window().get_size_with_decorations()
	get_window().set_position(screencenter - windowsize/2)
	
