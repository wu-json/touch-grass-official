extends CanvasLayer

const CHAR_READ_RATE = 0.03

# Adapted most of this from https://www.youtube.com/watch?v=QEHOiORnXIk&t=301s&ab_channel=JonTopielski
@onready var textbox_container = $TextBoxContainer
@onready var label = $TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var tween = get_tree().create_tween()

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

func _ready():
	hide_textbox()
	queue_text("1 hello mf saldkjflskdjflkdsaf")
	queue_text("2 hello mf saldkjflskdjflkdsaf")
	queue_text("3 hello mf saldkjflskdjflkdsaf")
	queue_text("4 hello mf saldkjflskdjflkdsaf")
	
func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("click"):
				change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed('click'):
				tween.kill()
				label.set_visible_ratio(1)
				tween = get_tree().create_tween()
				change_state(State.READY)
				
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
