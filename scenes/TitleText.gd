extends Sprite2D


func _ready():
	var viewport_size = get_viewport_rect().size
	position = Vector2((viewport_size.x / 2), self.texture.get_height())

func _process(_delta):
	pass
