extends Area2D

signal pressed(points)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		pressed.emit(1)
		get_parent().queue_free()

func _ready():
	pass

func _process(delta):
	pass
