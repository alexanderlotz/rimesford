extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# every time we call this start function we need to know what the chat'll be
	$Runner.start('exChat')
