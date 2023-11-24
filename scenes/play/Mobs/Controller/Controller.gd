extends Node2D

signal controller_pressed

func on_controller_pressed():
	controller_pressed.emit()
