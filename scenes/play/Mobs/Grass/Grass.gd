extends Node2D

signal grass_pressed

func on_grass_pressed():
	grass_pressed.emit()
