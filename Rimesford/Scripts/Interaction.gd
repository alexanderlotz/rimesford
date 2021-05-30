extends Node2D

signal task_completed

# Declare member variables here. Examples:
var completed = false
export var dialog_name : String
export var tip_text: String

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProximityLable.enabled = true
	if tip_text == "":
		$ProximityLable.set_tip_text("Press Space to interact")
	else:
		$ProximityLable.set_tip_text(tip_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Only allow interaction if the task is not yet completed
	if not completed and $ProximityLable.is_visible():
		# Upon interaction start the appropriate dialogue
		if Input.is_action_pressed("ui_accept"):
			completed = true
			$ProximityLable.enabled = false	# disable the label
			if dialog_name == "":
				print("Uh oh! no dialogue name was provided!")
			else:
				$CanvasLayer/Runner.start(dialog_name)

func _on_Runner_timeline_end(name):
	emit_signal("task_completed")
