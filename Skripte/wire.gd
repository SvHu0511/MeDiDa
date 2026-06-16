extends Node2D
var can_be_dropped: bool
var input_slot_ref: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

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
	draw_polyline(points, Color.BLACK, 4)

# Drops on input slots, goes back otherwise
func _on_area_2d_dropped() -> void:
	if can_be_dropped:
		#TODO: prevent dropping on input slots of the parent gate
		$WireHead.global_position = input_slot_ref.global_position
		input_slot_ref.wire_ref = self
	else:
		$WireHead.position = Vector2(0,0)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("input_slot"):
		can_be_dropped = true
		input_slot_ref = area

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("input_slot"):
		can_be_dropped = false
		input_slot_ref.wire_ref = null
		input_slot_ref = null
