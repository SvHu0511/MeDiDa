extends Node2D
@export var gate_type : String

var can_be_dropped = false
var slot_ref: Area2D
var delete_gate = false

#when dropping the piece, snap to a slot if possible
func _on_area_2d_dropped() -> void:
	if can_be_dropped:
		global_position = slot_ref.global_position
		slot_ref.occupied = true
		slot_ref.gate_type = gate_type
	elif delete_gate:
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("gate_slot") and !area.occupied:
		can_be_dropped = true
		slot_ref = area
	elif area.is_in_group("trashcan"):
		delete_gate = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("gate_slot"):
		can_be_dropped = false
		if area == slot_ref:
			slot_ref.occupied = false
			slot_ref.gate_type = ""
			slot_ref = null
	elif area.is_in_group("trashcan"):
		delete_gate = false
