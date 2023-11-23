extends Sprite2D

var is_capy_going_right = true

var total_time = 0

func _ready():
	var viewport_size = get_viewport_rect().size
	var self_size = self.get_rect().size
	position = Vector2((viewport_size.x / 2) - self_size.x, (viewport_size.y / 2) + self_size.y)

func _process(delta):
	if (is_capy_going_right):
		self.flip_h = false
		if self.position.x < 800:
			self.position.x += 30 * delta
		else:
			is_capy_going_right = false
	else:
		self.flip_h = true
		if self.position.x > 400:
			self.position.x -= 30 * delta
		else:
			is_capy_going_right = true
			
	self.position.y = self.position.y + cos(total_time * 3) * 0.2
	total_time += delta
