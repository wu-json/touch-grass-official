extends Node2D

signal hub_pressed

func on_hub_pressed():
	hub_pressed.emit()
