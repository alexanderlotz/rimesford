extends KinematicBody2D


# Declare member variables here. Examples:
export var speed = 200
export var feet = Vector2()

var face_front = true

# Called when the node enters the scene tree for the first time.
func _ready():
	feet.x = $Feet.position.x
	feet.y = $Feet.position.y
	print(feet)

# Returns a vector describing the current velocity of the character based
# on input received
func get_input():
	var velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	return velocity


func _physics_process(delta):
	var velocity = get_input()
	
	# Pick animaiton
	if velocity.y != 0:
		if velocity.y > 0:
			$Area2D/AnimatedSprite.animation = "walk_front"
			face_front = true
		else:
			$Area2D/AnimatedSprite.animation = "walk_back"
			face_front = false
	elif velocity.x != 0:
		$Area2D/AnimatedSprite.animation = "walk_side"
		$Area2D/AnimatedSprite.flip_h = not velocity.x < 0
	else:
		if face_front:
			$Area2D/AnimatedSprite.animation = "idle_front"
		else:
			$Area2D/AnimatedSprite.animation = "idle_back"


		
	# Move the character
	velocity = move_and_slide(velocity)

func get_feet():
	return feet
	
func set_anims(new_frames):
	$Area2D/AnimatedSprite.frames = new_frames
