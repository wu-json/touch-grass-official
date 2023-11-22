extends Label

func _ready():
	add_theme_font_size_override("font_size", 30)
	var viewport_size = get_viewport_rect().size
	position = Vector2(viewport_size.x - 120, 30)
