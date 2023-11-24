extends Node2D

@onready var sfx_wrong = SFX.get_node("WrongBuzzer")

signal purple_pressed

func on_purple_pressed():
	sfx_wrong.play()
	purple_pressed.emit()
