extends Node2D

@onready var sfx_wrong = SFX.get_node("WrongBuzzer")

signal uwu_pressed

func on_uwu_pressed():
	sfx_wrong.play()
	uwu_pressed.emit()
