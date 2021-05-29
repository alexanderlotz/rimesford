extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(chatName):
	var new_dialog = Dialogic.start(chatName)
	add_child(new_dialog)
	
	# all our necessary signal functions get added to PlayerData here
	# can add more once necessary
	new_dialog.connect("dialogic_signal", PlayerData, 'callfunc')
	
	
