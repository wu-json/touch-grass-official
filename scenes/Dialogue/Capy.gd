extends Sprite2D

var total_time = 0

func _process(delta):
	self.position.y = self.position.y + cos(total_time) * 0.1
	total_time += delta
