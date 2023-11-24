extends CanvasLayer

const CHAR_READ_RATE = 0.03

# Adapted most of this from https://www.youtube.com/watch?v=QEHOiORnXIk&t=301s&ab_channel=JonTopielski
# The tutorial was made using Godot 3 but I adapted it to Godot 4 (Tweens are no longer a node).
@onready var textbox_container = $TextBoxContainer
@onready var label = $TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var tween
@onready var sfx_select = SFX.get_node("Select")

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

signal text_queue_exhausted

func _ready():
	hide_textbox()
	
func _process(_delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				display_text()
			else:
				hide_textbox()
		State.READING:
			if Input.is_action_just_pressed("click"):
				change_state(State.FINISHED)
				tween.kill()
				label.set_visible_ratio(1)
		State.FINISHED:
			if Input.is_action_just_pressed('click'):
				sfx_select.play()
				change_state(State.READY)
				if text_queue.is_empty():
					text_queue_exhausted.emit()
				
func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	label.text = ""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	change_state(State.READING)
	show_textbox()
	label.set_visible_ratio(0)
	tween = get_tree().create_tween()
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text) * CHAR_READ_RATE)
	await tween.finished
	change_state(State.FINISHED)

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			pass
		State.READING:
			pass
		State.FINISHED:
			pass
