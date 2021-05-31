extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Special case for selecting sprites for the Day 1 interaction
	# YIKES
	var char_two_frames = 0                 # Character 2 Frames
	if name == "Day1" and PlayerData.character == "frog":
		char_two_frames = load("res://Assets/Art/Sprites/Pixel/SkunkAnims.tres")
	else:
		char_two_frames = load("res://Assets/Art/Sprites/Pixel/RabbitAnims.tres")

	$FoxRabbitConvo/Rabbit.frames = char_two_frames
