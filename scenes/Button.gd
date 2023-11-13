extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = get_viewport_rect().size
	position = Vector2((viewport_size.x / 2) - (self.get_rect().size.x / 2), viewport_size.y - 150)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
