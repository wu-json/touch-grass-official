extends Node2D

@onready var sfx_grass_ruffle = SFX.get_node("GrassRuffle")

signal grass_pressed

func on_grass_pressed():
	sfx_grass_ruffle.play()
	grass_pressed.emit()
