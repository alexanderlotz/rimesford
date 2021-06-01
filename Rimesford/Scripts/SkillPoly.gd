extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var center = get_viewport_rect().size / 2
var tri = Polygon2D.new()
export (int, -100, 100) var truth = 0
export (int, -100, 100) var kindess = 0
export (int) var polyScale = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	tri.color = Color(118/256.0, 208/256.0, 231/256.0, 0.2)
	add_child(tri)
	drawPoly()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	drawPoly();

func drawPoly():
	tri.polygon = PoolVector2Array([center, center + Vector2(polyScale * (kindess / 100.0), 0), center + Vector2(0, polyScale *(-1 * truth / 100.0))])
	
