extends Sprite2D

func _ready():
	self.scale = Vector2(0.5, 0.5)
	var viewport_size = get_viewport_rect().size
	position = Vector2((viewport_size.x / 2), (viewport_size.y / 2))

func _process(delta):
	pass
