extends Timer

const GAME_TIME_SECONDS = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	self.start(GAME_TIME_SECONDS)
	self.set_one_shot(true)
	$GameTimerLabel.set_text(str(GAME_TIME_SECONDS))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$GameTimerLabel.set_text(str(int(self.time_left)))
