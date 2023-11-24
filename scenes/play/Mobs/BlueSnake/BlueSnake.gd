extends Node2D

@onready var sfx_wrong = SFX.get_node("WrongBuzzer")

signal blue_snake_pressed

func on_blue_snake_pressed():
	sfx_wrong.play()
	blue_snake_pressed.emit()
