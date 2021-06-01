extends Node2D

enum Character {FROG, SKUNK}
var focusedChar = 0
var offset = 250
onready var sprites = get_children()
#onready var outlineShader = preload("res://Assets/Art/Shaders/outline.shader")

func _ready():
	for i in range(sprites.size()):
		sprites[i].position = Vector2(get_viewport_rect().size / 2) + Vector2(i * offset, 0)
	sprites[focusedChar].scale = Vector2(1.3, 1.3)
	#sprites[focusedChar].material.shader = outlineShader

func _process(delta):
	get_input()

func get_input():
	if(Input.is_action_just_pressed("left")):
		focusedChar = max(focusedChar - 1, -1 * (Character.size() - 1))
		update_pos()
	if(Input.is_action_just_pressed("right")):
		focusedChar = min(focusedChar + 1, 0)
		update_pos()

func update_pos():
	for i in range(sprites.size()):
		do_tween(i)

func do_tween(pos):
	print(focusedChar)
	var tween = Tween.new()
	add_child(tween)
	
	tween.interpolate_property(sprites[pos], "position",
		sprites[pos].position, Vector2(get_viewport_rect().size / 2) + Vector2(pos * offset + focusedChar * offset, 0), 0.15,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	#sprites[pos].material.shader = outlineShader if -1 * pos == focusedChar else null
	#sprites[pos].set_material(ShaderMaterial.new())
	#sprites[pos].material.set_shader(outlineShader)
	var scaleSz = (1.3 if -1 * pos == focusedChar else 1.0)
	tween.interpolate_property(sprites[pos], "scale",
		sprites[pos].scale, Vector2(scaleSz,scaleSz), 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	#should free the tween after interpolation
	#tween.queue_free()
