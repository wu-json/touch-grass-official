extends Node2D

signal grass_pressed(points)

func on_grass_pressed(points):
	grass_pressed.emit(points)
