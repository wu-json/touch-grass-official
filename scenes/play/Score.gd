extends Label

func _ready():
	var viewport_size = get_viewport_rect().size
	position = Vector2(viewport_size.x - 100, 20)
	add_theme_font_size_override("font_size", 30)

func _process(delta):
	pass
