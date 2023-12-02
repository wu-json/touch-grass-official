extends Node2D

@onready var sfx_wrong = SFX.get_node("WrongBuzzer")

signal hub_pressed

func on_hub_pressed():
	sfx_wrong.play()
	hub_pressed.emit()
