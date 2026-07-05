extends Node2D
var can_be_dropped: bool
var input_slot_ref: Area2D

var input: bool
var prev_input: bool

# If WireHead spawns on an input slot, apply logic and remove drag-n-drop (fixed wires)
func _ready() -> void:
	await get_tree().process_frame
	for area in $Area2D.get_overlapping_areas():
		if area.is_in_group("input_slot"):
			can_be_dropped = true
			input_slot_ref = area
			_on_area_2d_dropped()
			$Area2D.stop_drag = true

func _process(_delta: float) -> void:
	if input_slot_ref != null and input != prev_input:
		input_slot_ref.input = input
		prev_input = input

func _on_area_2d_area_entered(area: Area2D) -> void:
	# checks if inputSlot belongs to the same parent slot/gate as the wire
	if area in get_parent().get_parent().get_children():
		return
	
	if area.is_in_group("input_slot"):
		can_be_dropped = true
		input_slot_ref = area


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("input_slot"):
		can_be_dropped = false
		if input_slot_ref != null:
			input_slot_ref.disconnect_wire()
			input_slot_ref = null
		if $Area2D.dragging == false:
			_on_area_2d_dropped()

# Drops on input slots, goes back otherwise
func _on_area_2d_dropped() -> void:
	if can_be_dropped:
		global_position = input_slot_ref.global_position
		input_slot_ref.connect_wire(input)
	else:
		position = Vector2(0,0)
