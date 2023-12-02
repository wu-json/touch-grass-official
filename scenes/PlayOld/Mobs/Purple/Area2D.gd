extends Area2D

var parent

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		parent.on_purple_pressed()
		parent.queue_free()

func _ready():
	parent = get_parent()
