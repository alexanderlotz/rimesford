extends Node

signal timeline_end(name)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(chatName):
	var new_dialog = Dialogic.start(chatName)
	add_child(new_dialog)
	# all our necessary signal functions get added to PlayerData here
	# can add more once necessary
	new_dialog.connect("dialogic_signal", PlayerData, 'callfunc')
	new_dialog.connect("timeline_end", self, "timeline_end")

# pass off the timeline end signal
func timeline_end(timeline_name):
	emit_signal("timeline_end", timeline_name)
