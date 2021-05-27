extends KinematicBody2D


# Declare member variables here
export (String, "1", "2", "3", "4", "5", "6", "7", "8", "9") var house_num: String

var building_bottom = 0		# The y position of the bottom of the sprite image
var in_contact = false		# true when something is intersecting the building
var area_touching = 0		# usually contains a reference to the node currently touching


# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the sprite image
	$HouseSprite.animation = house_num
	var sprite_size = $HouseSprite.frames.get_frame($HouseSprite.animation, 0).get_size()
	print("Number: " + $HouseSprite.animation + "     Size: " + str(sprite_size))
	# Position + scale the BaseCollider
	$BaseCollider.position.y = sprite_size.y / 4
	$BaseCollider.shape.extents.y = sprite_size.y / 4
	$BaseCollider.shape.extents.x = (sprite_size.x / 2) - 10
	
	# Position + scale the BuildingArea
	$BuildingArea/AreaShape.shape.extents = Vector2(sprite_size.x / 2, sprite_size.y / 2)

	# Set the bottom of the building
	building_bottom = sprite_size.y / 2
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if typeof(area_touching) != TYPE_INT and area_touching.get_owner().name == "PixPlayer":
		var feet = to_local(area_touching.global_position).y + area_touching.get_owner().feet.y

		if in_contact:
			if feet <= building_bottom:
				$HouseSprite.z_index = 2
			else:
				$HouseSprite.z_index = -1



func _on_BuildingArea_area_entered(area):
	area_touching = area
	in_contact = true

func _on_BuildingArea_area_exited(area):
	in_contact = false
	$HouseSprite.z_index = 0
	
