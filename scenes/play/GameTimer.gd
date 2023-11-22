extends Timer

const game_time_seconds = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	self.start(game_time_seconds)
	self.set_one_shot(true)
	$GameTimerLabel.set_text(str(game_time_seconds))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$GameTimerLabel.set_text(str(int(self.time_left)))
