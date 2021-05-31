extends Node2D

signal day_start
signal day_end

export var total_tasks : int
var tasks_left : int

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the correct animations for the player
	tasks_left = total_tasks

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_task_completed():
	tasks_left -= 1
	if tasks_left == 0:
		emit_signal("day_end")
