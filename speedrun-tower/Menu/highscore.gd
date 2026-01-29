extends Node

var config = ConfigFile.new()
var path = "user://higscore.cfg"
var value = 0

func save():
	config.load(path)
	config.set_value("SCORE", "score", value)
	config.save(path)

func _ready() -> void:
	config.load(path)
	config.get_value("SCORE", "score", 0)
