extends Node

var config = ConfigFile.new()
var path = "user://higscore.cfg"
var ml = 0

func save():
	config.load(path)
	config.set_value("SCORE", "score", ml)
	config.save(path)

func _ready() -> void:
	config.load(path)
	ml = config.get_value("SCORE", "score", 0)
