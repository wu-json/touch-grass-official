extends Node2D

const DIALOGUE = [
	"Hey there. I'm Capy...",
	"I'm a capybara, but I'm not very social...",
	"I like to hang out in this pond by myself and play games and watch anime on my phone...",
	"But the other day another capybara told me to \"touch some grass\".",
	"I thought I would give it a try since I'm feeling kind of down these days...",
	"Do you mind helping me out? All you need to do is touch as much grass as possible while avoiding other distractions.",
	"Awesome...thank you. Let's get started then..."
]

func _ready():
	for dialogue in DIALOGUE:
		$TextBox.queue_text(dialogue)

func _on_text_box_text_queue_exhausted():
	SceneSwitcher.change_scene("res://scenes/Play/Play.tscn")
