extends Node

# Declare member variables here. Examples:
var running_day

# Called when the node enters the scene tree for the first time.
func _ready():
	start_game()

func start_game():
#	var start_day = load(GameState.day_base_path + GameState.day_list[0]).instance()
#	add_child(start_day)
	play_day()

func play_day():
	running_day = load(GameState.day_base_path + GameState.day_list[GameState.day]).instance()
	add_child(running_day)
	running_day.connect("day_end", self, "_on_day_end")

func game_over():
	print("game over!")

func _on_day_end():
	# If there are days left, play the next day
	if (GameState.day < GameState.total_days - 1):
		GameState.day += 1
		running_day.queue_free()
		play_day()

	# No days left, gameover
	else:
		game_over()
