extends Node2D

@onready var sfx_wrong = SFX.get_node("WrongBuzzer")

signal controller_pressed

func on_controller_pressed():
	sfx_wrong.play()
	controller_pressed.emit()
