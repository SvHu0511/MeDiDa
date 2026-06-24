extends Node2D
# Connects gates/gate slots and transfers their outputs. Parent must be gate or slot (for now?)

var wire_head = preload("res://Szenen/board/wire_head.tscn")

# Spawns wireHead if it doesn't have one as a child
func _ready() -> void:
	if find_child("WireHead") == null:
		var instance = wire_head.instantiate()
		add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	queue_redraw()

# Draws a cable between the wire base and head
func _draw() -> void:
	var points = PackedVector2Array()
	var headPos = $WireHead.position
	points.append(Vector2(0,0))
	points.append(Vector2(headPos.x/2, 0))
	points.append(Vector2(headPos.x/2, headPos.y))
	points.append(headPos)
	draw_polyline(points, Color.RED, 4)
