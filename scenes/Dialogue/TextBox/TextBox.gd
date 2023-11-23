extends CanvasLayer

const CHAR_READ_RATE = 0.03

@onready var textbox_container = $TextBoxContainer
@onready var label = $TextBoxContainer/MarginContainer/HBoxContainer/Label

func _ready():
	hide_textbox()
	add_text("This text is going to be added!")

func hide_textbox():
	label.text = ""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text):
	label.text = next_text
	show_textbox()
	var tween = get_tree().create_tween()
	label.set_visible_ratio(0)
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text) * CHAR_READ_RATE)
	await tween.finished
