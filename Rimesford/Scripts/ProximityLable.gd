tool
extends Area2D


export var tip_text : String
export var tip_area : Shape2D
export var label_offset : Vector2

var zero_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.visible = false
	$Panel/Label.text = tip_text
	if tip_area != null:
		$CollisionShape2D.shape = tip_area
	else:
		$CollisionShape2D.shape = CircleShape2D.new()
	
	zero_pos = $Panel.rect_position
	$Panel.rect_position = zero_pos + label_offset
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CollisionShape2D.shape = tip_area
#	$Panel.rect_position = zero_pos + label_offset

func _on_Area2D_area_entered(area):
	if area.get_owner().is_in_group("player"):
		$Panel.visible = true


func _on_Area2D_area_exited(area):
	if area.get_owner().is_in_group("player"):
		$Panel.visible = false
