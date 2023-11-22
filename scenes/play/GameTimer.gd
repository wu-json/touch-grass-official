extends Timer

const game_time_seconds = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	self.start(game_time_seconds)
	self.set_one_shot(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(int(self.time_left))
