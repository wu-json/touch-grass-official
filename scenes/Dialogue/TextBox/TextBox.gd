extends CanvasLayer

const CHAR_READ_RATE = 0.03

@onready var textbox_container = $TextBoxContainer
@onready var label = $TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var tween = get_tree().create_tween()

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY

func _ready():
	hide_textbox()
	add_text("This text is going to be added! sdfsdf sdf sdfds fsd fsdf sssfdsfds fsdf sdf sdfds")
	
func _process(delta):
	match current_state:
		State.READY:
			pass
		State.READING:
			if Input.is_action_just_pressed("click"):
				change_state(State.FINISHED)
				tween.stop()
				label.set_visible_ratio(1)
		State.FINISHED:
			if Input.is_action_just_pressed('click'):
				print("Yo")
				change_state(State.READY)

func hide_textbox():
	label.text = ""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()
	
func add_text(next_text):
	label.text = next_text
	change_state(State.READING)
	show_textbox()
	label.set_visible_ratio(0)
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
